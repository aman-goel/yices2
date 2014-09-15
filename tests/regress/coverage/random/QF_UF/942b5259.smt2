(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UF)
(declare-sort S0 0)
(declare-sort S1 0)
(declare-sort S2 0)
(declare-fun v0 () S0)
(declare-fun v1 () S1)
(declare-fun v2 () S2)
(declare-fun f0 ( S0 S0) S2)
(declare-fun f1 ( S2) S1)
(declare-fun f2 ( S2 S0 S0) S2)
(declare-fun f3 ( S0) S0)
(declare-fun f4 ( S0) S2)
(declare-fun f5 ( S1 S1 S2) S2)
(declare-fun p0 ( S1) Bool)
(declare-fun p1 ( S0 S2 S1) Bool)
(declare-fun p2 ( S1 S1 S2) Bool)
(declare-fun p3 ( S1) Bool)
(declare-fun p4 ( S0) Bool)
(assert (let ((e3 (f5 v1 v1 v2)))
(let ((e4 (f0 v0 v0)))
(let ((e5 (f1 e3)))
(let ((e6 (f0 v0 v0)))
(let ((e7 (f2 e3 v0 v0)))
(let ((e8 (f4 v0)))
(let ((e9 (f5 v1 e5 v2)))
(let ((e10 (f4 v0)))
(let ((e11 (f3 v0)))
(let ((e12 (p1 v0 e10 e5)))
(let ((e13 (p4 e11)))
(let ((e14 (distinct e4 e7)))
(let ((e15 (distinct v2 e6)))
(let ((e16 (p1 v0 e10 v1)))
(let ((e17 (p0 v1)))
(let ((e18 (= e9 e7)))
(let ((e19 (distinct e8 e6)))
(let ((e20 (= e3 e6)))
(let ((e21 (p2 v1 e5 e8)))
(let ((e22 (p3 e5)))
(let ((e23 (ite e12 e3 e3)))
(let ((e24 (ite e16 e8 e10)))
(let ((e25 (ite e21 e11 e11)))
(let ((e26 (ite e22 e6 e3)))
(let ((e27 (ite e13 v2 e9)))
(let ((e28 (ite e17 e23 e26)))
(let ((e29 (ite e19 e7 e26)))
(let ((e30 (ite e22 e5 v1)))
(let ((e31 (ite e20 v0 e25)))
(let ((e32 (ite e14 e6 e6)))
(let ((e33 (ite e14 e4 e7)))
(let ((e34 (ite e18 e25 v0)))
(let ((e35 (ite e15 v0 e25)))
(let ((e36 (= e25 v0)))
(let ((e37 (distinct e28 v2)))
(let ((e38 (p4 e35)))
(let ((e39 (p2 v1 e30 e32)))
(let ((e40 (distinct e7 e28)))
(let ((e41 (p1 e35 e7 e30)))
(let ((e42 (p3 e5)))
(let ((e43 (= e34 v0)))
(let ((e44 (distinct e4 e23)))
(let ((e45 (= e11 e25)))
(let ((e46 (= e24 e23)))
(let ((e47 (p0 e5)))
(let ((e48 (p2 v1 e5 e28)))
(let ((e49 (= e6 e29)))
(let ((e50 (p0 v1)))
(let ((e51 (p0 e30)))
(let ((e52 (= e27 e27)))
(let ((e53 (p4 e31)))
(let ((e54 (p2 e30 e30 e10)))
(let ((e55 (distinct e9 e33)))
(let ((e56 (distinct e8 e3)))
(let ((e57 (distinct e26 e28)))
(let ((e58 (=> e12 e41)))
(let ((e59 (= e51 e40)))
(let ((e60 (and e44 e55)))
(let ((e61 (and e20 e38)))
(let ((e62 (not e49)))
(let ((e63 (and e21 e36)))
(let ((e64 (=> e54 e56)))
(let ((e65 (= e19 e19)))
(let ((e66 (xor e63 e18)))
(let ((e67 (or e66 e16)))
(let ((e68 (ite e48 e39 e64)))
(let ((e69 (or e58 e45)))
(let ((e70 (= e15 e52)))
(let ((e71 (=> e46 e68)))
(let ((e72 (=> e59 e69)))
(let ((e73 (= e17 e42)))
(let ((e74 (or e60 e70)))
(let ((e75 (and e50 e14)))
(let ((e76 (xor e47 e72)))
(let ((e77 (and e76 e74)))
(let ((e78 (ite e71 e53 e62)))
(let ((e79 (= e73 e13)))
(let ((e80 (=> e67 e79)))
(let ((e81 (= e22 e37)))
(let ((e82 (= e78 e75)))
(let ((e83 (or e43 e43)))
(let ((e84 (or e81 e81)))
(let ((e85 (or e84 e61)))
(let ((e86 (=> e57 e77)))
(let ((e87 (xor e83 e65)))
(let ((e88 (ite e86 e86 e80)))
(let ((e89 (or e88 e85)))
(let ((e90 (or e87 e87)))
(let ((e91 (and e90 e89)))
(let ((e92 (not e82)))
(let ((e93 (and e91 e92)))
e93
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
