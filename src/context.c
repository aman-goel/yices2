/*
 * ASSERTION CONTEXT
 */

#include "memalloc.h"
#include "term_utils.h"
#include "yices_extensions.h"
#include "arith_buffer_terms.h"

#include "context.h"
#include "eq_learner.h"
#include "idl_floyd_warshall.h"
#include "rdl_floyd_warshall.h"


#define TRACE_SUBST  0
#define TRACE_EQ_ABS 0
#define TRACE_DL     0
#define TRACE        0

#if TRACE_SUBST || TRACE_EQ_ABS || TRACE_DL || TRACE

#include <stdio.h>
#include "term_printer.h"

#endif



/***************
 *  UTILITIES  *
 **************/

/*
 * Allocate and initialize ctx->subst
 */
static pseudo_subst_t *context_get_subst(context_t *ctx) {
  pseudo_subst_t *tmp;

  tmp = ctx->subst;
  if (tmp == NULL) {
    tmp = (pseudo_subst_t *) safe_malloc(sizeof(pseudo_subst_t));
    init_pseudo_subst(tmp, 0);
    ctx->subst = tmp;
  }

  return tmp;
}


/*
 * Free ctx->subst
 */
static void context_free_subst(context_t *ctx) {
  if (ctx->subst != NULL) {
    delete_pseudo_subst(ctx->subst);
    safe_free(ctx->subst);
    ctx->subst = NULL;
  }
}


/*
 * Allocate and initialize mark vectors
 */
static mark_vector_t *context_get_marks(context_t *ctx) {
  mark_vector_t *tmp;

  tmp = ctx->marks;
  if (tmp == NULL) {
    tmp = (mark_vector_t *) safe_malloc(sizeof(mark_vector_t));
    init_mark_vector(tmp, 100, WHITE);
    ctx->marks = tmp;
  }

  return tmp;
}


/*
 * Free the mark vector
 */
static void context_free_marks(context_t *ctx) {
  if (ctx->marks != NULL) {
    delete_mark_vector(ctx->marks);
    safe_free(ctx->marks);
    ctx->marks = NULL;
  }
}


/*
 * There are two internal caches for visiting formulas/terms.
 * - the 'cache' uses a bitvector implementation and should be 
 *   better for operations that visit many terms.
 * - the 'small_cache' uses a hash table and should be better
 *   for operations that visit a small number of terms.
 */

/*
 * Allocate and initialize the internal small_cache if needed
 */
static int_hset_t *context_get_small_cache(context_t *ctx) {
  int_hset_t *tmp;

  tmp = ctx->small_cache;
  if (tmp == NULL) {
    tmp = (int_hset_t *) safe_malloc(sizeof(int_hset_t));
    init_int_hset(tmp, 32);
    ctx->small_cache = tmp;
  }
  return tmp;
}


/*
 * Empty the small_cache
 */
static void context_reset_small_cache(context_t *ctx) {
  int_hset_t *tmp;

  tmp = ctx->small_cache;
  if (tmp != NULL) {
    int_hset_reset(tmp);
  }
}

/*
 * Free the small_cache
 */
static void context_free_small_cache(context_t *ctx) {
  int_hset_t *tmp;

  tmp = ctx->small_cache;
  if (tmp != NULL) {
    delete_int_hset(tmp);
    safe_free(tmp);
    ctx->small_cache = NULL;
  }
}


/*
 * Allocate and initialize the cache
 */
static int_bvset_t *context_get_cache(context_t *ctx) {
  int_bvset_t *tmp;

  tmp = ctx->cache;
  if (tmp == NULL) {
    tmp = (int_bvset_t *) safe_malloc(sizeof(int_bvset_t));
    init_int_bvset(tmp, 0);
    ctx->cache = tmp;
  }

  return tmp;
}



/*
 * Free the cache
 */
static void context_free_cache(context_t *ctx) {
  int_bvset_t *tmp;

  tmp = ctx->cache;
  if (tmp != NULL) {
    delete_int_bvset(tmp);
    safe_free(tmp);
    ctx->cache = NULL;
  }
}



/*
 * There are two buffers for internal construction of polynomials
 * - arith_buffer is more expensive (requires more memory) but 
 *   it supports more operations (e.g., term constructors in yices_api.c
 *   take arith_buffers as arguments).
 * - poly_buffer is a cheaper data structure, but it does not support 
 *   all the operations
 */

/*
 * Allocate the arithmetic buffer
 */
static arith_buffer_t *context_get_arith_buffer(context_t *ctx) {
  arith_buffer_t *tmp;

  tmp = ctx->arith_buffer;
  if (tmp == NULL) {
    tmp = yices_new_arith_buffer();
    ctx->arith_buffer = tmp;
  }
  
  return tmp;
}


/*
 * Free the arithmetic buffer
 */
static void context_free_arith_buffer(context_t *ctx) {
  arith_buffer_t *tmp;

  tmp = ctx->arith_buffer;
  if (tmp != NULL) {
    yices_free_arith_buffer(tmp);
    ctx->arith_buffer = NULL;
  }
}



/*
 * Allocate the poly_buffer
 */
static poly_buffer_t *context_get_poly_buffer(context_t *ctx) {
  poly_buffer_t *tmp;

  tmp = ctx->poly_buffer;
  if (tmp == NULL) {
    tmp = (poly_buffer_t *) safe_malloc(sizeof(poly_buffer_t));
    init_poly_buffer(tmp);
    ctx->poly_buffer = tmp;
  }

  return tmp;
}


/*
 * Free it
 */
static void context_free_poly_buffer(context_t *ctx) {
  poly_buffer_t *tmp;

  tmp = ctx->poly_buffer;
  if (tmp != NULL) {
    delete_poly_buffer(tmp);
    safe_free(tmp);
    ctx->poly_buffer = NULL;
  }
}


/*
 * Reset it
 */
static void context_reset_poly_buffer(context_t *ctx) {
  if (ctx->poly_buffer != NULL) {
    reset_poly_buffer(ctx->poly_buffer);
  }
}




/*
 * Difference-logic profile: 
 * - allocate and initialize the structure if it does not exist
 */
static dl_data_t *context_get_dl_profile(context_t *ctx) {
  dl_data_t *tmp;

  tmp = ctx->dl_profile;
  if (tmp == NULL) {
    tmp = (dl_data_t *) safe_malloc(sizeof(dl_data_t));
    q_init(&tmp->sum_const);
    tmp->num_vars = 0;
    tmp->num_atoms = 0;
    tmp->num_eqs = 0;
    ctx->dl_profile = tmp;
  }

  return tmp;
}


/*
 * Free the profile record
 */
static void context_free_dl_profile(context_t *ctx) {
  dl_data_t *tmp;

  tmp = ctx->dl_profile;
  if (tmp != NULL) {
    q_clear(&tmp->sum_const);
    safe_free(tmp);
    ctx->dl_profile = NULL;
  }
}





/*****************************
 *  FORMULA SIMPLIFICATION   *
 ****************************/


/*
 * Check whether t is true or false (i.e., mapped to 'true_occ' or 'false_occ'
 * in the internalization table.
 * - t must be a root in the internalization table
 */
static bool term_is_true(context_t *ctx, term_t t) {
  bool tt;

  assert(intern_tbl_is_root(&ctx->intern, t));
  tt = is_pos_term(t);
  t = unsigned_term(t);
  
  return intern_tbl_root_is_mapped(&ctx->intern, t) && 
    intern_tbl_map_of_root(&ctx->intern, t) == bool2code(tt);
}

static bool term_is_false(context_t *ctx, term_t t) {
  bool tt;

  assert(intern_tbl_is_root(&ctx->intern, t));
  tt = is_pos_term(t);
  t = unsigned_term(t);
  
  return intern_tbl_root_is_mapped(&ctx->intern, t) && 
    intern_tbl_map_of_root(&ctx->intern, t) == bool2code(! tt);
}


/*
 * All functions below attempt to rewrite a (boolean) term r to an
 * equivalent (boolean) term q. They return NULL_TERM if the
 * simplification fails.
 */
static term_t simplify_select(context_t *ctx, term_t r) {
  select_term_t *sel;
  composite_term_t *tuple;
  term_t t;

  sel = select_term_desc(ctx->terms, r);  
  t = intern_tbl_get_root(&ctx->intern, sel->arg);
  if (term_kind(ctx->terms, t) == TUPLE_TERM) {
    // select i (tuple ... t_i ...) --> t_i
    tuple = tuple_term_desc(ctx->terms, t);
    return tuple->arg[sel->idx];
  }

  return NULL_TERM;
}

static term_t simplify_bit_select(context_t *ctx, term_t r) {
  select_term_t *sel;
  term_t t;

  sel = bit_term_desc(ctx->terms, r);
  t = intern_tbl_get_root(&ctx->intern, sel->arg);
  return extract_bit(ctx->terms, t, sel->idx);
}

static term_t simplify_arith_geq0(context_t *ctx, term_t r) {
  term_table_t *terms;
  composite_term_t *d;
  term_t t, x, y;

  terms = ctx->terms;
  t = arith_ge_arg(terms, r);
  t = intern_tbl_get_root(&ctx->intern, t);
  if (is_ite_term(terms, t)) {
    /*
     * (ite c x y) >= 0 --> c  if (x >= 0) and (y < 0)
     * (ite c x y) >= 0 --> ~c if (x < 0) and (y >= 0)
     */
    d = ite_term_desc(terms, t);
    x = intern_tbl_get_root(&ctx->intern, d->arg[1]);
    y = intern_tbl_get_root(&ctx->intern, d->arg[2]);

    if (arith_term_is_nonneg(terms, x) && 
	arith_term_is_negative(terms, y)) {
      return d->arg[0];
    }

    if (arith_term_is_negative(terms, x) && 
	arith_term_is_nonneg(terms, y)) {
      return opposite_term(d->arg[0]);
    }
  }

  return NULL_TERM;
}

static term_t simplify_arith_eq0(context_t *ctx, term_t r) {
  term_table_t *terms;
  composite_term_t *d;
  term_t t, x, y;

  terms = ctx->terms;
  t = arith_eq_arg(terms, r);
  t = intern_tbl_get_root(&ctx->intern, t);
  if (is_ite_term(terms, t)) {
    /*
     * (ite c 0 y) == 0 -->  c if y != 0
     * (ite c x 0) == 0 --> ~c if x != 0
     */
    d = ite_term_desc(terms, t);
    x = intern_tbl_get_root(&ctx->intern, d->arg[1]);
    y = intern_tbl_get_root(&ctx->intern, d->arg[2]);

    if (x == zero_term && arith_term_is_nonzero(terms, y)) {
      return d->arg[0];
    }

    if (y == zero_term && arith_term_is_nonzero(terms, x)) {
      return opposite_term(d->arg[0]);
    }
  }

  return NULL_TERM;
}


/*
 * Simplification of if-then-else: (ite c t1 t2)
 * - c, t1, and t2 are all root terms in the internalization table
 * - flatten_bool_ite does more simplifications
 */
static term_t simplify_ite(context_t *ctx, term_t c, term_t t1, term_t t2) {
  if (t1 == t2) return t1;                // (ite c t1 t1) --> t1
  if (term_is_true(ctx, c)) return t1;    // (ite true t1 t2) --> t1
  if (term_is_false(ctx, c)) return t2;   // (ite false t1 t2) --> t2

  return NULL_TERM;
}
										


/*
 * Simplification for equalities between two terms t1 and t2.
 * - both t1 and t2 are root terms in the internalization table
 * - all simplification functions either a boolean term t equivalent
 *   to (t1 == t2) or return NULL_TERM if no simplification is found
 */

// t1 and t2 are arithmetic terms
static term_t simplify_arith_bineq(context_t *ctx, term_t t1, term_t t2) {
  term_table_t *terms;
  composite_term_t *d;
  term_t x, y;

  terms = ctx->terms;
  if (is_ite_term(terms, t1)) {
    /*
     * (ite c x y) == x --> c  if x != y
     * (ite c x y) == y --> ~c if x != y
     */
    d = ite_term_desc(terms, t1);
    x = intern_tbl_get_root(&ctx->intern, d->arg[1]);
    y = intern_tbl_get_root(&ctx->intern, d->arg[2]);

    if (x == t2 && disequal_arith_terms(terms, y, t2)) {
      return d->arg[0];
    }

    if (y == t2 && disequal_arith_terms(terms, x, t2)) {
      return opposite_term(d->arg[0]);
    }
  }

  if (is_ite_term(terms, t2)) {
    // symmetric case
    d = ite_term_desc(terms, t2);
    x = intern_tbl_get_root(&ctx->intern, d->arg[1]);
    y = intern_tbl_get_root(&ctx->intern, d->arg[2]);

    if (x == t1 && disequal_arith_terms(terms, y, t1)) {
      return d->arg[0];
    }

    if (y == t1 && disequal_arith_terms(terms, x, t1)) {
      return opposite_term(d->arg[0]);
    }    
  }

  return NULL_TERM;
}

// t1 and t2 are boolean terms
static term_t simplify_bool_eq(context_t *ctx, term_t t1, term_t t2) {
  if (term_is_true(ctx, t1)) return t2;  // (eq true t2) --> t2
  if (term_is_true(ctx, t2)) return t1;  // (eq t1 true) --> t1
  if (term_is_false(ctx, t1)) return opposite_term(t2); // (eq false t2) --> not t2
  if (term_is_false(ctx, t2)) return opposite_term(t1); // (eq t1 false) --> not t1

  return NULL_TERM;
}





/**************************
 *  VARIABLE ELIMINATION  *
 *************************/

