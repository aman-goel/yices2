/*
 * This file is part of the Yices SMT Solver.
 * Copyright (C) 2017 SRI International.
 *
 * Yices is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Yices is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Yices.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "mcsat/trail.h"
#include "mcsat/watch_list_manager.h"
#include "mcsat/variable_db.h"
#include "mcsat/value.h"

#include "utils/int_hash_sets.h"

/**
 * Structure to evaluate bit-vector constraints based on the current trail.
 */
typedef struct bv_evaluator_t {

  /** The context for evaluation */
  const plugin_context_t* ctx;

  /** Cached values (pointers to bvconstant_t) */
  pvector_t value_cache;

  /** Map from terms to values (indices in the bvconst array) */
  int_hmap_t term_values;

  /** Map from atoms to vales */
  int_hmap_t atom_values;

  /** Map from terms/atoms to levels */
  int_hmap_t level_map;

  /** Temp value to provide to the user */
  mcsat_value_t eval_value;

} bv_evaluator_t;

/** Construct the evaluator for the given plugin context */
void bv_evaluator_construct(bv_evaluator_t* evaluator, const plugin_context_t* ctx);

/** Destruct the evaluator */
void bv_evaluator_destruct(bv_evaluator_t* evaluator);

/** Clears the evaluator's cache */
void bv_evaluator_clear_cache(bv_evaluator_t* evaluator);
  
/**
 * Evaluate a BV constraint (atom), return the value (true/false) and set
 * the cstr_eval_level to the lowest level where the constraint still
 * evaluates.
 */
const mcsat_value_t* bv_evaluator_evaluate_var(bv_evaluator_t* evaluator, variable_t cstr, uint32_t* cstr_eval_level);

/**
 * Evaluate a BV constraint (atom), return the value (true/false) and set
 * the cstr_eval_level to the lowest level where the constraint still
 * evaluates.
 */
const mcsat_value_t* bv_evaluator_evaluate_term(bv_evaluator_t* evaluator, term_t cstr, uint32_t* cstr_eval_level);

/**
 * Structure to determine if a bv term is constant, or if all of its bv-variables have values on the trail, etc
 * We use it in the context of a particular conflict
 */
typedef struct bv_csttrail_s {

  plugin_context_t* ctx;
  watch_list_manager_t* wlm;
  
  // bv variables of the conflict that have values on the trail
  int_hset_t free_var;
  // Cache of terms that are constant
  int_hset_t constant_cache;
  // Cache of terms that are not constant but whose bv-variables (necessarily in free_var)
  // all have values on the trail
  int_hset_t evaluable_cache; 

  variable_t conflict_var; // The conflict variable
  term_t conflict_var_term; // The conflict variable as a term
  
} bv_csttrail_t;

// Construct it (once and for all)
void bv_evaluator_csttrail_construct(bv_csttrail_t* csttrail, plugin_context_t* ctx, watch_list_manager_t* wlm);

// Destruct it
void bv_evaluator_csttrail_destruct(bv_csttrail_t* csttrail);

// Reset it for dealing with a new conflict
void bv_evaluator_csttrail_reset(bv_csttrail_t* csttrail, variable_t conflict_var);

// Scanning a new atom of the conflict
void bv_evaluator_csttrail_scan(bv_csttrail_t* csttrail, variable_t atom);

// Checks whether term t evaluates, all its BV-variables having values on the trail.
// If it does not, use_trail is untouched. If it does, then use_trail is set to true
// if the trail is actually used (i.e. term has a BV-variable), otherwise it is set to false.

bool bv_evaluator_is_evaluable(bv_csttrail_t* csttrail, term_t t, bool* use_trail);
