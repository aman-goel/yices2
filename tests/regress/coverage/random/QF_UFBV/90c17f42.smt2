(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UFBV)
(declare-fun f0 ( (_ BitVec 12)) (_ BitVec 9))
(declare-fun f1 ( (_ BitVec 10) (_ BitVec 7)) (_ BitVec 4))
(declare-fun p0 ( (_ BitVec 2) (_ BitVec 14)) Bool)
(declare-fun p1 ( (_ BitVec 2) (_ BitVec 8)) Bool)
(declare-fun v0 () (_ BitVec 4))
(declare-fun v1 () (_ BitVec 12))
(assert (let ((e2(_ bv62492 16)))
(let ((e3(_ bv13 4)))
(let ((e4 (f1 ((_ extract 9 0) v1) ((_ zero_extend 3) e3))))
(let ((e5 (ite (p0 ((_ extract 3 2) e4) ((_ sign_extend 2) v1)) (_ bv1 1) (_ bv0 1))))
(let ((e6 (bvxor ((_ zero_extend 15) e5) e2)))
(let ((e7 (ite (p1 ((_ extract 1 0) e3) ((_ sign_extend 4) e3)) (_ bv1 1) (_ bv0 1))))
(let ((e8 (bvnor ((_ zero_extend 15) e5) e2)))
(let ((e9 (bvor e4 e4)))
(let ((e10 (bvmul ((_ sign_extend 12) e3) e8)))
(let ((e11 (f0 ((_ extract 14 3) e8))))
(let ((e12 (bvnor ((_ zero_extend 15) e7) e8)))
(let ((e13 (bvsdiv e12 e2)))
(let ((e14 (bvcomp ((_ zero_extend 12) e4) e8)))
(let ((e15 (bvmul ((_ sign_extend 12) e3) e10)))
(let ((e16 (ite (distinct e11 ((_ sign_extend 5) v0)) (_ bv1 1) (_ bv0 1))))
(let ((e17 (= e14 e16)))
(let ((e18 (= e15 e2)))
(let ((e19 (bvuge e3 e4)))
(let ((e20 (p0 ((_ extract 1 0) e13) ((_ extract 14 1) e8))))
(let ((e21 (p1 ((_ extract 1 0) e11) ((_ extract 10 3) e10))))
(let ((e22 (distinct e15 e15)))
(let ((e23 (p1 ((_ extract 1 0) e9) ((_ extract 8 1) e12))))
(let ((e24 (= ((_ zero_extend 8) e16) e11)))
(let ((e25 (p1 ((_ extract 1 0) e3) ((_ sign_extend 4) e4))))
(let ((e26 (bvslt ((_ sign_extend 12) e3) e10)))
(let ((e27 (bvslt e2 ((_ zero_extend 15) e5))))
(let ((e28 (bvsgt e7 e14)))
(let ((e29 (bvule e12 ((_ sign_extend 15) e16))))
(let ((e30 (distinct e8 e2)))
(let ((e31 (p1 ((_ extract 4 3) e12) ((_ zero_extend 7) e5))))
(let ((e32 (bvsgt e9 ((_ zero_extend 3) e5))))
(let ((e33 (bvuge e12 ((_ sign_extend 12) v0))))
(let ((e34 (bvuge e8 e12)))
(let ((e35 (distinct ((_ sign_extend 4) v1) e13)))
(let ((e36 (bvsgt e13 ((_ zero_extend 15) e14))))
(let ((e37 (= e16 e5)))
(let ((e38 (distinct v0 ((_ zero_extend 3) e5))))
(let ((e39 (bvult ((_ zero_extend 5) e9) e11)))
(let ((e40 (p0 ((_ zero_extend 1) e14) ((_ zero_extend 13) e7))))
(let ((e41 (p1 ((_ zero_extend 1) e7) ((_ zero_extend 7) e5))))
(let ((e42 (bvslt e15 ((_ zero_extend 12) v0))))
(let ((e43 (p0 ((_ extract 2 1) e10) ((_ sign_extend 13) e5))))
(let ((e44 (bvsge ((_ zero_extend 15) e14) e15)))
(let ((e45 (bvuge e14 e5)))
(let ((e46 (bvult e10 e2)))
(let ((e47 (bvugt e15 ((_ zero_extend 4) v1))))
(let ((e48 (bvslt e13 ((_ sign_extend 15) e7))))
(let ((e49 (bvule e6 e10)))
(let ((e50 (and e30 e30)))
(let ((e51 (or e49 e39)))
(let ((e52 (= e35 e38)))
(let ((e53 (ite e40 e26 e22)))
(let ((e54 (ite e19 e21 e46)))
(let ((e55 (xor e34 e47)))
(let ((e56 (= e55 e33)))
(let ((e57 (and e50 e45)))
(let ((e58 (not e57)))
(let ((e59 (xor e18 e27)))
(let ((e60 (= e36 e59)))
(let ((e61 (not e20)))
(let ((e62 (not e52)))
(let ((e63 (and e60 e17)))
(let ((e64 (=> e24 e48)))
(let ((e65 (xor e53 e28)))
(let ((e66 (xor e29 e58)))
(let ((e67 (not e25)))
(let ((e68 (or e62 e43)))
(let ((e69 (=> e67 e31)))
(let ((e70 (= e51 e66)))
(let ((e71 (= e23 e68)))
(let ((e72 (= e69 e42)))
(let ((e73 (or e61 e64)))
(let ((e74 (not e70)))
(let ((e75 (ite e37 e32 e37)))
(let ((e76 (=> e41 e54)))
(let ((e77 (and e76 e56)))
(let ((e78 (not e77)))
(let ((e79 (= e63 e63)))
(let ((e80 (ite e44 e71 e79)))
(let ((e81 (or e80 e73)))
(let ((e82 (= e72 e74)))
(let ((e83 (=> e65 e81)))
(let ((e84 (=> e83 e82)))
(let ((e85 (not e78)))
(let ((e86 (and e75 e75)))
(let ((e87 (=> e86 e85)))
(let ((e88 (not e87)))
(let ((e89 (=> e84 e84)))
(let ((e90 (not e88)))
(let ((e91 (or e89 e89)))
(let ((e92 (= e91 e90)))
(let ((e93 (and e92 (not (= e2 (_ bv0 16))))))
(let ((e94 (and e93 (not (= e2 (bvnot (_ bv0 16)))))))
e94
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