/*
 * If variable elimination is enabled, some top-level equalities (eq x
 * <term>) are converted into substitutions [x := term] and variable x
 * is eliminated. This is done in three phases:
 *
 * 1) Cheap substitutions (X := constant or X := variable) are performed first.
 *    Other possible substitutions (X := <term>) are stored into vector subst_eqs.
 *
 * 2) After flattening, the terms in subst_eqs are scanned and converted to 
 *    potential substitutions [X --> <term>] whenever possible. Terms in subst_eqs
 *    that are no longer possible substitutions are copied into top_eqs.
 *
 * 3) Substitution cycles are removed. Every substitution that does not cause
 *    a cycle is stored in intern_table.
 *
 * NOTE: it's too expensive to check for cycles in every candidate substitution
 * (i.e., we can't call intern_tbl_valid_subst in phase 1).
 */


/*
 * VARIABLE ELIMINATION: PHASE 1
 */

/*
 * Process a candidate substitution [t1 := t2]
 * - e is a term equivalent to (eq t1 t2) and e has been asserted true
 * - both t1 and t2 are roots in the internalization table
 * - t1 is free and t2 is not
 * - if t2 is constant, perform the substitution now
 * - otherwise store e into subst_eqs for Phase 2 processing
 */
static void process_candidate_subst(context_t *ctx, term_t t1, term_t t2, term_t e) {
  intern_tbl_t *intern;

  assert(term_is_true(ctx, e));

  intern = &ctx->intern;
  if (is_constant_term(ctx->terms, t2)) {
    if (intern_tbl_valid_const_subst(intern, t1, t2)) {
      intern_tbl_add_subst(intern, t1, t2);
    } else {
      // unsat by type incompatibility
      longjmp(ctx->env, TRIVIALLY_UNSAT);
    }
  } else {
    ivector_push(&ctx->subst_eqs, e);
  }
}

/*
 * Attempt to turn (eq t1 t2) into a variable substitution
 * - both t1 and t2 are root terms in the internalization table
 *   (and t1 and t2 are not boolean so they have positive polarity)
 * - e is a term equivalent to (eq t1 t2)
 * - if both t1 and t2 are free merge their classes in the internalization table
 * - if one is free and the other is a constant perform the substitution now
 * - if one is free and the other is not a constant store e in subst_eqs for Phase 2
 * - otherwise, add e to the top_eqs
 */
static void try_substitution(context_t *ctx, term_t t1, term_t t2, term_t e) {
  intern_tbl_t *intern;
  bool free1, free2;

  assert(is_pos_term(t1) && is_pos_term(t2) && term_is_true(ctx, e));

  if (context_var_elim_enabled(ctx)) {
    intern = &ctx->intern;

    free1 = intern_tbl_root_is_free(intern, t1);
    free2 = intern_tbl_root_is_free(intern, t2);

    if (free1 && free2) {
      intern_tbl_merge_classes(intern, t1, t2);
      return;
    }
    
    if (free1) {
      process_candidate_subst(ctx, t1, t2, e);
      return;
    }

    if (free2) {
      process_candidate_subst(ctx, t2, t1, e);
      return;
    }
  }

  // no substitution: record e as a top-equality
  ivector_push(&ctx->top_eqs, e);
}


/*
 * Attempt to turn (eq t1 t2) into a variable substitution 
 * - both t1 and t2 are boolean root terms in the internalization table
 * - e is a term equivalent to (eq t1 t2)
 * - neither t1 nor t2 are constant
 */
static void try_bool_substitution(context_t *ctx, term_t t1, term_t t2, term_t e) {
  intern_tbl_t *intern;
  bool free1, free2;

  assert(term_is_true(ctx, e));

  if (context_var_elim_enabled(ctx)) {
    intern = &ctx->intern;

    free1 = intern_tbl_root_is_free(intern, t1);
    free2 = intern_tbl_root_is_free(intern, t2);

    if (free1 && free2) {
      /*
       * Both t1 and t2 are free
       */
      intern_tbl_merge_classes(intern, t1, t2);
      return;
    }

    if (free1 || free2) {
      /*
       * Only one is free: save e in subst_eqs for future processing
       */
      ivector_push(&ctx->subst_eqs, e);
      return;
    }
  }
  
  // no substitution
  ivector_push(&ctx->top_eqs, e);
}



/*
 * VARIABLE ELIMINATION: PHASE 2
 */

/*  
 * Check whether x is already mapped in the candidate substitution
 * - if not, store [x := t] as a candidate
 * - otherwise, add e to the top_eqs vector
 */
static void try_pseudo_subst(context_t *ctx, pseudo_subst_t *subst, term_t x, term_t t, term_t e) {
  subst_triple_t *s;

  assert(is_pos_term(x) && intern_tbl_root_is_free(&ctx->intern, x) && term_is_true(ctx, e));

  s = pseudo_subst_get(subst, x);
  assert(s->var == x);
  if (s->map == NULL_TERM) {
    // x := t is a candidate
    assert(s->eq == NULL_TERM);
    s->map = t;
    s->eq = e;

#if TRACE_SUBST
    printf("Add subst candidate ");
    print_term_desc(stdout, ctx->terms, x);
    printf(" := ");;
    print_term_desc(stdout, ctx->terms, t);
    printf(" by assertion ");
    print_term_desc(stdout, ctx->terms, e);
    printf("\n");
    fflush(stdout);
#endif
    
  } else {
    ivector_push(&ctx->top_eqs, e);
  }
} 

/*
 * Check whether (eq t1 t2) can still be turned into a substitution (X := term)
 * - if so add the candidate substitution [X --> term] to subst
 * - otherwise, move e to the top-level equalities
 * - both t1 and t2 are root terms in the internalization table
 * - e is equivalent to (eq t1 t2))
 * - t1 and t2 are not boolean terms
 */
static void check_candidate_subst(context_t *ctx, pseudo_subst_t *subst, term_t t1, term_t t2, term_t e) {
  assert(is_pos_term(t1) && is_pos_term(t2) && term_is_true(ctx, e));

  if (intern_tbl_root_is_free(&ctx->intern, t1)) {
    try_pseudo_subst(ctx, subst, t1, t2, e);
  } else if (intern_tbl_root_is_free(&ctx->intern, t2)) {
    try_pseudo_subst(ctx, subst, t2, t1, e);
  } else {
    ivector_push(&ctx->top_eqs, e);
  }
}



/*
 * Same thing for an equality between booleans terms
 */
static void check_candidate_bool_subst(context_t *ctx, pseudo_subst_t *subst, term_t t1, term_t t2, term_t e) {
  assert(is_boolean_term(ctx->terms, t1) && is_boolean_term(ctx->terms, t2) && term_is_true(ctx, e));

  if (intern_tbl_root_is_free(&ctx->intern, t1)) {
    // if t1 is (not u1), rewrite to (u1 == not t2)
    t2 ^= polarity_of(t1);
    t1 = unsigned_term(t1);
    try_pseudo_subst(ctx, subst, t1, t2, e);
  } else if (intern_tbl_root_is_free(&ctx->intern, t2)) {
    // fix polarities too
    t1 ^= polarity_of(t2);
    t2 = unsigned_term(t2);
    try_pseudo_subst(ctx, subst, t2, t1, e);
  } else {
    ivector_push(&ctx->top_eqs, e);
  }
}


/*
 * Process all elements in subst_eqs:
 * - turn them into substitution candidates or move them to top_eqs
 */
static void process_subst_eqs(context_t *ctx, pseudo_subst_t *subst) {
  term_table_t *terms;
  ivector_t *subst_eqs;
  composite_term_t *eq;
  term_t e, t1, t2;
  uint32_t i, n;

  terms = ctx->terms;
  subst_eqs = &ctx->subst_eqs;

  n = subst_eqs->size;
  for (i=0; i<n; i++) {
    e = subst_eqs->data[i];
    assert(term_is_true(ctx, e));

    switch (term_kind(terms, e)) {
    case EQ_TERM:
    case ARITH_BINEQ_ATOM:
    case BV_EQ_ATOM:      
      eq = composite_term_desc(terms, e);
      assert(eq->arity == 2);
      t1 = intern_tbl_get_root(&ctx->intern, eq->arg[0]);
      t2 = intern_tbl_get_root(&ctx->intern, eq->arg[1]);

      if (is_boolean_term(terms, t1)) {
	/*
	 * e was asserted true
	 * it's either (eq t1 t2) or (not (eq t1 t2))
	 * in the latter case, we use the equivalence
	 *  (not (eq t1 t2)) <--> (eq t1 (not t2))
	 * i.e., we flip t2's polarity if e has negative polarity
	 */
	t2 ^= polarity_of(e);
	check_candidate_bool_subst(ctx, subst, t1, t2, e);
      } else {
	/*
	 * e is (eq t1 t2) for two non-boolean terms t1 and t2
	 */
	assert(is_pos_term(e));
	check_candidate_subst(ctx, subst, t1, t2, e);
      }
      break;

    default:
      assert(false);
      break;
    }
  }
}


/*
 * VARIABLE ELIMINATION PHASE 3: CYCLE REMOVAL
 */

/*
 * We use a depth-first search in the dependency graph:
 * - vertices are terms,
 * - edges are of two forms: 
 *    t --> u if u is a child subterm of t
 *    x := t  if x is a variable and t is the substitution candidate for x
 *
 * By construction, the graph restricted to edges t --> u (without the 
 * substitution edges) is a DAG. So we can remove cycles by removing some 
 * substitution edges x := t.
 */

/*
 * Substitution candidate for term t:
 * - return NULL_TERM if there's no candidate
 */
static term_t subst_candidate(context_t *ctx, term_t t) {
  subst_triple_t *s;

  assert(ctx->subst != NULL);
  s = pseudo_subst_find(ctx->subst, t);
  if (s == NULL) {
    return NULL_TERM;
  } else {
    assert(s->var == t);
    return s->map;
  }
}


/*
 * Remove substitution candidate for t
 */
static void remove_subst_candidate(context_t *ctx, term_t t) {
  subst_triple_t *s;

  assert(ctx->subst != NULL);
  s = pseudo_subst_find(ctx->subst, t);
  assert(s != NULL && s->var == t && s->map != NULL_TERM);

#if TRACE_SUBST
  printf("Removing subst candidate ");
  print_term_desc(stdout, ctx->terms, t);
  printf(" := ");;
  print_term_desc(stdout, ctx->terms, s->map);
  printf("\n");
  fflush(stdout);
#endif

  s->map = NULL_TERM;
}


/*
 * Visit t: return true if t is on a cycle.
 */
static bool visit(context_t *ctx, term_t t);

static bool visit_composite(context_t *ctx, composite_term_t *c) {
  uint32_t i, n;

  n = c->arity;
  for (i=0; i<n; i++) {
    if (visit(ctx, c->arg[i])) {
      return true;
    }
  }
  
  return false;
}

static bool visit_pprod(context_t *ctx, pprod_t *p) {
  uint32_t i, n;

  n = p->len;
  for (i=0; i<n; i++) {
    if (visit(ctx, p->prod[i].var)) {
      return true;
    }
  }

  return false;
}

static bool visit_arith_poly(context_t *ctx, polynomial_t *p) {
  monomial_t *m;
  uint32_t i, n;

  m = p->mono;
  n = p->nterms;
  assert(n > 0);
  // skip constant marker
  if (m[0].var == const_idx) {
    m++;
    n--;
  }

  for (i=0; i<n; i++) {
    if (visit(ctx, m[i].var)) {
      return true;
    }
  }

  return false;
}

static bool visit_bv_poly(context_t *ctx, bvpoly_t *p) {
  bvmono_t *m;
  uint32_t i, n;

  m = p->mono;
  n = p->nterms;
  assert(n > 0);
  // skip constant marker
  if (m[0].var == const_idx) {
    m++;
    n--;
  }

  for (i=0; i<n; i++) {
    if (visit(ctx, m[i].var)) {
      return true;
    }
  }

  return false;
}


static bool visit_bv64_poly(context_t *ctx, bvpoly64_t *p) {
  bvmono64_t *m;
  uint32_t i, n;

  m = p->mono;
  n = p->nterms;
  assert(n > 0);
  // skip constant marker
  if (m[0].var == const_idx) {
    m++;
    n--;
  }

  for (i=0; i<n; i++) {
    if (visit(ctx, m[i].var)) {
      return true;
    }
  }

  return false;
}


