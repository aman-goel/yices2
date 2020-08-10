(set-option :produce-unsat-model-interpolants true)
(set-logic QF_LIA)
(declare-fun v0 () Int)
(assert (let ((e1 0))
(let ((e2 (* e1 v0)))
(let ((e3 (distinct v0 v0)))
(let ((e4 (distinct e2 e2)))
(let ((e5 (ite e3 e2 v0)))
(let ((e6 (ite e4 e2 e2)))
(let ((e7 (= v0 v0)))
(let ((e8 (> e2 e6)))
(let ((e9 (distinct e2 e5)))
(let ((e10 (=> e8 e8)))
(let ((e11 (or e7 e10)))
(let ((e12 (xor e3 e4)))
(let ((e13 (= e12 e12)))
(let ((e14 (ite e11 e13 e13)))
(let ((e15 (and e14 e14)))
(let ((e16 (xor e15 e15)))
(let ((e17 (= e16 e9)))
e17
))))))))))))))))))
(check-sat-assuming-model (v0) ((- 59)))
(get-unsat-model-interpolant)