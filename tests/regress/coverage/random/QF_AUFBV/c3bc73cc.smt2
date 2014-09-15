(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_AUFBV)
(declare-fun v0 () (_ BitVec 7))
(declare-fun v1 () (_ BitVec 13))
(declare-fun v2 () (_ BitVec 13))
(declare-fun a3 () (Array  (_ BitVec 10)  (_ BitVec 11)))
(declare-fun a4 () (Array  (_ BitVec 13)  (_ BitVec 14)))
(assert (let ((e5(_ bv0 3)))
(let ((e6 (bvsdiv v1 v2)))
(let ((e7 (bvnot e5)))
(let ((e8 (bvor e6 v2)))
(let ((e9 (bvxor ((_ zero_extend 6) v0) v2)))
(let ((e10 (store a3 ((_ extract 9 0) v1) ((_ sign_extend 4) v0))))
(let ((e11 (select a3 ((_ extract 9 0) v2))))
(let ((e12 (select a4 e9)))
(let ((e13 (select a4 e6)))
(let ((e14 (select e10 ((_ extract 11 2) e8))))
(let ((e15 (select a4 ((_ sign_extend 10) e7))))
(let ((e16 (bvand e9 ((_ sign_extend 10) e7))))
(let ((e17 (bvcomp ((_ sign_extend 2) e14) e8)))
(let ((e18 (ite (bvslt ((_ sign_extend 1) v2) e12) (_ bv1 1) (_ bv0 1))))
(let ((e19 ((_ repeat 1) e6)))
(let ((e20 (bvurem e15 e13)))
(let ((e21 (bvcomp e19 e19)))
(let ((e22 (bvmul v0 ((_ sign_extend 4) e7))))
(let ((e23 (ite (bvsgt e6 ((_ sign_extend 6) e22)) (_ bv1 1) (_ bv0 1))))
(let ((e24 (ite (bvsle v1 ((_ sign_extend 6) v0)) (_ bv1 1) (_ bv0 1))))
(let ((e25 (bvlshr ((_ zero_extend 10) e5) e16)))
(let ((e26 (bvnor ((_ zero_extend 3) e11) e20)))
(let ((e27 (= e11 e14)))
(let ((e28 (= e7 e5)))
(let ((e29 (= e6 e6)))
(let ((e30 (bvult e9 ((_ zero_extend 12) e23))))
(let ((e31 (bvule ((_ zero_extend 1) v2) e20)))
(let ((e32 (bvult e15 ((_ zero_extend 1) e19))))
(let ((e33 (bvult e23 e17)))
(let ((e34 (bvsge ((_ zero_extend 12) e21) e9)))
(let ((e35 (bvsge ((_ sign_extend 13) e17) e13)))
(let ((e36 (bvuge v1 e9)))
(let ((e37 (bvsle ((_ sign_extend 7) v0) e15)))
(let ((e38 (bvult v2 e19)))
(let ((e39 (bvule ((_ sign_extend 11) e5) e12)))
(let ((e40 (= ((_ zero_extend 4) v0) e14)))
(let ((e41 (bvuge e19 ((_ sign_extend 6) e22))))
(let ((e42 (= v2 ((_ sign_extend 6) v0))))
(let ((e43 (bvult ((_ sign_extend 10) e7) v1)))
(let ((e44 (bvsge ((_ zero_extend 1) e16) e26)))
(let ((e45 (bvugt ((_ sign_extend 1) e6) e26)))
(let ((e46 (bvult e16 v2)))
(let ((e47 (bvule e9 ((_ sign_extend 2) e14))))
(let ((e48 (bvsle ((_ sign_extend 10) e7) e19)))
(let ((e49 (bvule e26 ((_ sign_extend 11) e5))))
(let ((e50 (bvsge e6 ((_ sign_extend 2) e11))))
(let ((e51 (bvult e22 e22)))
(let ((e52 (distinct e13 ((_ zero_extend 1) e16))))
(let ((e53 (bvsgt e13 ((_ sign_extend 1) e6))))
(let ((e54 (bvslt e14 ((_ zero_extend 10) e18))))
(let ((e55 (bvslt ((_ sign_extend 6) e18) e22)))
(let ((e56 (bvsgt e9 e9)))
(let ((e57 (bvslt e13 ((_ sign_extend 13) e17))))
(let ((e58 (bvuge ((_ zero_extend 11) e5) e12)))
(let ((e59 (bvsgt e12 ((_ zero_extend 11) e5))))
(let ((e60 (bvsge e14 ((_ zero_extend 10) e24))))
(let ((e61 (bvult e16 v2)))
(let ((e62 (bvsge ((_ zero_extend 10) e7) e8)))
(let ((e63 (bvsge e19 ((_ sign_extend 6) v0))))
(let ((e64 (bvsle ((_ sign_extend 13) e18) e12)))
(let ((e65 (bvuge e25 ((_ sign_extend 10) e7))))
(let ((e66 (and e63 e44)))
(let ((e67 (= e41 e30)))
(let ((e68 (=> e43 e46)))
(let ((e69 (xor e49 e58)))
(let ((e70 (and e64 e36)))
(let ((e71 (and e56 e59)))
(let ((e72 (ite e50 e65 e28)))
(let ((e73 (=> e66 e62)))
(let ((e74 (xor e60 e32)))
(let ((e75 (or e54 e57)))
(let ((e76 (= e37 e35)))
(let ((e77 (ite e31 e33 e31)))
(let ((e78 (not e51)))
(let ((e79 (= e71 e72)))
(let ((e80 (ite e79 e42 e79)))
(let ((e81 (not e27)))
(let ((e82 (ite e70 e48 e69)))
(let ((e83 (xor e52 e75)))
(let ((e84 (and e34 e82)))
(let ((e85 (or e76 e77)))
(let ((e86 (ite e45 e55 e38)))
(let ((e87 (=> e29 e84)))
(let ((e88 (ite e78 e81 e81)))
(let ((e89 (not e61)))
(let ((e90 (=> e80 e40)))
(let ((e91 (= e87 e53)))
(let ((e92 (not e89)))
(let ((e93 (= e86 e74)))
(let ((e94 (=> e39 e73)))
(let ((e95 (and e83 e92)))
(let ((e96 (not e88)))
(let ((e97 (= e47 e93)))
(let ((e98 (=> e94 e90)))
(let ((e99 (= e91 e91)))
(let ((e100 (xor e68 e68)))
(let ((e101 (and e100 e96)))
(let ((e102 (or e97 e98)))
(let ((e103 (not e67)))
(let ((e104 (or e102 e103)))
(let ((e105 (or e99 e104)))
(let ((e106 (= e101 e105)))
(let ((e107 (and e85 e85)))
(let ((e108 (or e107 e106)))
(let ((e109 (and e95 e108)))
(let ((e110 (and e109 (not (= e13 (_ bv0 14))))))
(let ((e111 (and e110 (not (= v2 (_ bv0 13))))))
(let ((e112 (and e111 (not (= v2 (bvnot (_ bv0 13)))))))
e112
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