static bool visit(context_t *ctx, term_t t) {
  term_table_t *terms;
  term_t r;
  int32_t i;
  bool result;
  uint8_t color;

  assert(ctx->marks != NULL);
  i = index_of(t);
  color = mark_vector_get_mark(ctx->marks, i);

  if (color == WHITE) {
    /*
     * i not visited yet
     */
    terms = ctx->terms;
    mark_vector_add_mark(ctx->marks, i, GREY);

    switch (kind_for_idx(terms, i)) {
    case CONSTANT_TERM:
    case ARITH_CONSTANT:
    case BV64_CONSTANT:
    case BV_CONSTANT:
    case VARIABLE:
      result = false;
      break;

    case UNINTERPRETED_TERM:
      r = intern_tbl_get_root(&ctx->intern, t);
      if (r != t) {
	result = visit(ctx, r);
      } else {
	r = subst_candidate(ctx, pos_term(i));
	if (r != NULL_TERM && visit(ctx, r)) {
	  /*
	   * There's a cycle u --> ... --> t := r --> ... --> u
	   * remove the substitution t := r to break the cycle
	   */
	  remove_subst_candidate(ctx, pos_term(i));
	}
	result = false;
      }
      break;

    case ARITH_EQ_ATOM:
    case ARITH_GE_ATOM:
      result = visit(ctx, integer_value_for_idx(terms, i));
      break;

    case ITE_TERM:
    case ITE_SPECIAL:
    case APP_TERM:
    case UPDATE_TERM:
    case TUPLE_TERM:
    case EQ_TERM:
    case DISTINCT_TERM:
    case FORALL_TERM:
    case OR_TERM:
    case XOR_TERM:
    case ARITH_BINEQ_ATOM:
    case BV_ARRAY:
    case BV_DIV:
    case BV_REM:
    case BV_SDIV:
    case BV_SREM:
    case BV_SMOD:
    case BV_SHL:
    case BV_LSHR:
    case BV_ASHR:
    case BV_EQ_ATOM:
    case BV_GE_ATOM:
    case BV_SGE_ATOM:
      result = visit_composite(ctx, composite_for_idx(terms, i));
      break;

    case SELECT_TERM:
    case BIT_TERM:
      result = visit(ctx, select_for_idx(terms, i)->arg);
      break;

    case POWER_PRODUCT:
      result = visit_pprod(ctx, pprod_for_idx(terms, i));
      break;

    case ARITH_POLY:
      result = visit_arith_poly(ctx, polynomial_for_idx(terms, i));
      break;

    case BV64_POLY:
      result = visit_bv64_poly(ctx, bvpoly64_for_idx(terms, i));
      break;

    case BV_POLY:
      result = visit_bv_poly(ctx, bvpoly_for_idx(terms, i));
      break;

    case UNUSED_TERM:
    case RESERVED_TERM:
    default:
      assert(false);
      longjmp(ctx->env, INTERNAL_ERROR);
      break;
    }

    if (result) {
      /*
       * t is on a cycle of grey terms:
       *  v --> .. x := u --> ... --> t --> ... --> v
       * all terms on the cycle must be cleared except v
       */
      mark_vector_add_mark(ctx->marks, i, WHITE);
    } else {
      // no cycle containing t: mark i black
      mark_vector_add_mark(ctx->marks, i, BLACK);
    }

  } else {
    /*
     * i already visited before
     * - if it's black there's no cycle
     * - if it's grey, we've just detected a cycle
     */
    assert(color == GREY || color == BLACK);
    result = (color == GREY);
  }

  return result;
}


/*
 * Iterator for remove cycle:
 * - s is a triple [x, t, e] for a candidate substitution x := t
 */
static void visit_subst_candidate(context_t *ctx, subst_triple_t *s) {
  term_t x;

  x = s->var;
  assert(intern_tbl_is_root(&ctx->intern, x) && intern_tbl_root_is_free(&ctx->intern, x));
  if (mark_vector_get_mark(ctx->marks, index_of(x)) == WHITE) {
    (void) visit(ctx, x);
  }
}


/*
 * Remove cycles in the candidate substitutions
 */
static void remove_subst_cycles(context_t *ctx) {
  pseudo_subst_iterate(ctx->subst, ctx, (pseudo_subst_iterator_t) visit_subst_candidate);
}


/*
 * Iterator for finalize subst:
 * - s is a triple [x, t, e] 
 * - if t is NULL_TERM, that's no longer a good substitution: add e to top_eqs
 * - otherwise add x := t as a substitution in the internalization table
 */
static void finalize_subst_triple(context_t *ctx, subst_triple_t *s) {
  assert(s->eq != NULL_TERM && term_is_true(ctx, s->eq));

  if (s->map != NULL_TERM) {
    intern_tbl_add_subst(&ctx->intern, s->var, s->map);
  } else {
    ivector_push(&ctx->top_eqs, s->eq);
  }
}


/*
 * Finalize all candidate substitutions
 */
static void finalize_subst_candidates(context_t *ctx) {
  pseudo_subst_iterate(ctx->subst, ctx, (pseudo_subst_iterator_t) finalize_subst_triple);  
}




/***************************
 *  ASSERTION FLATTENING   *
 **************************/

/*
 * Assertions are processed by performing top-down boolean propagation
 * and collecting all subterms that can't be flattened into four vectors:
 *
 * 1) ctx->top_eqs = top-level equalities.
 *    Every t in top_eqs is (eq t1 t2) (or a variant) asserted true.
 *    t is mapped to true in the internalization table.
 *
 * 2) ctx->top_atoms = top-level atoms.
 *    Every t in top_atoms is an atom or the negation of an atom (that 
 *    can't go into top_eqs).
 *    t is mapped to true in the internalization table.
 *
 * 3) ctx->top_formulas = non-atomic terms.
 *    Every t in top_formulas is either an (OR ...) or (ITE ...) or (XOR ...) 
 *    or the negation of such a term.
 *    t is mapped to true in the internalization table.
 *
 * 4) ctx->top_interns = already internalized terms.
 *    Every t in top_interns is a term that's been internalized before
 *    and is mapped to a literal l or an egraph occurrence g in
 *    the internalization table.
 *    l or g must be asserted true in later stages.
 * 
 * Flattening is done breadth-first:
 * - the subterms to process are stored into ctx->queue.
 * - each subterm in that queue is a boolean term that's asserted true
 */


/*
 * Each function below processes an assertion of the form (r == tt)
 * where r is a boolean term (with positive polarity) and tt is either
 * true or false. The term r is a root in the internalization table
 * and r is not internalized yet.
 *
 * Processing:
 * - try to simplify (r == tt) to a boolean term q. If that works
 *   add q to the internal queue.
 * - check for boolean propagation from (r == tt) to r's children.
 *   Example: (or t_1 ... t_n) == false ---> (t_1 == false), etc.
 * - if (r == tt) can be rewritten to an equality (t1 == t2), check
 *   whether we can eliminate t1 or t2 by substitution.
 * - otherwise, add r or (not r) to one of top_eqs, top_atoms, or top_formulas.
 */

/*
 * Atoms, except equalities
 */
// r is (p t_1 ... t_n)
static void flatten_bool_app(context_t *ctx, term_t r, bool tt) {
  ivector_push(&ctx->top_atoms, signed_term(r, tt));
}

// r is (distinct t1 .... t_n)
static void flatten_distinct(context_t *ctx, term_t r, bool tt) {
  if (tt) {
    ivector_push(&ctx->top_atoms, r);
  } else {
    // not (distinct ...) expands to an or 
    ivector_push(&ctx->top_formulas, not(r));
  }
}

// r is (select i t) for a tuple t
static void flatten_select(context_t *ctx, term_t r, bool tt) {
  term_t t;

  t = simplify_select(ctx, r);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else {
    ivector_push(&ctx->top_atoms, signed_term(r, tt));    
  }
}

// r is (bit i t) for a bitvector term t
static void flatten_bit_select(context_t *ctx, term_t r, bool tt) {
  term_t t;

  t = simplify_bit_select(ctx, r);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else {
    ivector_push(&ctx->top_atoms, signed_term(r, tt));
  }
}

// r is (t >= 0) for an arithmetic term t
static void flatten_arith_geq0(context_t *ctx, term_t r, bool tt) {
  term_t t;

  t = simplify_arith_geq0(ctx, r);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else {
    ivector_push(&ctx->top_atoms, signed_term(r, tt));
  }
}

// r is (bvge t1 t2) for two bitvector terms t1 and t2
static void flatten_bvge(context_t *ctx, term_t r, bool tt) {
  ivector_push(&ctx->top_atoms, signed_term(r, tt));
}

// r is (bvsge t1 t2) for two bitvector terms t1 and t2
static void flatten_bvsge(context_t *ctx, term_t r, bool tt) {
  ivector_push(&ctx->top_atoms, signed_term(r, tt));
}


/*
 * Equalities
 */
// r is (t == 0) for an arithmetic term t
static void flatten_arith_eq0(context_t *ctx, term_t r, bool tt) {
  term_t t;

  t = simplify_arith_eq0(ctx, r);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else if (tt) {
    ivector_push(&ctx->top_eqs, r);
  } else {
    ivector_push(&ctx->top_atoms, opposite_term(r));
  }
}

// r is (t1 == t2) for two arithemtic terms t1 and t2
static void flatten_arith_eq(context_t *ctx, term_t r, bool tt) {
  composite_term_t *eq;
  term_t t1, t2, t;

  eq = arith_bineq_atom_desc(ctx->terms, r);
  t1 = intern_tbl_get_root(&ctx->intern, eq->arg[0]);
  t2 = intern_tbl_get_root(&ctx->intern, eq->arg[1]);

  if (t1 == t2) return;

  t = simplify_arith_bineq(ctx, t1, t2);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else if (tt) {
    try_substitution(ctx, t1, t2, r);
  } else {
    ivector_push(&ctx->top_atoms, opposite_term(r));
  }
}

// r is (eq t1 t2): t1 and t2 are either boolean or tuples or uninterpreted
static void flatten_eq(context_t *ctx, term_t r, bool tt) {
  term_table_t *terms;
  composite_term_t *eq;
  term_t t1, t2, t;

  terms = ctx->terms;
  eq = eq_term_desc(terms, r);
  t1 = intern_tbl_get_root(&ctx->intern, eq->arg[0]);
  t2 = intern_tbl_get_root(&ctx->intern, eq->arg[1]);

  if (is_boolean_term(terms, t1)) {
    /*
     * Boolean equality
     */
    assert(is_boolean_term(terms, t2));

    t = simplify_bool_eq(ctx, t1, t2);
    if (t != NULL_TERM) {
      int_queue_push(&ctx->queue, signed_term(t, tt));
    } else {
      // not (eq t1 t2) --> (eq t1 (not t2))
      if (! tt) {
	r = opposite_term(r);
	t2 = opposite_term(t2);
      }

      if (index_of(t1) == index_of(t2)) {
	// either (eq t1 t1) or (eq t1 (not t1))
	if (t1 == t2) return;
	assert(opposite_bool_terms(t1, t2));
	longjmp(ctx->env, TRIVIALLY_UNSAT);
      }

      try_bool_substitution(ctx, t1, t2, r);
    }

  } else {
    /*
     * Non-boolean
     */
    if (t1 == t2) return;

    if (tt) {
      try_substitution(ctx, t1, t2, r);
    } else {
      ivector_push(&ctx->top_atoms, opposite_term(r));
    }
  }
}

// r is (bveq t1 t2) for two bitvector terms t1 and t2
static void flatten_bveq(context_t *ctx, term_t r, bool tt) {
  term_table_t *terms;
  composite_term_t *eq;
  term_t t1, t2, t;

  terms = ctx->terms;
  eq = bveq_atom_desc(terms, r);
  t1 = intern_tbl_get_root(&ctx->intern, eq->arg[0]);
  t2 = intern_tbl_get_root(&ctx->intern, eq->arg[1]);

  if (t1 == t2) return;

  t = simplify_bveq(terms, t1, t2);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else if (tt) {
    try_substitution(ctx, t1, t2, r);
  } else {
    ivector_push(&ctx->top_atoms, opposite_term(r));
  }
}


/*
 * Non-atomic terms
 */
// r is (or t1 .... t_n)
static void flatten_or(context_t *ctx, term_t r, bool tt) {
  composite_term_t *d;
  uint32_t i, n;

  if (tt) {
    ivector_push(&ctx->top_formulas, r);
  } else {
    d = or_term_desc(ctx->terms, r);
    n = d->arity;
    for (i=0; i<n; i++) {
      int_queue_push(&ctx->queue, opposite_term(d->arg[i]));
    }
  }
}

// r is (xor t1 ... t_n)
static void flatten_xor(context_t *ctx, term_t r, bool tt) {
  ivector_push(&ctx->top_formulas, signed_term(r, tt));
}

// r is (ite c t1 t2) where t1 and t2 are boolean terms
static void flatten_bool_ite(context_t *ctx, term_t r, bool tt) {
  term_table_t *terms;
  composite_term_t *d;
  term_t c, t1, t2, t;

  terms = ctx->terms;
  d = ite_term_desc(terms, r);
  c = intern_tbl_get_root(&ctx->intern, d->arg[0]);
  t1 = intern_tbl_get_root(&ctx->intern, d->arg[1]);
  t2 = intern_tbl_get_root(&ctx->intern, d->arg[2]);

  t = simplify_ite(ctx, c, t1, t2);
  if (t != NULL_TERM) {
    int_queue_push(&ctx->queue, signed_term(t, tt));
  } else {

    if (tt) {
      if (c == t2 || term_is_false(ctx, t2)) {
	// assert (ite c a false) --> assert c and a
	// assert (ite c a c)     --> assert c and a
	int_queue_push(&ctx->queue, c);
	int_queue_push(&ctx->queue, t1);
	return;
      }

      if (opposite_bool_terms(c, t1) || term_is_false(ctx, t1)) {
	// assert (ite c false b)   --> assert (not c) and b
	// assert (ite c (not c) b) --> assert (not c) and b
	int_queue_push(&ctx->queue, opposite_term(c));
	int_queue_push(&ctx->queue, t2);
	return;
      }

    } else {
      if (opposite_bool_terms(c, t2) || term_is_true(ctx, t2)) {
	// assert not (ite c a true)    --> assert c and (not a)
	// assert not (ite c a (not c)) --> assert c and (not a)
	int_queue_push(&ctx->queue, c);
	int_queue_push(&ctx->queue, opposite_term(t1));
	return;
      }

      if (c == t1 || term_is_true(ctx, t1)) {
	// assert not (ite c true b) --> assert (not c) and (not b)
	// assert not (ite c c b)    --> assert (not c) and (not b)
	int_queue_push(&ctx->queue, opposite_term(c));
	int_queue_push(&ctx->queue, opposite_term(t2));
	return;
      }
    }

    // no flattening found
    ivector_push(&ctx->top_formulas, signed_term(r, tt));
  }
}


/*
 * Simplify and flatten assertion f.
 * 
 * Raise an exception via longjmp if there's an error or if a
 * contradiction is detected.
 */
