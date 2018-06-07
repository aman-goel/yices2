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

/*
 * Tables for parsing the SMT-LIB 2.0 language
 */

#ifndef __SMT2_PARSE_TABLES_H
#define __SMT2_PARSE_TABLES_H

#include <stdint.h>

/*
 * States
 */
typedef enum state_s {
  c0, c1, c3, c4, c5, c6, c6a, c8, c9, c9a, c9b,
  c10, c10a, c10b, c11, c11a, c11b, c11d, c11f, c12, c12b, c13, c14, c15,
  a0, a1, v0,
  s0, s1, s2, s3, s4, s5, s6, s7, s8, s10,
  t0, t1, t2, t2a, t2b, t2d, t2e,
  t3, t3a, t3b, t3d, t3e,
  t4a, t4b, t4c, t4d, t4e, t4g,
  t5, t5a, t5b, t5c, t5d,
  t6, t6a, t6b, t6c, t6d, t6e, t6g, t6h, t6i, t6j,
  t7, t7a, t7b, t8a,
  r0,
} state_t;


/*
 * Action codes
 */
typedef enum actions {
  // commands
  next_goto_c1,
  empty_command_return,
  check_sat_next_goto_r0,
  get_assertions_next_goto_r0,
  get_proof_next_goto_r0,
  get_unsat_core_next_goto_r0,
  get_assignment_next_goto_r0,
  exit_next_goto_r0,
  push_next_goto_c3,
  pop_next_goto_c3,
  get_option_next_goto_c4,
  get_info_next_goto_c4,
  set_logic_next_goto_c5,
  set_option_next_goto_c6,
  set_info_next_goto_c6,
  assert_next_push_r0_goto_t0,
  declare_sort_next_goto_c8,
  define_sort_next_goto_c9,
  declare_const_next_goto_c14,
  define_const_next_goto_c15,
  declare_fun_next_goto_c10,
  define_fun_next_goto_c11,
  get_value_next_goto_c12,
  get_model_next_goto_r0,
  echo_next_goto_c13,
  reset_next_goto_r0,

  // arguments to the commands
  numeral_next_goto_r0,
  keyword_next_goto_r0,
  symbol_next_goto_r0,
  keyword_next_goto_c6a,
  next_return,
  push_r0_goto_a0,
  symbol_next_goto_c3,
  symbol_next_goto_c9a,
  next_goto_c9b,
  next_push_r0_goto_s0,
  symbol_next_goto_c9b,
  symbol_next_goto_c10a,
  next_goto_c10b,
  push_c10b_goto_s0,
  symbol_next_goto_c11a,
  next_goto_c11b,
  next_push_r0_push_t0_goto_s0,
  next_goto_c11d,
  symbol_next_push_c11f_goto_s0,
  eval_next_goto_c11b,
  next_push_c12b_goto_t0,
  next_goto_r0,
  push_c12b_goto_t0,
  string_next_goto_r0,
  symbol_next_push_r0_goto_s0,
  symbol_next_push_r0_push_t0_goto_s0,

  // attribute values + s-expressions
  numeral_next_return,
  decimal_next_return,
  hexadecimal_next_return,
  binary_next_return,
  string_next_return,
  symbol_next_return,
  next_goto_a1,
  push_a1_goto_v0,
  keyword_next_return,

  // sorts
  sort_symbol_next_return,
  next_goto_s1,
  next_goto_s2,
  next_goto_s5,
  symbol_next_push_s10_goto_s0,
  symbol_next_goto_s3,
  numeral_next_goto_s4,
  next_goto_s6,
  symbol_next_goto_s7,
  numeral_next_goto_s8,
  next_push_s10_goto_s0,
  push_s10_goto_s0,

  // terms
  term_symbol_next_return,
  next_goto_t1,
  next_goto_t2,           // (let
  forall_next_goto_t3,    // (forall
  exists_next_goto_t3,    // (exists
  next_push_t4a_goto_t0,  // (!
  next_goto_t5,           // (as
  next_goto_t6,           // ((
  next_goto_t7,           // (_

  // simple function application (<symbol> <term> ... <term>)
  symbol_next_push_t8a_goto_t0,

  // (let ...
  next_goto_t2a,
  next_goto_t2b,
  symbol_next_push_t2d_goto_t0,
  next_goto_t2e,
  next_push_r0_goto_t0,

  // (exists ... and (forall ...
  next_goto_t3a,
  next_goto_t3b,
  symbol_next_push_t3d_goto_s0,
  next_goto_t3e,

  // (! <term> ...
  check_keyword_then_branch,
  push_t4c_goto_a0,
  symbol_next_goto_t4c,
  next_push_t4g_goto_t0,
  next_goto_t4c,
  push_t4g_goto_t0,

  // (as ...
  next_goto_t5a,
  asymbol_next_push_r0_goto_s0,
  next_goto_t5b,
  symbol_next_goto_t5c,
  numeral_next_goto_t5d,

  // (( ...
  next_goto_t6a,
  next_goto_t6h,

  // ((as ...
  next_goto_t6b,
  symbol_next_push_t6g_goto_s0,
  next_goto_t6c,
  symbol_next_goto_t6d,
  numeral_next_goto_t6e,
  next_push_t6g_goto_s0,
  next_push_t8a_goto_t0,

  // ((_ ...
  symbol_next_goto_t6i,
  numeral_next_goto_t6j,

  // (_ ...
  symbol_next_goto_t7a,
  numeral_next_goto_t7b,

  // after <term> in a function application
  push_t8a_goto_t0,

  // errors
  error_lp_expected,
  error_string_expected,
  error_symbol_expected,
  error_numeral_expected,
  error_keyword_expected,
  error_rp_expected,
  error_underscore_expected,
  error_command_expected,
  error,
} smt2_action_t;


