/*
 * CONVERSION OF A THREE-VARIABLE TRUTH TABLE TO CNF
 */

#include <inttypes.h>
#include <assert.h>
#include <stdio.h>

#include "bit_tricks.h"


/*
 * Truth table: defined by an 8bit array b[7 ... 0]
 *
 * The input variables are denoted by y, z, t.
 * The output is denoted by x. The table is as follows:
 *
 *  y   z   t    x
 * -----------------
 *  0   0   0    b0
 *  0   0   1    b1
 *  0   1   0    b2
 *  0   1   1    b3
 *  1   0   0    b4
 *  1   0   1    b5
 *  1   1   0    b6
 *  1   1   1    b7
 *
 * Each row can be converted to a clause. For example,
 * the first row is:
 *    (not y) and (not z) and (not t) => x = b0
 * that is,
 *    (y or z or t or x=b0)
 *
 * But we want to minimize the number of clauses.
 * This is what this test is about.
 */


/*
 * Show the table defined by array b
 */
static void show_table(int32_t b[8]) {
  uint32_t i;
  int32_t vy, vz, vt;

  printf("Truth table:\n");
  printf(" y  z  t | x\n");
  printf("-------------\n");
  for (i=0; i<8; i++) {
    vy = (i & 4) >> 2;
    vz = (i & 2) >> 1;
    vt = (i & 1);
    printf(" %"PRId32"  %"PRId32"  %"PRId32" | %"PRId32"\n", vy, vz, vt, b[i]);
  }
  printf("-------------\n\n");
}


/*
 * CNF encoding: each clause is defined by 
 * - an index i between 0 and 7
 * - the value b[i] for x
 * - a bit-mask m[i] of four bits
 *
 * i is formed of three bits i2 i1 i0, which define three literals 
 * (i.e., a row in the table as above)
 * - if i2 is 1, the first  literal is (not y), otherwise, it's y (literal l2)
 * - if i1 is 1, the second literal is (not z), otherwise, it's z (literal l1)
 * - if i0 is 1, the third  literal is (not t), otherwise, it's t (literal l0)
 *
 * so before simplification, clause i is
 *   (l2 \/ l1 \/ l0 \/ (x == b[i]))
 *
 * the bit-mask m[i] determines how much simplification was done:
 * - if m[i] is 0, then clause i was removed (subsumed)
 * - otherwise m[i] is of the form m3 m2 m1 m0 with m3 equal to 1:
 *   if m2 is 1, l2 is kept (otherwise, it's removed)
 *   if m1 is 1, l1 is kept (otherwise, it's removed)
 *   if m0 is 1, l0 is kept (otherwise, it's removed)
 */

static void show_literal(const char *var, uint32_t sign) {
  assert(sign == 0 || sign == 1);
  if (sign == 1) {
    printf(" ~%s", var);
  } else {
    printf("  %s", var);
  }
}

static void show_clauses(int32_t b[8], uint32_t m[8]) {
  uint32_t i;

  for (i=0; i<8; i++) {
    if (m[i] != 0) {
      if (m[i] & 7) {
	printf("(or");
      }
      if (m[i] & 4) {
	show_literal("y", (i>>2) & 1);
      }
      if (m[i] & 2) {
	show_literal("z", (i>>1) & 1);
      }
      if (m[i] & 1) {
	show_literal("t", i & 1);
      }
      show_literal("x", b[i] ^ 1);
      if (m[i] & 7) {
	printf(")");
      }
      printf("\n");
    }
  }
}


/*
 * Simplification using subsumption/resolution
 * - there are two variants:
 *   1) resolution of (a or B) and (not(a) or B) gives B,
 *      which subsumes both clauses
 *   2) resolution of (a or B) and (not(a) or B or C) gives 
 *       B or C, which subsumes the second clause
 */

/*
 * Apply rule 2 when the first clause is i
 */
static void strengthen(uint32_t m[8], int32_t b[8], uint32_t i) {
  uint32_t j, delta;

  for (j=0; j<8; j++) {
    if (b[i] == b[j] && (m[i]&m[j]) == m[i]) {
      delta = (i ^ j) & m[i];
      if (popcount32(delta) == 1) {
	assert(delta == 1 || delta == 2 || delta == 4);
	/*
	 * clause i is of the form a \/ B
	 * clause j is of the form ~a \/ B \/ C
	 * we strengthen clause j: rewrite it to B \/ C
	 */
	m[j] ^= delta;
      }
    }
  }
}

static void make_cnf(int32_t b[8]) {
  uint32_t m[8];
  uint32_t i, j, step;

  for (i=0; i<8; i++) {
    m[i] = 0x0f;
  }

  printf("Initial clauses:\n");
  show_clauses(b, m);
  printf("\n");

  /*
   * simplification using subsumption/resolution
   */
  for (step=1; step<8; step <<= 1) {
    for (i=0; i<8; i++) {
      if (m[i] != 0) {
	j = i ^ step;
	if (i < j && m[i] == m[j]) {
	  /*
	   * i and j are two rows that differ at position k where step
	   * = 2^k. If b[i] == b[j], then we can apply the first rule:
	   * We replace clause i by the new clause and we remove clause j.
	   */
	  assert((m[i] & step) != 0);
	  if (b[i] == b[j]) {
	    m[i] ^= step; // remove k from the bitmask
	    m[j] = 0;
	    strengthen(m, b, i);
	  }
	}
      }
    }
    printf("After step %"PRIu32"\n", step);
    show_clauses(b, m);
    printf("\n");
  }

  printf("Simplified clauses:\n");
  show_clauses(b, m);
  printf("\n");
}

int main(void) {
  int32_t b[8];
  uint32_t i, j;

  for (i=0; i<256; i++) {
    printf("Function %"PRIu32"\n\n", i);
    for (j=0; j<8; j++) {
      b[j] = (i >> j) & 1;
    }
    show_table(b);
    make_cnf(b);
    printf("\n");
  }

  return 0;
}