static void flatten_assertion(context_t *ctx, term_t f) {
  intern_tbl_t *intern;
  int_queue_t *queue;
  term_table_t *terms;
  term_t t, r;
  int32_t x;
  bool tt;
  int32_t exception;

  queue = &ctx->queue;
  intern = &ctx->intern;
  terms = ctx->terms;

  assert(int_queue_is_empty(queue));
  int_queue_push(queue, f);

  do {
    t = int_queue_pop(queue);           // assert t

    /*
     * Convert (assert t) to (assert r == tt)
     * where r is positive (equal to t or not t)
     * and polarity is either true or false
     */
    r = intern_tbl_get_root(intern, t); // r == t by substitution
    tt = is_pos_term(r);
    r = unsigned_term(r);

    assert(is_pos_term(r) && intern_tbl_is_root(intern, r));

    if (intern_tbl_root_is_mapped(intern, r)) {
      /*
       * r already mapped to something
       * check for trivial unsat 
       * then add r or (not r) to top_intern
       */
      x = intern_tbl_map_of_root(intern, r);
      if (x == bool2code(! tt)) {
	exception = TRIVIALLY_UNSAT;
	goto abort;
      }

      if (x != bool2code(tt)) {
	ivector_push(&ctx->top_interns, signed_term(r, tt));
      }

    } else {
      /*
       * r not seen before: record r = tt then explore r
       */
      switch (term_kind(terms, r)) {
      case UNUSED_TERM:
      case RESERVED_TERM:
      case CONSTANT_TERM:
	/*
	 * NOTE: the constant boolean terms are true and false, which
	 * should always be internalized to true_literal or false_literal.
	 * That's why we don't have a separate 'CONSTANT_TERM' case.
	 */
	exception = INTERNAL_ERROR;
	goto abort;
	
      case ARITH_CONSTANT:
      case BV64_CONSTANT:
      case BV_CONSTANT:
      case UPDATE_TERM:
      case TUPLE_TERM:
      case BV_ARRAY:
      case BV_DIV:
      case BV_REM:
      case BV_SDIV:
      case BV_SREM:
      case BV_SMOD:
      case BV_SHL:
      case BV_LSHR:
      case BV_ASHR:
      case POWER_PRODUCT:
      case ARITH_POLY:
      case BV64_POLY:
      case BV_POLY:
	exception = TYPE_ERROR;
	goto abort;

      case VARIABLE:
	exception = FREE_VARIABLE_IN_FORMULA;
	goto abort;

      case UNINTERPRETED_TERM:
	assert(intern_tbl_root_is_free(intern, r));
	if (context_var_elim_enabled(ctx)) {
	  intern_tbl_add_subst(intern, r, bool2term(tt));
	} else {
	  intern_tbl_map_root(intern, r, bool2code(tt));
	}
	break;

      case ARITH_EQ_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_arith_eq0(ctx, r, tt);
	break;

      case ARITH_GE_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_arith_geq0(ctx, r, tt);
	break;

      case ITE_TERM:
      case ITE_SPECIAL:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bool_ite(ctx, r, tt);
	break;

      case APP_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bool_app(ctx, r, tt);
	break;

      case EQ_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_eq(ctx, r, tt);
	break;

      case DISTINCT_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_distinct(ctx, r, tt);
	break;

      case FORALL_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	ivector_push(&ctx->top_atoms, signed_term(r, tt));
	break;

      case OR_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_or(ctx, r, tt);
	break;

      case XOR_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_xor(ctx, r, tt);
	break;

      case ARITH_BINEQ_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_arith_eq(ctx, r, tt);
	break;

      case BV_EQ_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bveq(ctx, r, tt);
	break;

      case BV_GE_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bvge(ctx, r, tt);
	break;

      case BV_SGE_ATOM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bvsge(ctx, r, tt);
	break;

      case SELECT_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_select(ctx, r, tt);
	break;

      case BIT_TERM:
	intern_tbl_map_root(intern, r, bool2code(tt));
	flatten_bit_select(ctx, r, tt);
	break;
      }
    }
    
  } while (! int_queue_is_empty(queue));

  return;

 abort:
  assert(exception != 0);
  longjmp(ctx->env, exception);
}




/*
 * Process all candidate substitutions after flattening
 * - the candidate substitutions are in ctx->subst_eqs
 * - each element in ctx->subst_eqs is a boolean term e 
 *   such that e is true or false (by flatteing)
 *         and e is equivalent to an equality (t1 == t2)
 *   where one of t1 and t2 is a variable.
 */
static void context_process_candidate_subst(context_t *ctx) {
  pseudo_subst_t *subst;
  mark_vector_t *marks;

  subst = context_get_subst(ctx);
  marks = context_get_marks(ctx);
  process_subst_eqs(ctx, subst);
  remove_subst_cycles(ctx);
  finalize_subst_candidates(ctx);

  // cleanup
  ivector_reset(&ctx->subst_eqs);
  reset_pseudo_subst(subst);
  reset_mark_vector(marks);
}




/********************************
 *  FLATTENING OF DISJUNCTIONS  *
 *******************************/

/*
 * This does two things:
 * 1) rewrite nested OR terms to flat OR terms
 * 2) replace arithmetic disequality by disjunctions of strict inequalities
 *    (i.e., rewrite (x != 0) to (or (x < 0) (x > 0))
 */

/*
 * Build the atom (t < 0)
 */
static term_t lt0_atom(context_t *ctx, term_t t) {
  arith_buffer_t *b;

  assert(is_pos_term(t) && is_arithmetic_term(ctx->terms, t));

  b = ctx->arith_buffer;
  assert(b != NULL && arith_buffer_is_zero(b));

  arith_buffer_add_term(b, ctx->terms, t);
  return arith_buffer_get_lt0_atom(b);
}

/*
 * Build a term equivalent to (t > 0)
 */
static term_t gt0_atom(context_t *ctx, term_t t) {
  arith_buffer_t *b;

  assert(is_pos_term(t) && is_arithmetic_term(ctx->terms, t));

  b = ctx->arith_buffer;
  assert(b != NULL && arith_buffer_is_zero(b));

  arith_buffer_add_term(b, ctx->terms, t);
  return arith_buffer_get_gt0_atom(b);  
}


/*
 * Flatten term t:
 * - if t is already internalized, keep t and add it to v
 * - if t is (OR t1 ... t_n), recursively flatten t_1 ... t_n
 * - if flattening of disequalities is enabled, and t is (NOT (x == 0)) then
 *   we rewrite (NOT (x == 0)) to (OR (< x 0) (> x 0))
 * - otherwise store t into v
 * All terms already in v must be in the small cache
 */
static void flatten_or_recur(context_t *ctx, ivector_t *v, term_t t) {
  term_table_t *terms;
  composite_term_t *or;
  uint32_t i, n;
  term_kind_t kind;
  term_t x;

  assert(is_boolean_term(ctx->terms, t));

  // apply substitutions
  t = intern_tbl_get_root(&ctx->intern, t);

  if (int_hset_add(ctx->small_cache, t)) {
    /*
     * t not already in v and not visited before
     */
    if (intern_tbl_root_is_mapped(&ctx->intern, t)) {
      // t is already internalized, keep it as is
      ivector_push(v, t); 
    } else {
      terms = ctx->terms;
      kind = term_kind(terms, t);
      if (is_pos_term(t) && kind == OR_TERM) {
	// recursively flatten t
	or = or_term_desc(terms, t);
	n = or->arity;
	for (i=0; i<n; i++) {
	  flatten_or_recur(ctx, v, or->arg[i]);
	}
      } else if (is_neg_term(t) && kind == ARITH_EQ_ATOM && 
		 context_flatten_diseq_enabled(ctx)) {
	// t is (not (eq x 0)): rewrite to (or (x < 0) (x > 0))
	x = intern_tbl_get_root(&ctx->intern, arith_eq_arg(terms, t));
	ivector_push(v, lt0_atom(ctx, x));
	ivector_push(v, gt0_atom(ctx, x));

      } else {
	// can't flatten
	ivector_push(v, t);
      }
    }
  }
}


/*
 * Flatten a top-level (or t1 .... tp)
 * - initialize the small_cache, then calls the recursive function
 * - the result is stored in v
 */
static void flatten_or_term(context_t *ctx, ivector_t *v, composite_term_t *or) {
  uint32_t i, n;

  assert(v->size == 0);

  (void) context_get_small_cache(ctx); // initialize the cache
  if (context_flatten_diseq_enabled(ctx)) {
    (void) context_get_arith_buffer(ctx);  // allocate the internal buffer
  }

  n = or->arity;
  for (i=0; i<n; i++) {
    flatten_or_recur(ctx, v, or->arg[i]);
  }
  //  context_delete_small_cache(ctx);
  context_reset_small_cache(ctx);
}







/****************************************************
 *  SIMPLIFICATIONS FOR SPECIAL IF-THEN-ELSE TERMS  *
 ***************************************************/

/*
 * If t is (ite c a b), we can try to rewrite (= t k) into a conjunction
 * of terms using the two rules:
 *   (= (ite c a b) k) --> c and (= a k)        if k != b holds
 *   (= (ite c a b) k) --> (not c) and (= b k)  if k != a holds
 *
 * This works best for the NEC benchmarks in SMT LIB, where many terms
 * are deeply nested if-then-else terms with constant leaves.
 *
 * The function below does that: it rewrites (eq t k) to (and c_0 ... c_n (eq t' k))
 * - the boolean terms c_0 ... c_n are added to vector v
 * - the term t' is returned
 * So the simplification worked it the returned term t' is different from t
 * (and then v->size is not 0).
 */
static term_t flatten_ite_equality(context_t *ctx, ivector_t *v, term_t t, term_t k) {
  term_table_t *terms;
  composite_term_t *ite;

  assert(v->size == 0);

  terms = ctx->terms;
  assert(is_pos_term(t) && good_term(terms, t));

  while (term_kind(terms, t)) {
    // t is (ite c a b)
    ite = ite_term_desc(terms, t);
    assert(ite->arity == 3);

    if (disequal_terms(terms, k, ite->arg[1])) {
      // (t == k) is (not c) and (t == b)
      ivector_push(v, opposite_term(ite->arg[0]));
      t = intern_tbl_get_root(&ctx->intern, ite->arg[2]);

    } else if (disequal_terms(terms, k, ite->arg[2])) {
      // (t == k) is c and (t == a)
      ivector_push(v, ite->arg[0]);
      t = intern_tbl_get_root(&ctx->intern, ite->arg[1]);

    } else {
      // no more flattening possible
      break;
    }
  }

  return t;
}






/************************
 *  EQUALITY LEARNING   *
 ***********************/

/*
 * Process implied equality (x == y):
 * - x and y should not be boolean, bitvector, or arithmetic terms,
 * - we check whether (eq x y) is true or false
 * - if it's false, the return code is TRIVIALLY_UNSAT
 * - if it's true, we do nothing
 * - otherwise, (eq x y) is added to top_eqs, and assigned to true
 */
static int32_t add_aux_eq(context_t *ctx, term_t x, term_t y) {
  term_table_t *terms;
  term_t eq;
  int32_t code;

  x = intern_tbl_get_root(&ctx->intern, x);
  y = intern_tbl_get_root(&ctx->intern, y);

  if (x != y) {
    /*
     * Build/get term (eq x y)
     */
    terms = ctx->terms;  
    if (x > y) {
      eq = eq_term(terms, y, x);
    } else {
      eq = eq_term(terms, x, y);
    }

    assert(intern_tbl_is_root(&ctx->intern, eq));

#if TRACE_EQ_ABS
    printf("---> learned equality: ");
    print_term_def(stdout, ctx->terms, eq);
    printf("\n");
#endif 

    if (intern_tbl_root_is_mapped(&ctx->intern, eq)) {
      // eq is already internalized
      code = intern_tbl_map_of_root(&ctx->intern, eq);
      if (code == bool2code(false)) {
	return TRIVIALLY_UNSAT;
      } 

      if (code != bool2code(true)) {
	ivector_push(&ctx->top_interns, eq);
      }

    } else {
      // map e to true and add it to top_eqs
      intern_tbl_map_root(&ctx->intern, eq, bool2code(true));
      ivector_push(&ctx->top_eqs, eq);
    }    

  }

  return CTX_NO_ERROR;
}


/*
 * Add implied top_level equalities defined by the partition p
 * - return CTX_NO_ERROR if the equalities could be added
 * - return TRIVIALLY_UNSAT if an equality to add is known to be false
 */
static int32_t add_implied_equalities(context_t *ctx, epartition_t *p) {
  uint32_t i, n;
  term_t *q, x, y;
  int32_t k;
  
  n = p->nclasses;
  q = p->data;
  for (i=0; i<n; i++) {
    x = *q++;
    assert(x >= 0);
    y = *q ++;
    while (y >= 0) {
      k = add_aux_eq(ctx, x, y);
      if (k != CTX_NO_ERROR) return k;
      y = *q ++;
    }
  }
  return CTX_NO_ERROR;
}

/*
 * Attempt to learn global equalities implied 
 * by the formulas stored in ctx->top_formulas.
 * Any such equality is added to ctx->top_eqs
 * - return CTX_NO_ERROR if no contradiction is found
 * - return TRIVIALLY_UNSAT if a contradiction is found
 */
static int32_t analyze_uf(context_t *ctx) {
  ivector_t *v;
  uint32_t i, n;
  eq_learner_t eql;
  epartition_t *p;
  int32_t k;

  init_eq_learner(&eql, ctx->terms);
  v = &ctx->top_formulas;
  n = v->size;

  k = CTX_NO_ERROR;
  for (i=0; i<n; i++) {
    p = eq_learner_process(&eql, v->data[i]);
    if (p->nclasses > 0) {
      k = add_implied_equalities(ctx, p);
      if (k != CTX_NO_ERROR) break;
    }
  }

  delete_eq_learner(&eql);
  return k;
}




/*************************************************
 *  ANALYSIS FOR THE DIFFERENCE LOGIC FRAGMENTS  *
 ************************************************/

/*
 * Increment the number of variables if t has not been seen before
 */