/*
 * Tables generated by table_builder
 * see utils/table_builder.c
 */

// Table sizes
#define NSTATES 75
#define BSIZE 276

// Default values for each state
static const uint8_t default_value[NSTATES] = {
  error_lp_expected,
  error_command_expected,
  error_numeral_expected,
  error_keyword_expected,
  error_symbol_expected,
  error_keyword_expected,
  push_r0_goto_a0,
  error_symbol_expected,
  error_symbol_expected,
  error_lp_expected,
  error,
  error_symbol_expected,
  error_lp_expected,
  push_c10b_goto_s0,
  error_symbol_expected,
  error_lp_expected,
  error,
  error_symbol_expected,
  error_rp_expected,
  error_lp_expected,
  push_c12b_goto_t0,
  error,
  error_symbol_expected,
  error_symbol_expected,
  error,
  push_a1_goto_v0,
  error,
  error,
  error,
  error_symbol_expected,
  error_numeral_expected,
  error,
  error_underscore_expected,
  error_symbol_expected,
  error_numeral_expected,
  error,
  push_s10_goto_s0,
  error,
  error,
  error_lp_expected,
  error_lp_expected,
  error_symbol_expected,
  error_rp_expected,
  error,
  error_lp_expected,
  error_lp_expected,
  error_symbol_expected,
  error_rp_expected,
  error,
  error_keyword_expected,
  push_t4c_goto_a0,
  error,
  error_symbol_expected,
  error_lp_expected,
  push_t4g_goto_t0,
  error,
  error_underscore_expected,
  error_symbol_expected,
  error_numeral_expected,
  error,
  error,
  error,
  error_underscore_expected,
  error_symbol_expected,
  error_numeral_expected,
  error,
  error_rp_expected,
  error_symbol_expected,
  error_numeral_expected,
  error,
  error_symbol_expected,
  error_numeral_expected,
  error,
  push_t8a_goto_t0,
  error_rp_expected,
};

// Base values for each state
static const uint8_t base[NSTATES] = {
     0,   0,   0,   0,   3,   3,   0,   0,   6,   4,
    50,  10,   5,   5,  47,   7,  16,  53,  19,  57,
    59,  56,  56,  58,  68,  68,  78,  98, 108,  71,
    67,  98,  85,  94, 101, 123, 104, 125, 139, 109,
   118, 135, 118, 145, 127, 135, 152, 148, 162, 143,
   163, 164, 162, 166, 171, 176, 160, 179, 177, 188,
   175, 193, 171, 189, 196, 206, 199, 202, 200, 211,
   207, 205, 223, 212, 216,
};

// Check table
static const uint8_t check[BSIZE] = {
     0,   6,   0,   2,   9,  12,  13,  15,   7,   7,
     3,   4,   4,   5,   8,   8,  16,  16,  11,  11,
    18,   1,   1,   1,   1,   1,   1,   1,   1,   1,
     1,   1,   1,   1,   1,   1,   1,   1,   1,   1,
     1,   1,   1,   1,   1,   4,   4,   4,   8,   8,
     8,  10,  11,  11,  11,  14,  14,  19,  10,  10,
    20,  17,  17,  21,  22,  22,  23,  23,  24,  25,
    30,  24,  24,  24,  24,  24,  24,  24,  26,  29,
    29,  26,  26,  26,  26,  26,  26,  26,  26,  14,
    14,  14,  10,  10,  10,  17,  17,  17,  27,  31,
    32,  31,  33,  33,  34,  36,  27,  27,  28,  39,
    24,  24,  24,  29,  29,  29,  28,  28,  40,  42,
    26,  26,  26,  28,  35,  37,  35,  44,  37,  37,
    37,  37,  37,  37,  37,  45,  33,  33,  33,  38,
    27,  27,  27,  41,  41,  43,  43,  38,  38,  47,
    28,  28,  28,  49,  38,  38,  38,  38,  38,  38,
    46,  46,  48,  48,  50,  51,  53,  37,  37,  37,
    52,  52,  54,  50,  51,  56,  55,  41,  41,  41,
    58,  38,  38,  38,  55,  55,  62,  57,  57,  59,
    60,  59,  60,  61,  46,  46,  46,  63,  63,  64,
    66,  61,  61,  68,  52,  52,  52,  65,  71,  65,
    67,  67,  69,  73,  69,  70,  70,  74,  55,  55,
    55,  57,  57,  57,  72,  75,  72,  75,  75,  75,
    75,  63,  63,  63,  75,  61,  61,  61,  75,  75,
    75,  75,  75,  75,  67,  67,  67,  75,  75,  70,
    70,  70,  75,  75,  75,  75,  75,  75,  75,  75,
    75,  75,  75,  75,  75,  75,  75,  75,  75,  75,
    75,  75,  75,  75,  75,  75,
};

