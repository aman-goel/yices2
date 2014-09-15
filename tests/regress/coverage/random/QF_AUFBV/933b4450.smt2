(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_AUFBV)
(declare-fun v0 () (_ BitVec 14))
(declare-fun v1 () (_ BitVec 13))
(declare-fun v2 () (_ BitVec 16))
(declare-fun v3 () (_ BitVec 13))
(declare-fun a4 () (Array  (_ BitVec 7)  (_ BitVec 4)))
(declare-fun a5 () (Array  (_ BitVec 14)  (_ BitVec 9)))
(assert (let ((e6(_ bv893 10)))
(let ((e7 (bvsrem v2 v2)))
(let ((e8 ((_ rotate_right 0) v3)))
(let ((e9 (bvsub v2 ((_ zero_extend 3) v3))))
(let ((e10 (bvadd ((_ sign_extend 6) e6) e9)))
(let ((e11 ((_ repeat 1) v1)))
(let ((e12 (ite (distinct v0 v0) (_ bv1 1) (_ bv0 1))))
(let ((e13 (store a4 ((_ extract 10 4) v1) ((_ extract 3 0) e6))))
(let ((e14 (store a5 ((_ extract 13 0) e9) ((_ extract 9 1) v2))))
(let ((e15 (store a4 ((_ extract 9 3) e9) ((_ zero_extend 3) e12))))
(let ((e16 (select e15 ((_ extract 14 8) e9))))
(let ((e17 (select e14 ((_ extract 13 0) v2))))
(let ((e18 (store e13 ((_ extract 8 2) e11) ((_ extract 7 4) e11))))
(let ((e19 (select e14 ((_ sign_extend 1) v3))))
(let ((e20 (store e14 ((_ zero_extend 5) e17) ((_ extract 11 3) e11))))
(let ((e21 ((_ zero_extend 0) v1)))
(let ((e22 ((_ zero_extend 0) v2)))
(let ((e23 (ite (= e19 e19) (_ bv1 1) (_ bv0 1))))
(let ((e24 (bvneg e17)))
(let ((e25 (bvlshr e7 ((_ zero_extend 3) e8))))
(let ((e26 (bvudiv e9 e9)))
(let ((e27 (bvudiv ((_ zero_extend 3) e11) v2)))
(let ((e28 (bvshl v3 v1)))
(let ((e29 (bvsrem ((_ sign_extend 1) e11) v0)))
(let ((e30 (bvsub ((_ zero_extend 3) e6) v1)))
(let ((e31 ((_ rotate_left 1) e16)))
(let ((e32 (ite (= e10 e22) (_ bv1 1) (_ bv0 1))))
(let ((e33 (bvnand e27 ((_ sign_extend 3) e8))))
(let ((e34 (bvnor e24 ((_ zero_extend 8) e12))))
(let ((e35 (bvult v1 ((_ zero_extend 12) e32))))
(let ((e36 (bvult e17 e34)))
(let ((e37 (bvsle ((_ sign_extend 3) e6) e30)))
(let ((e38 (bvsgt e27 e7)))
(let ((e39 (bvule v3 ((_ sign_extend 9) e31))))
(let ((e40 (bvsgt ((_ zero_extend 7) e34) e10)))
(let ((e41 (bvsle e9 e22)))
(let ((e42 (bvsgt e7 e10)))
(let ((e43 (bvsle ((_ sign_extend 10) e31) e29)))
(let ((e44 (bvugt ((_ zero_extend 4) e19) e8)))
(let ((e45 (bvule e27 ((_ zero_extend 2) e29))))
(let ((e46 (bvuge e11 v1)))
(let ((e47 (= e31 ((_ zero_extend 3) e23))))
(let ((e48 (bvsle v2 e22)))
(let ((e49 (bvuge v2 ((_ sign_extend 3) e21))))
(let ((e50 (bvule v0 ((_ sign_extend 5) e24))))
(let ((e51 (bvule e29 ((_ sign_extend 1) v1))))
(let ((e52 (bvuge e6 ((_ zero_extend 1) e34))))
(let ((e53 (bvslt ((_ zero_extend 10) e16) v0)))
(let ((e54 (bvugt e24 ((_ sign_extend 8) e23))))
(let ((e55 (bvsge e11 ((_ sign_extend 4) e17))))
(let ((e56 (bvule ((_ zero_extend 4) e24) e30)))
(let ((e57 (bvuge ((_ zero_extend 1) e30) v0)))
(let ((e58 (bvugt e9 ((_ zero_extend 15) e12))))
(let ((e59 (bvslt v3 ((_ zero_extend 4) e17))))
(let ((e60 (bvule e6 ((_ sign_extend 6) e31))))
(let ((e61 (bvult e19 e34)))
(let ((e62 (bvslt e8 ((_ zero_extend 4) e34))))
(let ((e63 (bvule e28 ((_ zero_extend 4) e17))))
(let ((e64 (bvsge v0 ((_ sign_extend 5) e24))))
(let ((e65 (bvsge e30 e21)))
(let ((e66 (= e22 ((_ zero_extend 3) v1))))
(let ((e67 (bvult ((_ zero_extend 9) e31) v3)))
(let ((e68 (bvsle e10 e10)))
(let ((e69 (bvsgt ((_ zero_extend 3) v1) e10)))
(let ((e70 (bvuge e8 ((_ sign_extend 4) e17))))
(let ((e71 (bvuge e25 ((_ zero_extend 3) e30))))
(let ((e72 (bvsle v2 ((_ sign_extend 15) e23))))
(let ((e73 (bvsle e21 v3)))
(let ((e74 (bvule ((_ zero_extend 4) e17) e11)))
(let ((e75 (bvslt e11 e8)))
(let ((e76 (bvsgt ((_ zero_extend 5) e19) v0)))
(let ((e77 (bvule e24 ((_ zero_extend 8) e32))))
(let ((e78 (bvsle e27 ((_ zero_extend 15) e12))))
(let ((e79 (bvsgt v1 ((_ sign_extend 4) e24))))
(let ((e80 (bvsle ((_ zero_extend 3) e8) e10)))
(let ((e81 (bvsge e8 e21)))
(let ((e82 (bvsle e29 ((_ zero_extend 1) e21))))
(let ((e83 (bvule ((_ zero_extend 5) e17) v0)))
(let ((e84 (bvugt e7 ((_ zero_extend 12) e16))))
(let ((e85 (bvsle e22 ((_ zero_extend 3) v3))))
(let ((e86 (bvsgt e17 ((_ sign_extend 5) e31))))
(let ((e87 (bvuge e25 ((_ sign_extend 3) v3))))
(let ((e88 (bvslt ((_ zero_extend 3) e8) e7)))
(let ((e89 (= ((_ zero_extend 3) e6) v1)))
(let ((e90 (bvugt ((_ sign_extend 4) e17) v1)))
(let ((e91 (bvslt ((_ sign_extend 12) e32) e11)))
(let ((e92 (bvslt e31 e31)))
(let ((e93 (bvsge e19 ((_ zero_extend 8) e32))))
(let ((e94 (bvult v2 ((_ sign_extend 7) e24))))
(let ((e95 (bvsle e7 e9)))
(let ((e96 (bvugt v3 ((_ zero_extend 12) e32))))
(let ((e97 (bvsle e25 ((_ sign_extend 2) e29))))
(let ((e98 (bvsgt ((_ sign_extend 4) e34) e11)))
(let ((e99 (bvuge ((_ zero_extend 12) e16) e26)))
(let ((e100 (distinct e17 e34)))
(let ((e101 (bvslt e17 e34)))
(let ((e102 (distinct ((_ zero_extend 7) e17) e33)))
(let ((e103 (not e47)))
(let ((e104 (and e60 e41)))
(let ((e105 (and e63 e104)))
(let ((e106 (=> e74 e40)))
(let ((e107 (=> e54 e105)))
(let ((e108 (xor e103 e52)))
(let ((e109 (and e89 e89)))
(let ((e110 (ite e94 e68 e77)))
(let ((e111 (xor e107 e66)))
(let ((e112 (not e45)))
(let ((e113 (and e72 e100)))
(let ((e114 (ite e86 e38 e49)))
(let ((e115 (= e61 e65)))
(let ((e116 (xor e48 e64)))
(let ((e117 (not e46)))
(let ((e118 (ite e55 e81 e67)))
(let ((e119 (or e82 e37)))
(let ((e120 (not e98)))
(let ((e121 (and e117 e70)))
(let ((e122 (or e36 e113)))
(let ((e123 (or e80 e83)))
(let ((e124 (= e75 e57)))
(let ((e125 (xor e115 e119)))
(let ((e126 (=> e87 e62)))
(let ((e127 (xor e43 e110)))
(let ((e128 (xor e58 e116)))
(let ((e129 (xor e73 e42)))
(let ((e130 (or e59 e122)))
(let ((e131 (and e99 e76)))
(let ((e132 (or e101 e118)))
(let ((e133 (and e124 e92)))
(let ((e134 (= e39 e131)))
(let ((e135 (xor e133 e71)))
(let ((e136 (xor e56 e112)))
(let ((e137 (not e50)))
(let ((e138 (and e137 e125)))
(let ((e139 (xor e79 e136)))
(let ((e140 (xor e97 e138)))
(let ((e141 (xor e90 e102)))
(let ((e142 (=> e132 e108)))
(let ((e143 (xor e135 e78)))
(let ((e144 (or e106 e114)))
(let ((e145 (ite e84 e123 e127)))
(let ((e146 (= e44 e140)))
(let ((e147 (ite e134 e51 e53)))
(let ((e148 (= e111 e141)))
(let ((e149 (ite e85 e128 e96)))
(let ((e150 (xor e88 e91)))
(let ((e151 (=> e93 e129)))
(let ((e152 (=> e126 e145)))
(let ((e153 (and e147 e146)))
(let ((e154 (=> e121 e69)))
(let ((e155 (and e152 e151)))
(let ((e156 (and e149 e130)))
(let ((e157 (=> e143 e120)))
(let ((e158 (and e144 e157)))
(let ((e159 (ite e35 e158 e139)))
(let ((e160 (and e153 e150)))
(let ((e161 (xor e155 e148)))
(let ((e162 (or e156 e156)))
(let ((e163 (= e159 e161)))
(let ((e164 (=> e109 e95)))
(let ((e165 (ite e163 e162 e164)))
(let ((e166 (or e160 e142)))
(let ((e167 (not e166)))
(let ((e168 (=> e154 e165)))
(let ((e169 (xor e167 e167)))
(let ((e170 (=> e168 e169)))
(let ((e171 (and e170 (not (= v0 (_ bv0 14))))))
(let ((e172 (and e171 (not (= v0 (bvnot (_ bv0 14)))))))
(let ((e173 (and e172 (not (= v2 (_ bv0 16))))))
(let ((e174 (and e173 (not (= v2 (bvnot (_ bv0 16)))))))
(let ((e175 (and e174 (not (= e9 (_ bv0 16))))))
e175
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