static void count_dl_var(context_t *ctx, dl_data_t *stats, term_t t) {
  int32_t idx;

  assert(is_pos_term(t) && intern_tbl_is_root(&ctx->intern, t));

  idx = index_of(t);
  if (int_bvset_add(ctx->cache, idx)) {
    stats->num_vars ++;
  }
}


/*
 * Check whether (x - y <= a) or (x - y = a) is a valid IDL or RDL atom
 * If so, update the statistics array stats and return true.
 * Otherwise return false.
 * - x and y are arithmetic terms (x or y or both may be the zero_term).
 * - x and y must be roots in ctx->intern
 * - a is either a rational constant or NULL (if NULL, that's interpreted as zero)
 *
 * TODO: use a hash table? The same atom may be counted twice.
 *
 * NOTE: we could check whether x and y are uninterpreted, but that
 * will be detected in later phases of internalization anyway.
 */
static bool check_dl_atom(context_t *ctx, dl_data_t *stats, term_t x, term_t y, rational_t *a, bool idl) {
  term_table_t *terms;

  terms = ctx->terms;

  assert(is_arithmetic_term(terms, x) && is_pos_term(x) && intern_tbl_is_root(&ctx->intern, x));
  assert(is_arithmetic_term(terms, y) && is_pos_term(y) && intern_tbl_is_root(&ctx->intern, y));

  // check the types first
  if (x != zero_term && is_integer_term(terms, x) != idl) {
    return false;
  }
  if (y != zero_term && is_integer_term(terms, y) != idl) {
    return false;
  }
  if (idl && a != NULL && ! q_is_integer(a)) {
    return false;
  }

  // if x == y, we ignore the atom. It will simplify to true or false anyway.
  if (x != y) {
    count_dl_var(ctx, stats, x); // we must count zero_term as a variable
    count_dl_var(ctx, stats, y); // same thing

    /*
     * stats->sum_const is intended to be an upper bound on the
     * longest path in the difference-logic graph.
     * 
     * for idl, we add max( |a|, |-a -1|) to sum_const
     * for rdl, we add |a| to sum_const
     */
    if (a != NULL) {
      if (q_is_neg(a)) {	
	// a < 0  so max(|a|, |-a - 1|) is - a
	q_sub(&stats->sum_const, a);
      } else {
	// a >= 0 so max(|a|, |-a - 1|) is a + 1
	q_add(&stats->sum_const, a);
	if (idl) q_add_one(&stats->sum_const);
      }
    } else if (idl) {
      // a = 0
      q_add_one(&stats->sum_const);
    }
  }
  
  stats->num_atoms ++;

  return true;
}


/*
 * Check whether aux contains a difference logic term, i.e., 
 * a term of the form (a + x - y) or (a + x) or (a - y) or (x - y) or +x or -y or a,
 * where a is a constant and x and y are two arithmetic variables.
 *
 * All terms of aux must be roots in ctx->intern.
 */
static bool check_dl_poly_buffer(context_t *ctx, dl_data_t *stats, poly_buffer_t *aux, bool idl) {
  uint32_t n;
  rational_t *a;
  monomial_t *q;

  n = poly_buffer_nterms(aux);
  if (n > 3) return false;
  if (n == 0) return true;

  a = NULL;
  q = poly_buffer_mono(aux);

  // get a pointer to the constant if any
  if (q[0].var == const_idx) {
    a = &q[0].coeff;
    q ++;
    n --; 
  }

  // deal with the non-constant terms
  if (n == 2 && q_opposite(&q[0].coeff, &q[1].coeff)) {
    if (q_is_one(&q[0].coeff)) {
      // a_0 + x_1 - x_2 >= 0  <--> (x_2 - x_1 <= a_0)
      return check_dl_atom(ctx, stats, q[1].var, q[0].var, a, idl);
    }
      
    if (q_is_one(&q[1].coeff)) {
      // a_0 - x_1 + x_2 >= 0  <--> (x_1 - x_2 <= a_0)
      return check_dl_atom(ctx, stats, q[0].var, q[1].var, a, idl);
    }

  } else if (n == 1) {
    if (q_is_one(&q[0].coeff)) {
      // a_0 + x_1 >= 0  <--> (0 - x_1 <= a_0)
      return check_dl_atom(ctx, stats, zero_term, q[0].var, a, idl);
    }

    if (q_is_minus_one(&q[0].coeff)) {
      // a_0 - x_1 >= 0  <--> (x_1 - 0 <= a_0)
      return check_dl_atom(ctx, stats, q[0].var, zero_term, a, idl);
    }
  }

  return n == 0;
}


/*
 * Add a * t to a buffer (and variants).
 * - we must deal with the case where t is a constant here.
 */
static void poly_buffer_addmul_term(term_table_t *terms, poly_buffer_t *aux, term_t t, rational_t *a) {
  assert(is_arithmetic_term(terms, t) && is_pos_term(t));

  if (term_kind(terms, t) == ARITH_CONSTANT) {
    poly_buffer_addmul_monomial(aux, const_idx, a, rational_term_desc(terms, t));
  } else {
    poly_buffer_add_monomial(aux, t, a);
  }
}												     

static void poly_buffer_add_term(term_table_t *terms, poly_buffer_t *aux, term_t t) {
  assert(is_arithmetic_term(terms, t) && is_pos_term(t));

  if (term_kind(terms, t) == ARITH_CONSTANT) {
    poly_buffer_add_const(aux, rational_term_desc(terms, t));
  } else {
    poly_buffer_add_var(aux, t);
  }
}

static void poly_buffer_sub_term(term_table_t *terms, poly_buffer_t *aux, term_t t) {
  assert(is_arithmetic_term(terms, t) && is_pos_term(t));

  if (term_kind(terms, t) == ARITH_CONSTANT) {
    poly_buffer_sub_const(aux, rational_term_desc(terms, t));
  } else {
    poly_buffer_sub_var(aux, t);
  }
}



/*
 * Apply substitutions then check whether p is a difference logic term
 */
static bool check_diff_logic_poly(context_t *ctx, dl_data_t *stats, polynomial_t *p, bool idl) {
  poly_buffer_t *aux;
  monomial_t *mono;
  term_table_t *terms;
  uint32_t i, n;
  term_t t;

  aux = context_get_poly_buffer(ctx);
  reset_poly_buffer(aux);

  assert(poly_buffer_is_zero(aux));

  n = p->nterms;
  mono = p->mono;

  /*
   * p is of the form a0 + a_1 t_1 + ... + a_n t_n 
   * We replace t_i by its root in S(t_i) in the intern table.
   * The result a0 + a_1 S(t_1) + ... + a_n S(t_n) is stored in buffer aux..
   * Then we check whether aux is a difference logic polynomial.
   */
  assert(n > 0); // because zero polynomial is converted to 0 constant 
  
  // deal with the constant first
  if (mono[0].var == const_idx) {
    poly_buffer_add_const(aux, &mono[0].coeff);
    n --;
    mono ++;
  }

  terms = ctx->terms;
  for (i=0; i<n; i++) {
    t = intern_tbl_get_root(&ctx->intern, mono[i].var);
    poly_buffer_addmul_term(terms, aux, t, &mono[i].coeff);
  }

  normalize_poly_buffer(aux);

  return check_dl_poly_buffer(ctx, stats, aux, idl);
}


/*
 * Check whether (x - y) is a difference logic term
 */
static bool check_diff_logic_eq(context_t *ctx, dl_data_t *stats, term_t x, term_t y, bool idl) {
  term_table_t *terms;
  poly_buffer_t *aux;

  assert(is_arithmetic_term(ctx->terms, x) && is_pos_term(x) &&
	 is_arithmetic_term(ctx->terms, y) && is_pos_term(y));

  aux = context_get_poly_buffer(ctx);
  reset_poly_buffer(aux);
  assert(poly_buffer_is_zero(aux));

  // build polynomial (x - y) after applying substitutions
  terms = ctx->terms;
  poly_buffer_add_term(terms, aux, intern_tbl_get_root(&ctx->intern, x));
  poly_buffer_sub_term(terms, aux, intern_tbl_get_root(&ctx->intern, y));    
  normalize_poly_buffer(aux);

  return check_dl_poly_buffer(ctx, stats, aux, idl);
}




/*
 * Check whether term t is a difference logic term and update stats
 * - if idl is true, check whether t is in the IDL fragment
 * - otherwise, check whether t is in the RDL fragment
 *
 * The difference logic fragment contains terms of the following forms:
 *   a + x - y
 *   a + x
 *   a - y
 *   a
 * where x and y are arithmetic variables and a is a constant (possibly a = 0).
 *
 * In IDL, x and y must be integer variables and 'a' must be an integer constant.
 * (TODO: We could relax that and accept rational a?)
 * In RDL, x and y must be real variables.
 */
static bool check_diff_logic_term(context_t *ctx, dl_data_t *stats, term_t t, bool idl) {
  term_table_t *terms;


  assert(is_arithmetic_term(ctx->terms, t));

  terms = ctx->terms;

  // apply substitution
  t = intern_tbl_get_root(&ctx->intern, t);

  assert(is_arithmetic_term(terms, t) && is_pos_term(t) 
	 && intern_tbl_is_root(&ctx->intern, t));

  switch (term_kind(terms, t)) {
  case ARITH_CONSTANT:
    return !idl || q_is_integer(rational_term_desc(terms, t));

  case UNINTERPRETED_TERM:
    return check_diff_logic_eq(ctx, stats, t, zero_term, idl);

  case ARITH_POLY:
    return check_diff_logic_poly(ctx, stats, poly_term_desc(terms, t), idl);

  default:
    // TODO: we could accept if-then-else here?
    return false;
  }
}


/*
 * Analyze all arithmetic atoms in term t and fill in stats
 * - if idl is true, this checks for integer difference logic
 *   otherwise, checks for real difference logic
 * - cache must be initialized and contain all the terms already visited
 */
static void analyze_dl(context_t *ctx, dl_data_t *stats, term_t t, bool idl) {
  term_table_t *terms;
  composite_term_t *cmp;
  uint32_t i, n;
  int32_t idx;
  term_t r;

  assert(is_boolean_term(ctx->terms, t));

  idx = index_of(t); // remove negation

  if (int_bvset_add(ctx->cache, idx)) {
    /*
     * idx not visited yet
     */
    terms = ctx->terms;
    switch (kind_for_idx(terms, idx)) {
    case CONSTANT_TERM:
      assert(idx == bool_const);
      break;

    case UNINTERPRETED_TERM:
      // follow the substitutions if any
      r = intern_tbl_get_root(&ctx->intern, pos_term(idx));
      if (r != pos_term(idx)) {
	analyze_dl(ctx, stats, r, idl);
      }
      break;
      
    case ITE_TERM:
    case ITE_SPECIAL:
    case OR_TERM:
    case XOR_TERM:
      cmp = composite_for_idx(terms, idx);
      n = cmp->arity;
      for (i=0; i<n; i++) {
	analyze_dl(ctx, stats, cmp->arg[i], idl);
      }
      break;

    case EQ_TERM:
      cmp = composite_for_idx(terms, idx);
      assert(cmp->arity == 2);
      if (is_boolean_term(terms, cmp->arg[0])) {
	// boolean equality
	analyze_dl(ctx, stats, cmp->arg[0], idl);
	analyze_dl(ctx, stats, cmp->arg[1], idl);
      } else {
	goto abort;
      }
      break;

    case ARITH_EQ_ATOM:
      // term (x == 0): check whether x is a difference logic term
      if (! check_diff_logic_term(ctx, stats, integer_value_for_idx(terms, idx), idl)) {
	goto abort;
      }
      stats->num_eqs ++;
      break;

    case ARITH_GE_ATOM:
      // term (x >= 0): check whether x is a difference logic term
      if (! check_diff_logic_term(ctx, stats, integer_value_for_idx(terms, idx), idl)) {
	goto abort;
      }
      break;

    case ARITH_BINEQ_ATOM:
      // term (x == y): check whether x - y is a difference logic term
      cmp = composite_for_idx(terms, idx);
      assert(cmp->arity == 2);
      if (! check_diff_logic_eq(ctx, stats, cmp->arg[0], cmp->arg[1], idl)) {
	goto abort;
      }
      break;

    default:
      goto abort;
    }
  }

  return;

 abort:  
  longjmp(ctx->env, LOGIC_NOT_SUPPORTED);
}
  

/*
 * Check all terms in vector v
 */
static void analyze_diff_logic_vector(context_t *ctx, dl_data_t *stats, ivector_t *v, bool idl) {
  uint32_t i, n;

  n = v->size;
  for (i=0; i<n; i++) {
    analyze_dl(ctx, stats, v->data[i], idl);
  }
}


/*
 * Check difference logic after flattening:
 * - check whether all formulas in top_eqs, top_atoms, and top_formulas
 *   are in the difference logic fragment. If so, compute the benchmark 
 *   profile (i.e., statistics on number of variables + atoms)
 * - if idl is true, all variables must be integer (i.e., the formula is 
 *   in the IDL fragment), otherwise all variables must be real (i.e., the 
 *   formula is in the RDL fragment).
 *
 * - if all assertions are in IDL or RDL.
 *   the statistics are stored in ctx->dl_profile. 
 * - raise an exception 'LOGIC_NOT_SUPPORTED' otherwise.
 *
 * This function is used to decide whether to use simplex or a
 * specialized solver when the architecture is CTX_AUTO_IDL or
 * CTX_AUTO_RDL.  Because this function is called before the actual
 * arithmetic solver is created, we assume that no arithmetic term is
 * internalized, and that top_interns is empty.
 */