// Value table
static const uint8_t value[BSIZE] = {
  next_goto_c1,
  next_return,
  empty_command_return,
  numeral_next_goto_r0,
  next_goto_c9b,
  next_goto_c10b,
  next_push_r0_goto_s0,
  next_goto_c11b,
  symbol_next_goto_c3,
  symbol_next_goto_c3,
  keyword_next_goto_r0,
  symbol_next_goto_r0,
  symbol_next_goto_r0,
  keyword_next_goto_c6a,
  symbol_next_goto_c9a,
  symbol_next_goto_c9a,
  next_goto_c11d,
  next_push_r0_push_t0_goto_s0,
  symbol_next_goto_c10a,
  symbol_next_goto_c10a,
  eval_next_goto_c11b,
  assert_next_push_r0_goto_t0,
  check_sat_next_goto_r0,
  declare_sort_next_goto_c8,
  declare_const_next_goto_c14,
  declare_fun_next_goto_c10,
  define_sort_next_goto_c9,
  define_const_next_goto_c15,
  define_fun_next_goto_c11,
  exit_next_goto_r0,
  get_assertions_next_goto_r0,
  get_assignment_next_goto_r0,
  get_info_next_goto_c4,
  get_option_next_goto_c4,
  get_proof_next_goto_r0,
  get_unsat_core_next_goto_r0,
  get_value_next_goto_c12,
  pop_next_goto_c3,
  push_next_goto_c3,
  set_logic_next_goto_c5,
  set_info_next_goto_c6,
  set_option_next_goto_c6,
  get_model_next_goto_r0,
  echo_next_goto_c13,
  reset_next_goto_r0,
  symbol_next_goto_r0,
  symbol_next_goto_r0,
  symbol_next_goto_r0,
  symbol_next_goto_c9a,
  symbol_next_goto_c9a,
  symbol_next_goto_c9a,
  next_push_r0_goto_s0,
  symbol_next_goto_c10a,
  symbol_next_goto_c10a,
  symbol_next_goto_c10a,
  symbol_next_goto_c11a,
  symbol_next_goto_c11a,
  next_push_c12b_goto_t0,
  symbol_next_goto_c9b,
  symbol_next_goto_c9b,
  next_goto_r0,
  symbol_next_push_c11f_goto_s0,
  symbol_next_push_c11f_goto_s0,
  string_next_goto_r0,
  symbol_next_push_r0_goto_s0,
  symbol_next_push_r0_goto_s0,
  symbol_next_push_r0_push_t0_goto_s0,
  symbol_next_push_r0_push_t0_goto_s0,
  next_goto_a1,
  next_return,
  numeral_next_goto_s4,
  numeral_next_return,
  decimal_next_return,
  hexadecimal_next_return,
  binary_next_return,
  string_next_return,
  symbol_next_return,
  symbol_next_return,
  next_goto_a1,
  symbol_next_goto_s3,
  symbol_next_goto_s3,
  numeral_next_return,
  decimal_next_return,
  hexadecimal_next_return,
  binary_next_return,
  string_next_return,
  symbol_next_return,
  symbol_next_return,
  keyword_next_return,
  symbol_next_goto_c11a,
  symbol_next_goto_c11a,
  symbol_next_goto_c11a,
  symbol_next_goto_c9b,
  symbol_next_goto_c9b,
  symbol_next_goto_c9b,
  symbol_next_push_c11f_goto_s0,
  symbol_next_push_c11f_goto_s0,
  symbol_next_push_c11f_goto_s0,
  next_goto_s1,
  next_return,
  next_goto_s6,
  numeral_next_goto_s4,
  symbol_next_goto_s7,
  symbol_next_goto_s7,
  numeral_next_goto_s8,
  next_return,
  sort_symbol_next_return,
  sort_symbol_next_return,
  next_goto_s5,
  next_goto_t2a,
  symbol_next_return,
  symbol_next_return,
  symbol_next_return,
  symbol_next_goto_s3,
  symbol_next_goto_s3,
  symbol_next_goto_s3,
  symbol_next_push_s10_goto_s0,
  symbol_next_push_s10_goto_s0,
  next_goto_t2b,
  next_goto_t2e,
  symbol_next_return,
  symbol_next_return,
  symbol_next_return,
  next_goto_s2,
  next_push_s10_goto_s0,
  next_goto_t1,
  numeral_next_goto_s8,
  next_goto_t3a,
  numeral_next_return,
  decimal_next_return,
  hexadecimal_next_return,
  binary_next_return,
  string_next_return,
  term_symbol_next_return,
  term_symbol_next_return,
  next_goto_t3b,
  symbol_next_goto_s7,
  symbol_next_goto_s7,
  symbol_next_goto_s7,
  next_goto_t6,
  sort_symbol_next_return,
  sort_symbol_next_return,
  sort_symbol_next_return,
  symbol_next_push_t2d_goto_t0,
  symbol_next_push_t2d_goto_t0,
  next_goto_t2b,
  next_push_r0_goto_t0,
  symbol_next_push_t8a_goto_t0,
  symbol_next_push_t8a_goto_t0,
  next_goto_t3e,
  symbol_next_push_s10_goto_s0,
  symbol_next_push_s10_goto_s0,
  symbol_next_push_s10_goto_s0,
  check_keyword_then_branch,
  next_goto_t7,
  next_push_t4a_goto_t0,
  next_goto_t5,
  next_goto_t2,
  exists_next_goto_t3,
  forall_next_goto_t3,
  symbol_next_push_t3d_goto_s0,
  symbol_next_push_t3d_goto_s0,
  next_goto_t3b,
  next_push_r0_goto_t0,
  next_return,
  next_return,
  next_push_t4g_goto_t0,
  term_symbol_next_return,
  term_symbol_next_return,
  term_symbol_next_return,
  symbol_next_goto_t4c,
  symbol_next_goto_t4c,
  next_goto_t4c,
  check_keyword_then_branch,
  check_keyword_then_branch,
  next_goto_t5b,
  next_goto_t5a,
  symbol_next_push_t2d_goto_t0,
  symbol_next_push_t2d_goto_t0,
  symbol_next_push_t2d_goto_t0,
  numeral_next_goto_t5d,
  symbol_next_push_t8a_goto_t0,
  symbol_next_push_t8a_goto_t0,
  symbol_next_push_t8a_goto_t0,
  asymbol_next_push_r0_goto_s0,
  asymbol_next_push_r0_goto_s0,
  next_goto_t6c,
  symbol_next_goto_t5c,
  symbol_next_goto_t5c,
  next_push_r0_goto_s0,
  next_goto_t6h,
  numeral_next_goto_t5d,
  next_goto_t6a,
  next_goto_t6b,
  symbol_next_push_t3d_goto_s0,
  symbol_next_push_t3d_goto_s0,
  symbol_next_push_t3d_goto_s0,
  symbol_next_goto_t6d,
  symbol_next_goto_t6d,
  numeral_next_goto_t6e,
  next_push_t8a_goto_t0,
  symbol_next_push_t6g_goto_s0,
  symbol_next_push_t6g_goto_s0,
  numeral_next_goto_t6j,
  symbol_next_goto_t4c,
  symbol_next_goto_t4c,
  symbol_next_goto_t4c,
  next_push_t6g_goto_s0,
  numeral_next_goto_t7b,
  numeral_next_goto_t6e,
  symbol_next_goto_t6i,
  symbol_next_goto_t6i,
  next_push_t8a_goto_t0,
  next_return,
  numeral_next_goto_t6j,
  symbol_next_goto_t7a,
  symbol_next_goto_t7a,
  next_return,
  asymbol_next_push_r0_goto_s0,
  asymbol_next_push_r0_goto_s0,
  asymbol_next_push_r0_goto_s0,
  symbol_next_goto_t5c,
  symbol_next_goto_t5c,
  symbol_next_goto_t5c,
  next_return,
  error,
  numeral_next_goto_t7b,
  error,
  error,
  error,
  error,
  symbol_next_goto_t6d,
  symbol_next_goto_t6d,
  symbol_next_goto_t6d,
  error,
  symbol_next_push_t6g_goto_s0,
  symbol_next_push_t6g_goto_s0,
  symbol_next_push_t6g_goto_s0,
  error,
  error,
  error,
  error,
  error,
  error,
  symbol_next_goto_t6i,
  symbol_next_goto_t6i,
  symbol_next_goto_t6i,
  error,
  error,
  symbol_next_goto_t7a,
  symbol_next_goto_t7a,
  symbol_next_goto_t7a,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
  error,
};


#endif /* __SMT2_PARSE_TABLES_H */
