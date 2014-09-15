(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_BV)
(declare-fun v0 () (_ BitVec 14))
(declare-fun v1 () (_ BitVec 16))
(declare-fun v2 () (_ BitVec 11))
(declare-fun v3 () (_ BitVec 4))
(assert (let ((e4(_ bv23 6)))
(let ((e5 (bvsdiv ((_ sign_extend 5) e4) v2)))
(let ((e6 (ite (bvugt e4 e4) (_ bv1 1) (_ bv0 1))))
(let ((e7 (ite (bvslt e5 v2) (_ bv1 1) (_ bv0 1))))
(let ((e8 (bvurem v3 v3)))
(let ((e9 (bvxor v2 ((_ zero_extend 10) e7))))
(let ((e10 ((_ repeat 1) e4)))
(let ((e11 (bvadd e9 e5)))
(let ((e12 (bvsub v0 ((_ sign_extend 10) v3))))
(let ((e13 (bvor v0 ((_ sign_extend 10) v3))))
(let ((e14 (ite (bvsgt v3 e8) (_ bv1 1) (_ bv0 1))))
(let ((e15 (ite (bvsge ((_ sign_extend 5) e7) e10) (_ bv1 1) (_ bv0 1))))
(let ((e16 (ite (bvsgt v2 ((_ zero_extend 5) e10)) (_ bv1 1) (_ bv0 1))))
(let ((e17 (bvnand e11 ((_ zero_extend 10) e7))))
(let ((e18 (bvudiv ((_ zero_extend 5) e6) e4)))
(let ((e19 (bvsdiv ((_ sign_extend 10) e14) e17)))
(let ((e20 (bvneg e18)))
(let ((e21 (ite (bvule ((_ zero_extend 2) v3) e10) (_ bv1 1) (_ bv0 1))))
(let ((e22 (ite (bvslt e10 ((_ zero_extend 5) e7)) (_ bv1 1) (_ bv0 1))))
(let ((e23 (bvashr ((_ sign_extend 15) e22) v1)))
(let ((e24 (bvsgt ((_ zero_extend 10) e22) e9)))
(let ((e25 (= e6 e15)))
(let ((e26 (bvsge e17 ((_ sign_extend 5) e20))))
(let ((e27 (bvult ((_ sign_extend 3) e16) e8)))
(let ((e28 (bvugt e16 e15)))
(let ((e29 (bvult e10 ((_ zero_extend 5) e16))))
(let ((e30 (distinct ((_ zero_extend 5) e14) e18)))
(let ((e31 (bvsgt ((_ zero_extend 10) v3) v0)))
(let ((e32 (bvslt v0 ((_ zero_extend 13) e16))))
(let ((e33 (bvsle ((_ sign_extend 7) v3) e19)))
(let ((e34 (bvugt ((_ sign_extend 10) e21) e11)))
(let ((e35 (bvsge ((_ sign_extend 5) e22) e10)))
(let ((e36 (= e13 ((_ zero_extend 10) e8))))
(let ((e37 (bvule ((_ sign_extend 10) v3) e12)))
(let ((e38 (bvule e5 e11)))
(let ((e39 (bvslt v0 ((_ sign_extend 13) e21))))
(let ((e40 (= e9 ((_ sign_extend 5) e4))))
(let ((e41 (bvsgt e11 ((_ zero_extend 10) e14))))
(let ((e42 (bvslt ((_ zero_extend 5) e20) e9)))
(let ((e43 (bvult ((_ sign_extend 5) e10) e11)))
(let ((e44 (bvule ((_ sign_extend 13) e16) v0)))
(let ((e45 (bvugt e17 e5)))
(let ((e46 (distinct v0 ((_ zero_extend 13) e16))))
(let ((e47 (distinct ((_ sign_extend 5) e18) v2)))
(let ((e48 (distinct ((_ sign_extend 13) e7) e12)))
(let ((e49 (bvsge e14 e22)))
(let ((e50 (distinct v1 ((_ sign_extend 12) e8))))
(let ((e51 (bvule e12 ((_ sign_extend 3) e11))))
(let ((e52 (bvsge v0 ((_ sign_extend 3) v2))))
(let ((e53 (distinct ((_ zero_extend 10) e21) v2)))
(let ((e54 (bvugt ((_ sign_extend 2) e8) e10)))
(let ((e55 (bvugt ((_ zero_extend 13) e7) v0)))
(let ((e56 (bvsle ((_ sign_extend 2) v3) e4)))
(let ((e57 (= v0 e12)))
(let ((e58 (bvsge v0 ((_ sign_extend 10) e8))))
(let ((e59 (bvslt e19 e11)))
(let ((e60 (bvsge e9 ((_ zero_extend 5) e10))))
(let ((e61 (bvsgt ((_ sign_extend 13) e15) e13)))
(let ((e62 (bvult v3 v3)))
(let ((e63 (bvsle e12 ((_ sign_extend 13) e16))))
(let ((e64 (bvule ((_ zero_extend 5) e7) e4)))
(let ((e65 (bvule ((_ sign_extend 15) e6) e23)))
(let ((e66 (= e65 e39)))
(let ((e67 (not e31)))
(let ((e68 (ite e46 e33 e38)))
(let ((e69 (= e44 e68)))
(let ((e70 (= e42 e64)))
(let ((e71 (and e55 e55)))
(let ((e72 (or e29 e57)))
(let ((e73 (= e41 e59)))
(let ((e74 (or e67 e40)))
(let ((e75 (=> e27 e66)))
(let ((e76 (or e71 e47)))
(let ((e77 (= e30 e30)))
(let ((e78 (ite e25 e54 e45)))
(let ((e79 (ite e60 e34 e26)))
(let ((e80 (ite e61 e79 e24)))
(let ((e81 (or e32 e36)))
(let ((e82 (ite e80 e56 e53)))
(let ((e83 (=> e58 e62)))
(let ((e84 (not e73)))
(let ((e85 (=> e48 e63)))
(let ((e86 (and e83 e84)))
(let ((e87 (and e35 e69)))
(let ((e88 (= e87 e28)))
(let ((e89 (or e37 e37)))
(let ((e90 (and e72 e49)))
(let ((e91 (and e76 e81)))
(let ((e92 (or e90 e51)))
(let ((e93 (and e52 e85)))
(let ((e94 (= e50 e74)))
(let ((e95 (and e94 e86)))
(let ((e96 (and e75 e91)))
(let ((e97 (=> e70 e89)))
(let ((e98 (=> e43 e93)))
(let ((e99 (= e98 e92)))
(let ((e100 (xor e78 e82)))
(let ((e101 (not e88)))
(let ((e102 (and e100 e100)))
(let ((e103 (not e77)))
(let ((e104 (= e95 e95)))
(let ((e105 (not e97)))
(let ((e106 (ite e101 e103 e101)))
(let ((e107 (or e96 e102)))
(let ((e108 (ite e99 e104 e106)))
(let ((e109 (= e108 e107)))
(let ((e110 (and e109 e105)))
(let ((e111 (and e110 (not (= e4 (_ bv0 6))))))
(let ((e112 (and e111 (not (= v3 (_ bv0 4))))))
(let ((e113 (and e112 (not (= e17 (_ bv0 11))))))
(let ((e114 (and e113 (not (= e17 (bvnot (_ bv0 11)))))))
(let ((e115 (and e114 (not (= v2 (_ bv0 11))))))
(let ((e116 (and e115 (not (= v2 (bvnot (_ bv0 11)))))))
e116
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