static void analyze_diff_logic(context_t *ctx, bool idl) {
  dl_data_t *stats;

  stats = context_get_dl_profile(ctx);
  (void) context_get_cache(ctx); // allocate and initialize the cache

  analyze_diff_logic_vector(ctx, stats, &ctx->top_eqs, idl);
  analyze_diff_logic_vector(ctx, stats, &ctx->top_atoms, idl);
  analyze_diff_logic_vector(ctx, stats, &ctx->top_formulas, idl);


#if (TRACE || TRACE_DL)
  printf("==== Difference logic ====\n");
  if (idl) {
    printf("---> IDL\n");
  } else {
    printf("---> RDL\n");
  }
  printf("---> %"PRIu32" variables\n", stats->num_vars);
  printf("---> %"PRIu32" atoms\n", stats->num_atoms);
  printf("---> %"PRIu32" equalities\n", stats->num_eqs);
  printf("---> sum const = ");
  q_print(stdout, &stats->sum_const);
  printf("\n");
#endif

  context_free_cache(ctx);
}



/**********************
 *  INTERNALIZATION   *
 *********************/

/*
 * Main internalization functions:
 * - convert a term t to an egraph term
 * - convert a boolean term t to a literal
 * - convert an integer or real term t to an arithmetic variable
 * - convert a bitvector term t to a bitvector variable
 */
static occ_t internalize_to_eterm(context_t *ctx, term_t t);
static literal_t internalize_to_literal(context_t *ctx, term_t t);
static thvar_t internalize_to_arith(context_t *ctx, term_t t);
static thvar_t internalize_to_bv(context_t *ctx, term_t t);


/*
 * Place holders for now
 */
static occ_t internalize_to_eterm(context_t *ctx, term_t t) {
  longjmp(ctx->env, UF_NOT_SUPPORTED);
  return null_occurrence;
}

static thvar_t internalize_to_arith(context_t *ctx, term_t t) {
  longjmp(ctx->env, ARITH_NOT_SUPPORTED);
  return null_thvar;
}

static thvar_t internalize_to_bv(context_t *ctx, term_t t) {
  longjmp(ctx->env, BV_NOT_SUPPORTED);
  return null_thvar;
}



/*
 * CONVERSION TO LITERALS
 */

/*
 * Boolean if-then-else
 */
static literal_t map_ite_to_literal(context_t *ctx, composite_term_t *ite) {
  literal_t l1, l2, l3;

  assert(ite->arity == 3);
  l1 = internalize_to_literal(ctx, ite->arg[0]); // condition
  if (l1 == true_literal) {
    return internalize_to_literal(ctx, ite->arg[1]);
  }
  if (l1 == false_literal) {
    return internalize_to_literal(ctx, ite->arg[2]);
  }

  l2 = internalize_to_literal(ctx, ite->arg[1]);
  l3 = internalize_to_literal(ctx, ite->arg[2]);

  return mk_ite_gate(&ctx->gate_manager, l1, l2, l3);
}

static literal_t map_eq_to_literal(context_t *ctx, composite_term_t *eq) {
  //  occ_t u, v;
  literal_t l1, l2, l;

  assert(eq->arity == 2);

  if (is_boolean_term(ctx->terms, eq->arg[0])) {
    assert(is_boolean_term(ctx->terms, eq->arg[1]));

    l1 = internalize_to_literal(ctx, eq->arg[0]);
    l2 = internalize_to_literal(ctx, eq->arg[1]);
    l = mk_iff_gate(&ctx->gate_manager, l1, l2);
  } else {
    // HACK FOR TESTING
#if 0
    u = internalize_to_eterm(ctx, eq->arg[0]);
    v = internalize_to_eterm(ctx, eq->arg[1]);
    l = egraph_make_eq(ctx->egraph, u, v);
#endif

    l = pos_lit(create_boolean_variable(ctx->core));
  }

  return l;
}

static literal_t map_or_to_literal(context_t *ctx, composite_term_t *or) {
  int32_t *a;
  ivector_t *v;
  literal_t l;
  uint32_t i, n;

  if (context_flatten_or_enabled(ctx)) {
    // flatten (or ...): store result in v
    v = &ctx->aux_vector;
    assert(v->size == 0);
    flatten_or_term(ctx, v, or);

    // make a copy of v
    n = v->size;
    a = alloc_istack_array(&ctx->istack, n);
    for (i=0; i<n; i++) {
      a[i] = v->data[i];
    }
    ivector_reset(v);

    // internalize a[0 ... n-1]
    for (i=0; i<n; i++) {
      a[i] = internalize_to_literal(ctx, a[i]);
    }

  } else {
    // no flattening
    n = or->arity;
    a = alloc_istack_array(&ctx->istack, n);
    for (i=0; i<n; i++) {
      a[i] = internalize_to_literal(ctx, or->arg[i]);
    }
  }

  l = mk_or_gate(&ctx->gate_manager, n, a);
  free_istack_array(&ctx->istack, a);

  return l;
}

static literal_t map_xor_to_literal(context_t *ctx, composite_term_t *xor) {
  int32_t *a;
  literal_t l;
  uint32_t i, n;

  // TODO: add flattening here?

  n = xor->arity;
  a = alloc_istack_array(&ctx->istack, n);
  for (i=0; i<n; i++) {
    a[i] = internalize_to_literal(ctx, xor->arg[i]);
  }

  l = mk_xor_gate(&ctx->gate_manager, n, a);
  free_istack_array(&ctx->istack, a);

  return l;
}


/*
 * Translate an internalization code x to a literal
 * - if x is the code of an egraph occurrence u, we return the 
 *   theory variable for u in the egraph
 * - otherwise, x should be the code of a literal l in the core
 */
static literal_t translate_code_to_literal(context_t *ctx, int32_t x) {
  occ_t u;
  literal_t l;

  assert(code_is_valid(x));
  if (code_is_eterm(x)) {
    u = code2occ(x);
    if (term_of_occ(u) == true_term) {
      l = mk_lit(bool_const, polarity_of(u));

      assert((u == true_occ && l == true_literal) || 
	     (u == false_occ && l == false_literal));
    } else {
      assert(ctx->egraph != NULL);
      l = egraph_occ2literal(ctx->egraph, u);
    }
  } else {
    l = code2literal(x);
  }

  return l;
}

static literal_t internalize_to_literal(context_t *ctx, term_t t) {
  term_table_t *terms;
  int32_t code;
  uint32_t polarity;
  term_t r;
  literal_t l;

  assert(is_boolean_term(ctx->terms, t));  

  r = intern_tbl_get_root(&ctx->intern, t);
  polarity = polarity_of(r);
  r = unsigned_term(r);

  /*
   * At this point:
   * 1) r is a positive root in the internalization table
   * 2) polarity is 1 or 0
   * 3) if polarity is 0, then t is equal to r by substitution
   *    if polarity is 1, then t is equal to (not r)
   *
   * We get l := internalization of r
   * then return l or (not l) depending on polarity.
   */

  if (intern_tbl_root_is_mapped(&ctx->intern, r)) {
    /*
     * r already internalized
     */
    code = intern_tbl_map_of_root(&ctx->intern, r);
    l = translate_code_to_literal(ctx, code);

  } else {
    /*
     * Recursively compute r's internalization
     */
    terms = ctx->terms;
    switch (term_kind(terms, r)) {
    case CONSTANT_TERM:
      assert(r == true_term);
      l = true_literal;
      break;

    case UNINTERPRETED_TERM:
      l = pos_lit(create_boolean_variable(ctx->core));
      break;

    case ITE_TERM:
    case ITE_SPECIAL:
      l = map_ite_to_literal(ctx, ite_term_desc(terms, r));
      break;

    case EQ_TERM:
      l = map_eq_to_literal(ctx, eq_term_desc(terms, r));
      break;

    case OR_TERM:
      l = map_or_to_literal(ctx, or_term_desc(terms, r));
      break;

    case XOR_TERM:
      l = map_xor_to_literal(ctx, xor_term_desc(terms, r));
      break;

      // HACK FOR TESTING: MAP ANY ATOM TO A FRESH BOOLEAN VARIABLE
    case ARITH_EQ_ATOM:
    case ARITH_GE_ATOM:
    case APP_TERM:
    case DISTINCT_TERM:
    case FORALL_TERM:
    case ARITH_BINEQ_ATOM:
    case SELECT_TERM:
    case BIT_TERM:
    case BV_EQ_ATOM:
    case BV_GE_ATOM:
    case BV_SGE_ATOM:
      l = pos_lit(create_boolean_variable(ctx->core));
      break;

    default:
      longjmp(ctx->env, LOGIC_NOT_SUPPORTED);
      break;
    }

    // map r to l in the internalization table
    intern_tbl_map_root(&ctx->intern, r, literal2code(l));
  }


  return l ^ polarity;
}



/*********************************
 *  PRE-INTERNALIZED ASSERTIONS  *
 ********************************/

/*
 * Assert (x == tt) for an internalization code x
 */
static void assert_internalization_code(context_t *ctx, int32_t x, bool tt) {
  occ_t g;
  literal_t l;
  
  assert(code_is_valid(x));

  if (code_is_eterm(x)) {
    // normalize to assertion (g == true)
    g = code2occ(x);
    if (! tt) g = opposite_occ(g);

    // We must deal with 'true_occ/false_occ' separately
    // since they may be used even if there's no actual egraph.
    if (g == false_occ) {
      longjmp(ctx->env, TRIVIALLY_UNSAT);
    } else if (g != true_occ) {
      assert(ctx->egraph != NULL);
      egraph_assert_axiom(ctx->egraph, g);
    }
  } else {
    l = code2literal(x);
    if (! tt) l = not(l);
    add_unit_clause(ctx->core, l);    
  }
}

/*
 * Assert t == true where t is a term that's already mapped
 * either to a literal or to an egraph occurrence.
 * - t must be a root in the internalization table
 */
static void assert_toplevel_intern(context_t *ctx, term_t t) {
  int32_t code;
  bool tt;

  assert(is_boolean_term(ctx->terms, t) && 
	 intern_tbl_is_root(&ctx->intern, t) &&
	 intern_tbl_root_is_mapped(&ctx->intern, t));

  tt = is_pos_term(t);
  t = unsigned_term(t);
  code = intern_tbl_map_of_root(&ctx->intern, t);

  assert_internalization_code(ctx, code, tt);
}





/*****************************************************
 *  INTERNALIZATION OF TOP-LEVEL ATOMS AND FORMULAS  *
 ****************************************************/

/*
 * Recursive function: assert (t == tt) for a boolean term t
 * - this is used when a toplevel formula simplified to t
 *   For example (ite c t u) --> t if c is true.
 * - t is not necessarily a root in the internalization table
 */ 
static void assert_term(context_t *ctx, term_t t, bool tt);


/*
 * Top-level equality assertion (eq t1 t2):
 * - if tt is true, assert (t1 == t2)
 *   if tt is false, assert (t1 != t2)
 */
static void assert_toplevel_eq(context_t *ctx, composite_term_t *eq, bool tt) {
  //  occ_t u1, u2;
  literal_t l1, l2;

  assert(eq->arity == 2);

  if (is_boolean_term(ctx->terms, eq->arg[0])) {
    assert(is_boolean_term(ctx->terms, eq->arg[1]));

    l1 = internalize_to_literal(ctx, eq->arg[0]);
    l2 = internalize_to_literal(ctx, eq->arg[1]);
    assert_iff(&ctx->gate_manager, l1, l2, tt);

  } else {
#if 0
    u1 = internalize_to_eterm(ctx, eq->arg[0]);
    u2 = internalize_to_eterm(ctx, eq->arg[1]);
    if (tt) {
      egraph_assert_eq_axiom(ctx->egraph, u1, u2);
    } else {
      egraph_assert_diseq_axiom(ctx->egraph, u1, u2);
    }
    // HACK: FOR TESTING. NOTHING TO DO
#endif
  }
}


/*
 * Top-level boolean if-then-else (ite c t1 t2)
 * - if tt is true: assert (ite c t1 t2)
 * - if tt is false: assert (not (ite c t1 t2))
 */
static void assert_toplevel_ite(context_t *ctx, composite_term_t *ite, bool tt) {
  literal_t l1, l2, l3;

  assert(ite->arity == 3);

  l1 = internalize_to_literal(ctx, ite->arg[0]);
  if (l1 == true_literal) {
    assert_term(ctx, ite->arg[1], tt); 
  } else if (l1 == false_literal) {
    assert_term(ctx, ite->arg[2], tt);
  } else {
    l2 = internalize_to_literal(ctx, ite->arg[1]);
    l3 = internalize_to_literal(ctx, ite->arg[2]);
    assert_ite(&ctx->gate_manager, l1, l2, l3, tt);
  }
}


/*
 * Top-level (or t1 ... t_n)
 * - it tt is true: add a clause
 * - it tt is false: add unit clauses
 */
static void assert_toplevel_or(context_t *ctx, composite_term_t *or, bool tt) {
  ivector_t *v;
  int32_t *a;
  uint32_t i, n;
  literal_t l;

  // TODO: improve this
  if (context_flatten_or_enabled(ctx)) {
    // flatten: the result is in v
    v = &ctx->aux_vector;
    assert(v->size == 0);
    flatten_or_term(ctx, v, or);

    // make a copy of v
    n = v->size;
    a = alloc_istack_array(&ctx->istack, n);
    for (i=0; i<n; i++) {
      a[i] = v->data[i];
    }
    ivector_reset(v);

    // internalize all elements of a
    for (i=0; i<n; i++) {
      a[i] = internalize_to_literal(ctx, a[i]);
    }

    if (tt) {
      // assert (or a[0] ... a[n-1]) 
      add_clause(ctx->core, n, a);
    } else {
      // assert (not a[0]) ... (not a[n-1])
      for (i=0; i<n; i++) {
	add_unit_clause(ctx->core, not(a[i]));
      }
    }

    free_istack_array(&ctx->istack, a);

  } else if (tt) {
    // no flattening, asserted true
    n = or->arity;
    a = alloc_istack_array(&ctx->istack, n);
    for (i=0; i<n; i++) {
      a[i] = internalize_to_literal(ctx, or->arg[i]);
    }

    add_clause(ctx->core, n, a);
    free_istack_array(&ctx->istack, a);

  } else {
    // no flattening, asserted false
    n = or->arity;
    for (i=0; i<n; i++) {
      l = internalize_to_literal(ctx, or->arg[i]);
      add_unit_clause(ctx->core, not(l));
    }
  }
}


/*
 * Top-level (xor t1 ... t_n) == tt
 */
static void assert_toplevel_xor(context_t *ctx, composite_term_t *xor, bool tt) {
  int32_t *a;
  uint32_t i, n;

  n = xor->arity;
  a = alloc_istack_array(&ctx->istack, n);
  for (i=0; i<n; i++) {
    a[i] = internalize_to_literal(ctx, xor->arg[i]);
  }

  assert_xor(&ctx->gate_manager, n, a, tt);
  free_istack_array(&ctx->istack, a);
}
 


/*
 * Top-level formula t:
 * - t is a boolean term (or the negation of a boolean term)
 * - t must be a root in the internalization table and must be mapped to true
 */
static void assert_toplevel_formula(context_t *ctx, term_t t) {
  term_table_t *terms;
  int32_t code;
  bool tt;

  assert(is_boolean_term(ctx->terms, t) && 
	 intern_tbl_is_root(&ctx->intern, t) &&
	 term_is_true(ctx, t));

  tt = is_pos_term(t);
  t = unsigned_term(t);

  /*
   * Now: t is a root and has positive polarity
   * - tt indicates whether we assert t or (not t):
   *   tt true: assert t
   *   tt false: assert (not t)
   */
  terms = ctx->terms;
  switch (term_kind(terms, t)) {
  case CONSTANT_TERM:
  case UNINTERPRETED_TERM:
    // should be eliminated by flattening
    code = INTERNAL_ERROR;
    goto abort;

  case ITE_TERM:
  case ITE_SPECIAL:
    assert_toplevel_ite(ctx, ite_term_desc(terms, t), tt);
    break;

  case OR_TERM:
    assert_toplevel_or(ctx, or_term_desc(terms, t), tt);
    break;

  case XOR_TERM:
    assert_toplevel_xor(ctx, xor_term_desc(terms, t), tt);
    break;

  case EQ_TERM:
    assert_toplevel_eq(ctx, eq_term_desc(terms, t), tt);
    break;

      // HACK FOR TESTING: DON'T ABORT ON ATOMS
  case ARITH_EQ_ATOM:
  case ARITH_GE_ATOM:
  case APP_TERM:
  case DISTINCT_TERM:
  case FORALL_TERM:
  case ARITH_BINEQ_ATOM:
  case SELECT_TERM:
  case BIT_TERM:
  case BV_EQ_ATOM:
  case BV_GE_ATOM:
  case BV_SGE_ATOM:
    break;

  default:
    code = LOGIC_NOT_SUPPORTED;
    goto abort;
  }

  return;

 abort:
  longjmp(ctx->env, code);
}



/*
 * Assert (t == tt) for a boolean term t:
 * - if t is not internalized, record the mapping 
 *   (root t) --> tt in the internalization table 
 */
static void assert_term(context_t *ctx, term_t t, bool tt) {
  term_table_t *terms;
  int32_t code;
  
  assert(is_boolean_term(ctx->terms, t));

  /*
   * Apply substitution + fix polarity
   */
  t = intern_tbl_get_root(&ctx->intern, t);
  tt ^= is_neg_term(t);
  t = unsigned_term(t);

  if (intern_tbl_root_is_mapped(&ctx->intern, t)) {
    /*
     * The root is already mapped:
     * Either t is already internalized, or it occurs in
     * one of the vectors top_eqs, top_atoms, top_formulas
     * and it will be internalize/asserted later.
     */
    code = intern_tbl_map_of_root(&ctx->intern, t);
    assert_internalization_code(ctx, code, tt);

  } else {
    // store the mapping t --> tt
    intern_tbl_map_root(&ctx->intern, t, bool2code(tt));

    // internalize and assert
    terms = ctx->terms;
    switch (term_kind(terms, t)) {
    case CONSTANT_TERM:
      // should always be internalized
      code = INTERNAL_ERROR;
      goto abort;

    case UNINTERPRETED_TERM: 
      // nothing to do: t --> true/false in the internalization table
      break;

    case ITE_TERM:
    case ITE_SPECIAL:
      assert_toplevel_ite(ctx, ite_term_desc(terms, t), tt);
      break;

    case OR_TERM:
      assert_toplevel_or(ctx, or_term_desc(terms, t), tt);
      break;

    case XOR_TERM:
      assert_toplevel_xor(ctx, xor_term_desc(terms, t), tt);
      break;

    case EQ_TERM:
      assert_toplevel_eq(ctx, eq_term_desc(terms, t), tt);
      break;

      // HACK FOR TESTING: DON'T ABORT ON ATOMS
    case ARITH_EQ_ATOM:
    case ARITH_GE_ATOM:
    case APP_TERM:
    case DISTINCT_TERM:
    case FORALL_TERM:
    case ARITH_BINEQ_ATOM:
    case SELECT_TERM:
    case BIT_TERM:
    case BV_EQ_ATOM:
    case BV_GE_ATOM:
    case BV_SGE_ATOM:
      break;

    default:
      code = LOGIC_NOT_SUPPORTED;
      goto abort;
    }
  }

  return;

 abort:
  longjmp(ctx->env, code);
} 




/************************
 *  PARAMETERS/OPTIONS  *
 ***********************/

/*
 * Map architecture id to theories word
 */
static const uint32_t const arch2theories[NUM_ARCH] = {
  0,                           //  CTX_ARCH_NOSOLVERS --> empty theory

  UF_MASK,                     //  CTX_ARCH_EG
  ARITH_MASK,                  //  CTX_ARCH_SPLX
  IDL_MASK,                    //  CTX_ARCH_IFW
  RDL_MASK,                    //  CTX_ARCH_RFW
  BV_MASK,                     //  CTX_ARCH_BV
  UF_MASK|FUN_MASK,            //  CTX_ARCH_EGFUN
  UF_MASK|ARITH_MASK,          //  CTX_ARCH_EGSPLX
  UF_MASK|BV_MASK,             //  CTX_ARCH_EGBV
  UF_MASK|ARITH_MASK|FUN_MASK, //  CTX_ARCH_EGFUNSPLX
  UF_MASK|BV_MASK|FUN_MASK,    //  CTX_ARCH_EGFUNBV
  ALLTH_MASK,                  //  CTX_ARCH_EGFUNSPLXBV

  IDL_MASK,                    //  CTX_ARCH_AUTO_IDL
  RDL_MASK,                    //  CTX_ARCH_AUTO_RDL
};


/*
 * Each architecture has a fixed set of solver components:
 * - the set of components is stored as a bit vector (on 8bits)
 * - this uses the following bit-masks
 * For the AUTO_xxx architecture, nothing is required initially,
 * so the bitmask is 0.
 */
#define EGRPH  0x1
#define SPLX   0x2
#define IFW    0x4
#define RFW    0x8
#define BVSLVR 0x10
#define FSLVR  0x20

static const uint8_t const arch_components[NUM_ARCH] = {
  0,                        //  CTX_ARCH_NOSOLVERS

  EGRPH,                    //  CTX_ARCH_EG
  SPLX,                     //  CTX_ARCH_SPLX
  IFW,                      //  CTX_ARCH_IFW
  RFW,                      //  CTX_ARCH_RFW
  BVSLVR,                   //  CTX_ARCH_BV
  EGRPH|FSLVR,              //  CTX_ARCH_EGFUN
  EGRPH|SPLX,               //  CTX_ARCH_EGSPLX
  EGRPH|BVSLVR,             //  CTX_ARCH_EGBV
  EGRPH|SPLX|FSLVR,         //  CTX_ARCH_EGFUNSPLX
  EGRPH|BVSLVR|FSLVR,       //  CTX_ARCH_EGFUNBV
  EGRPH|SPLX|BVSLVR|FSLVR,  //  CTX_ARCH_EGFUNSPLXBV

  0,                        //  CTX_ARCH_AUTO_IDL
  0,                        //  CTX_ARCH_AUTO_RDL
};


/*
 * Smt mode for a context mode
 */
static const smt_mode_t const core_mode[NUM_MODES] = {
  SMT_MODE_BASIC,       // one check
  SMT_MODE_BASIC,       // multichecks
  SMT_MODE_PUSHPOP,     // push/pop
  SMT_MODE_INTERACTIVE, // interactive
};


/*
 * Flags for a context mode
 */
static const uint32_t const mode2options[NUM_MODES] = {
  0,
  MULTICHECKS_OPTION_MASK,
  MULTICHECKS_OPTION_MASK|PUSHPOP_OPTION_MASK,
  MULTICHECKS_OPTION_MASK|PUSHPOP_OPTION_MASK|CLEANINT_OPTION_MASK,
};




/******************
 *  EMPTY SOLVER  *
 *****************/

/*
 * We need an empty theory solver for initializing
 * the core if the architecture is NOSOLVERS.
 */
static void donothing(void *solver) {  
}

static void null_backtrack(void *solver, uint32_t backlevel) {
}

static bool null_propagate(void *solver) {
  return true;
}

static fcheck_code_t null_final_check(void *solver) {
  return FCHECK_SAT;
}

static th_ctrl_interface_t null_ctrl = {
  donothing,        // start_internalization
  donothing,        // start_search
  null_propagate,   // propagate
  null_final_check, // final check
  donothing,        // increase_decision_level
  null_backtrack,   // backtrack
  donothing,        // push
  donothing,        // pop
  donothing,        // reset
};


// for the smt interface, nothing should be called since there are no atoms
static th_smt_interface_t null_smt = {
  NULL, NULL, NULL, NULL, NULL,
};



/*********************
 *  SIMPLEX OPTIONS  *
 ********************/

/*
 * Which version of the arithmetic solver is present
 */
bool context_has_idl_solver(context_t *ctx) {
  uint8_t solvers;
  solvers = arch_components[ctx->arch];
  return ctx->arith_solver != NULL && (solvers & IFW);
}

bool context_has_rdl_solver(context_t *ctx) {
  uint8_t solvers;
  solvers = arch_components[ctx->arch];
  return ctx->arith_solver != NULL && (solvers & RFW);
}

bool context_has_simplex_solver(context_t *ctx) {
  uint8_t solvers;
  solvers = arch_components[ctx->arch];
  return ctx->arith_solver != NULL && (solvers & SPLX);
}


/*
 * If the simplex solver already exists, the options are propagated.
 * Otherwise, they are recorded into the option flags. They will
 * be set up when the simplex solver is created.
 */
void enable_splx_eager_lemmas(context_t *ctx) {
  ctx->options |= SPLX_EGRLMAS_OPTION_MASK;
}

void disable_splx_eager_lemmas(context_t *ctx) {
  ctx->options &= ~SPLX_EGRLMAS_OPTION_MASK;
}


void enable_splx_periodic_icheck(context_t *ctx) {
  ctx->options |= SPLX_ICHECK_OPTION_MASK;
}

void disable_splx_periodic_icheck(context_t *ctx) {
  ctx->options &= ~SPLX_ICHECK_OPTION_MASK;
}



/****************************
 *  SOLVER INITIALIZATION   *
 ***************************/

/*
 * Create and initialize the egraph
 * - the core must be created first
 */
static void create_egraph(context_t *ctx) {
  egraph_t *egraph;

  assert(ctx->egraph == NULL);

  egraph = (egraph_t *) safe_malloc(sizeof(egraph_t));
  init_egraph(egraph, ctx->types);
  ctx->egraph = egraph;
}


/*
 * Create and initialize the idl solver and attach it to the core
 * - there must be no other solvers and no egraph
 * - also initialize the core
 * - copy the solver's internalization interface into arith
 */
static void create_idl_solver(context_t *ctx) {
  idl_solver_t *solver;
  smt_mode_t cmode;

  assert(ctx->egraph == NULL && ctx->arith_solver == NULL && ctx->bv_solver == NULL &&
	 ctx->fun_solver == NULL && ctx->core != NULL);

  cmode = core_mode[ctx->mode];
  solver = (idl_solver_t *) safe_malloc(sizeof(idl_solver_t));
  init_idl_solver(solver, ctx->core, &ctx->gate_manager);
  init_smt_core(ctx->core, CTX_DEFAULT_CORE_SIZE, solver, idl_ctrl_interface(solver),
		idl_smt_interface(solver), cmode);
  idl_solver_init_jmpbuf(solver, &ctx->env);
  ctx->arith_solver = solver;
  ctx->arith = * idl_arith_interface(solver);
}


/*
 * Create and initialize the rdl solver and attach it to the core.
 * - there must be no other solvers and no egraph
 * - also initialize the core
 * - copy the solver's internalization interface in ctx->arith
 */
static void create_rdl_solver(context_t *ctx) {
  rdl_solver_t *solver;
  smt_mode_t cmode;

  assert(ctx->egraph == NULL && ctx->arith_solver == NULL && ctx->bv_solver == NULL &&
	 ctx->fun_solver == NULL && ctx->core != NULL);

  cmode = core_mode[ctx->mode];
  solver = (rdl_solver_t *) safe_malloc(sizeof(rdl_solver_t));
  init_rdl_solver(solver, ctx->core, &ctx->gate_manager);
  init_smt_core(ctx->core, CTX_DEFAULT_CORE_SIZE, solver, rdl_ctrl_interface(solver),
		rdl_smt_interface(solver), cmode);
  rdl_solver_init_jmpbuf(solver, &ctx->env);
  ctx->arith_solver = solver;
  ctx->arith = * rdl_arith_interface(solver);
}



/*
 * Allocate and initialize solvers based on architecture and mode
 * - core and gate manager must exist at this point 
 * - if the architecture is either AUTO_IDL or AUTO_RDL, nothing is done yet,
 *   and the core is not initialized.
 * - otherwise, all components are ready and initialized, including the core.
 */
static void init_solvers(context_t *ctx) {
  uint8_t solvers;
  smt_core_t *core;
  smt_mode_t cmode;
  egraph_t *egraph;

  solvers = arch_components[ctx->arch];

  ctx->egraph = NULL;
  ctx->arith_solver = NULL;
  ctx->bv_solver = NULL;
  ctx->fun_solver = NULL;

  // Create egraph first, then satellite solvers
  if (solvers & EGRPH) {
    create_egraph(ctx);
  }

  // Arithmetic solver
  if (solvers & IFW) {
    create_idl_solver(ctx);
  } else if (solvers & RFW) {
    create_rdl_solver(ctx);
  }

  /*
   * At this point all solvers are ready and initialized,
   * except the egraph and core if the egraph is present 
   * or the core if there are no solvers
   */
  cmode = core_mode[ctx->mode];   // initialization mode for the core
  egraph = ctx->egraph;
  core = ctx->core;
  if (egraph != NULL) {
    init_smt_core(core, CTX_DEFAULT_CORE_SIZE, egraph, egraph_ctrl_interface(egraph), 
		  egraph_smt_interface(egraph), cmode);
    egraph_attach_core(egraph, core);

  } else if (ctx->theories == 0) {
    /*
     * Boolean solver only
     */
    assert(ctx->arith_solver == NULL && ctx->bv_solver == NULL && ctx->fun_solver == NULL);
    init_smt_core(core, CTX_DEFAULT_CORE_SIZE, NULL, &null_ctrl, &null_smt, cmode);
  }
}




/*
 * Delete the arithmetic solver
 */
static void delete_arith_solver(context_t *ctx) {
  uint8_t solvers;

  assert(ctx->arith_solver != NULL);

  solvers = arch_components[ctx->arch];
  if (solvers & IFW) {
    delete_idl_solver(ctx->arith_solver);    
  } else if (solvers & RFW) {
    delete_rdl_solver(ctx->arith_solver);
  }
  safe_free(ctx->arith_solver);
  ctx->arith_solver = NULL;
}




/*****************************
 *  CONTEXT INITIALIZATION   *
 ****************************/

/*
 * Check mode and architecture
 */
static inline bool valid_mode(context_mode_t mode) {
  return CTX_MODE_ONECHECK <= mode && mode <= CTX_MODE_INTERACTIVE;
}

static inline bool valid_arch(context_arch_t arch) {
  return CTX_ARCH_NOSOLVERS <= arch && arch <= CTX_ARCH_AUTO_RDL;
}



/*
 * Initialize ctx for the given mode and architecture
 * - terms = term table for that context
 * - qflag = true means quantifiers allowed
 * - qflag = false means no quantifiers
 */
void init_context(context_t *ctx, term_table_t *terms,
		  context_mode_t mode, context_arch_t arch, bool qflag) {  
  assert(valid_mode(mode) && valid_arch(arch));

  /*
   * Set architecture and options
   */
  ctx->mode = mode;
  ctx->arch = arch;
  ctx->theories = arch2theories[arch];
  ctx->options = mode2options[mode];
  if (qflag) {
    // quantifiers require egraph
    assert((ctx->theories & UF_MASK) != 0);
    ctx->theories |= QUANT_MASK;
  }

  ctx->base_level = 0;

  /*
   * The core is always needed: allocate it here. It's not initialized yet.
   * The other solver are optionals.
   */
  ctx->core = (smt_core_t *) safe_malloc(sizeof(smt_core_t));
  ctx->egraph = NULL;
  ctx->arith_solver = NULL;
  ctx->bv_solver = NULL;
  ctx->fun_solver = NULL;

  /*
   * Global tables + gate manager
   */
  ctx->types = terms->types;
  ctx->terms = terms;
  init_gate_manager(&ctx->gate_manager, ctx->core);

  /*
   * Simplification/internalization support
   */
  init_intern_tbl(&ctx->intern, 0, terms);  
  init_ivector(&ctx->assertions, CTX_DEFAULT_VECTOR_SIZE);
  init_ivector(&ctx->top_eqs, CTX_DEFAULT_VECTOR_SIZE);
  init_ivector(&ctx->top_atoms, CTX_DEFAULT_VECTOR_SIZE);
  init_ivector(&ctx->top_formulas, CTX_DEFAULT_VECTOR_SIZE);
  init_ivector(&ctx->top_interns, CTX_DEFAULT_VECTOR_SIZE);

  /*
   * Force the internalization mapping for true and false
   * - true  term --> true_occ
   * - false term --> false_occ 
   * This mapping holds even if there's no egraph.
   */
  intern_tbl_map_root(&ctx->intern, true_term, bool2code(true));

  /*
   * Auxiliary internalization buffers
   */
  init_ivector(&ctx->subst_eqs, CTX_DEFAULT_VECTOR_SIZE);
  init_ivector(&ctx->aux_vector, CTX_DEFAULT_VECTOR_SIZE);
  init_istack(&ctx->istack);
  init_int_queue(&ctx->queue, 0);
  ctx->subst = NULL;
  ctx->marks = NULL;
  ctx->cache = NULL;
  ctx->small_cache = NULL;
  ctx->arith_buffer = NULL;
  ctx->poly_buffer = NULL;
  ctx->dl_profile = NULL;


  /*
   * Allocate and initialize the solvers and core
   * NOTE: the core is not initialized yet if arch is AUTO_IDL or AUTO_RDL
   */
  init_solvers(ctx);
}




/*
 * Delete ctx
 */
void delete_context(context_t *ctx) {
  if (ctx->core != NULL) {
    if (ctx->arch != CTX_ARCH_AUTO_IDL && ctx->arch != CTX_ARCH_AUTO_RDL) {
      delete_smt_core(ctx->core);
    }
    safe_free(ctx->core);
    ctx->core = NULL;
  }

  if (ctx->egraph != NULL) {
    delete_egraph(ctx->egraph);
    safe_free(ctx->egraph);
    ctx->egraph = NULL;
  }

  if (ctx->arith_solver != NULL) {
    delete_arith_solver(ctx);
  }

  delete_gate_manager(&ctx->gate_manager);

  delete_intern_tbl(&ctx->intern);
  delete_ivector(&ctx->assertions);
  delete_ivector(&ctx->top_eqs);
  delete_ivector(&ctx->top_atoms);
  delete_ivector(&ctx->top_formulas);
  delete_ivector(&ctx->top_interns);

  delete_ivector(&ctx->subst_eqs);
  delete_ivector(&ctx->aux_vector);
  delete_istack(&ctx->istack);
  delete_int_queue(&ctx->queue);

  context_free_subst(ctx);
  context_free_marks(ctx);
  context_free_cache(ctx);
  context_free_small_cache(ctx);
  context_free_arith_buffer(ctx);
  context_free_poly_buffer(ctx);
  context_free_dl_profile(ctx);
}



/*
 * Reset: remove all assertions and clear all internalization tables
 */
void reset_context(context_t *ctx) {
  ctx->base_level = 0;

  reset_smt_core(ctx->core); // this propagates reset to all solvers

  reset_gate_manager(&ctx->gate_manager);

  reset_intern_tbl(&ctx->intern);
  ivector_reset(&ctx->assertions);
  ivector_reset(&ctx->top_eqs);
  ivector_reset(&ctx->top_atoms);
  ivector_reset(&ctx->top_formulas);
  ivector_reset(&ctx->top_interns);

  // Force the internalization mapping for true and false
  intern_tbl_map_root(&ctx->intern, true_term, bool2code(true));

  ivector_reset(&ctx->subst_eqs);
  ivector_reset(&ctx->aux_vector);
  reset_istack(&ctx->istack);
  int_queue_reset(&ctx->queue);

  context_free_subst(ctx);
  context_free_marks(ctx);
  context_reset_small_cache(ctx);
  context_free_arith_buffer(ctx);
  context_reset_poly_buffer(ctx);
  context_free_dl_profile(ctx);
}



/*
 * Push and pop
 */
void context_push(context_t *ctx) {
  assert(context_supports_pushpop(ctx));
  smt_push(ctx->core);  // propagates to all solvers
  gate_manager_push(&ctx->gate_manager);
  intern_tbl_push(&ctx->intern);
  ctx->base_level ++;
}

void context_pop(context_t *ctx) {
  assert(ctx->base_level > 0);
  smt_pop(ctx->core);   // propagates to all solvers
  gate_manager_pop(&ctx->gate_manager);
  intern_tbl_pop(&ctx->intern);
  ctx->base_level --;
}





/****************************
 *   ASSERTIONS AND CHECK   *
 ***************************/

/*
 * Flatten and internalize assertions a[0 ... n-1]
 * - all elements a[i] must be valid boolean term in ctx->terms
 * - return code: 
 *   TRIVIALLY_UNSAT if there's an easy contradiction
 *   CTX_NO_ERROR if the assertions were processed without error
 *   a negative error code otherwise.
 */
static int32_t context_process_assertions(context_t *ctx, uint32_t n, term_t *a) {
  ivector_t *v;
  uint32_t i;
  int code;

  ivector_reset(&ctx->top_eqs);
  ivector_reset(&ctx->top_atoms);
  ivector_reset(&ctx->top_formulas);
  ivector_reset(&ctx->top_interns);
  ivector_reset(&ctx->subst_eqs);

  code = setjmp(ctx->env);
  if (code == 0) {
    // flatten
    for (i=0; i<n; i++) {
      flatten_assertion(ctx, a[i]);
    }

    // deal with variable substitutions if any
    if (ctx->subst_eqs.size > 0) {
      context_process_candidate_subst(ctx);
    }

    /*
     * At this point, the assertions are stored into the four vectors
     * top_eqs, top_atoms, top_formulas, and top_interns, and
     * ctx->intern stores the internalized terms and the variable
     * substitutions.
     */

    // optional processing
    switch (ctx->arch) {
    case CTX_ARCH_EG:
      if (context_eq_abstraction_enabled(ctx)) {
	code = analyze_uf(ctx);
	if (code != CTX_NO_ERROR) return code;
      }
      break;

    case CTX_ARCH_AUTO_IDL:
      analyze_diff_logic(ctx, true);
      break;
      
    case CTX_ARCH_AUTO_RDL:
      analyze_diff_logic(ctx, false);
      break;

    default:
      break;
    }

    internalization_start(ctx->core); // ?? Get rid of this?

    /*
     * Now assert top_eqs, top_atoms, top_formulas, top_interns
     */
    // first: all terms that are already internalized
    v = &ctx->top_interns;
    n = v->size;
    for (i=0; i<n; i++) {
      assert_toplevel_intern(ctx, v->data[i]);
    }

    // second: all top-level equalities
    v = &ctx->top_eqs;
    n = v->size;
    for (i=0; i<n; i++) {
      assert_toplevel_formula(ctx, v->data[i]);
    }

    // third: all top-level atoms (other than equalities)
    v = &ctx->top_atoms;
    n = v->size;
    for (i=0; i<n; i++) {
      assert_toplevel_formula(ctx, v->data[i]);
    }

    // last: all non-atomic, formulas
    v =  &ctx->top_formulas;
    n = v->size;
    for (i=0; i<n; i++) {
      assert_toplevel_formula(ctx, v->data[i]);
    }

    // one round of propagation
    code = CTX_NO_ERROR;
    if (! base_propagate(ctx->core)) {
      code = TRIVIALLY_UNSAT;
    }

    return code;

  } else {
    /*
     * Exception: return from longjmp(ctx->env, code);
     */
    reset_istack(&ctx->istack);
    int_queue_reset(&ctx->queue);
    context_free_subst(ctx);
    context_free_marks(ctx);

    return (int32_t) code;
  }
}



/*
 * Assert all formulas f[0] ... f[n-1]
 * The context status must be IDLE.
 *
 * Return code:
 * - TRIVIALLY_UNSAT means that an inconsistency is detected
 *   (in that case the context status is set to UNSAT)
 * - CTX_NO_ERROR means no internalization error and status not 
 *   determined
 * - otherwise, the code is negative to report an error.
 */
int32_t assert_formulas(context_t *ctx, uint32_t n, term_t *f) {
  int32_t code;

  assert(ctx->arch == CTX_ARCH_AUTO_IDL || 
	 ctx->arch == CTX_ARCH_AUTO_RDL ||
	 smt_status(ctx->core) == STATUS_IDLE);

  code = context_process_assertions(ctx, n, f);
  if (code == TRIVIALLY_UNSAT &&
      ctx->arch != CTX_ARCH_AUTO_IDL &&
      ctx->arch != CTX_ARCH_AUTO_RDL &&
      smt_status(ctx->core) != STATUS_UNSAT) {
    // force UNSAT in the core
    // we can't do that in AUTO_IDL/AUTO_RDL modes since
    // the core is not initialized yet.
    add_empty_clause(ctx->core);
    ctx->core->status = STATUS_UNSAT;
  }

  return code;
}



/*
 * Assert a boolean formula f.
 *
 * The context status must be IDLE.
 *
 * Return code:
 * - TRIVIALLY_UNSAT means that an inconsistency is detected
 *   (in that case the context status is set to UNSAT)
 * - CTX_NO_ERROR means no internalization error and status not 
 *   determined
 * - otherwise, the code is negative. The assertion could 
 *   not be processed.
 */
int32_t assert_formula(context_t *ctx, term_t f) {
  return assert_formulas(ctx, 1, &f);
}


/*
 * Clear: prepare for more assertions and checks
 * - free the boolean assignment
 * - reset the status to IDLE
 */
void context_clear(context_t *ctx) {
  assert(context_supports_multichecks(ctx));
  smt_clear(ctx->core);
}

