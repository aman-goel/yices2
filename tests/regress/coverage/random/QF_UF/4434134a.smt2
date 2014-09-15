(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UF)
(declare-sort S0 0)
(declare-fun v0 () S0)
(declare-fun v1 () S0)
(declare-fun f0 ( S0 S0 S0) S0)
(declare-fun f1 ( S0 S0) S0)
(declare-fun f2 ( S0 S0) S0)
(declare-fun f3 ( S0) S0)
(declare-fun f4 ( S0 S0) S0)
(declare-fun p0 ( S0) Bool)
(declare-fun p1 ( S0) Bool)
(declare-fun p2 ( S0 S0 S0) Bool)
(declare-fun p3 ( S0 S0) Bool)
(declare-fun p4 ( S0 S0) Bool)
(assert (let ((e2 (f3 v1)))
(let ((e3 (f3 v0)))
(let ((e4 (f1 e3 v1)))
(let ((e5 (f3 v0)))
(let ((e6 (f3 e3)))
(let ((e7 (f4 e5 e5)))
(let ((e8 (f3 e4)))
(let ((e9 (f4 v1 e8)))
(let ((e10 (f3 e6)))
(let ((e11 (f2 v1 v1)))
(let ((e12 (f1 e2 e6)))
(let ((e13 (f1 e9 v1)))
(let ((e14 (f0 e5 v1 e3)))
(let ((e15 (= e5 e3)))
(let ((e16 (p3 e4 e14)))
(let ((e17 (distinct e12 e14)))
(let ((e18 (= e8 e7)))
(let ((e19 (p1 v0)))
(let ((e20 (p2 e7 e7 e14)))
(let ((e21 (distinct e11 e12)))
(let ((e22 (= e6 e13)))
(let ((e23 (p3 e13 v0)))
(let ((e24 (distinct e10 e5)))
(let ((e25 (distinct e2 e14)))
(let ((e26 (distinct v1 e10)))
(let ((e27 (p2 v0 v1 e5)))
(let ((e28 (p3 e2 e3)))
(let ((e29 (p3 e4 e13)))
(let ((e30 (distinct e9 e12)))
(let ((e31 (p1 e4)))
(let ((e32 (p4 e14 e14)))
(let ((e33 (p4 e12 e14)))
(let ((e34 (p4 e4 e5)))
(let ((e35 (p0 e4)))
(let ((e36 (ite e21 e7 e2)))
(let ((e37 (ite e16 e10 e2)))
(let ((e38 (ite e15 e8 e9)))
(let ((e39 (ite e31 e13 e9)))
(let ((e40 (ite e20 e12 e39)))
(let ((e41 (ite e23 e4 e12)))
(let ((e42 (ite e24 e5 e10)))
(let ((e43 (ite e32 e36 e36)))
(let ((e44 (ite e31 v1 e38)))
(let ((e45 (ite e35 e3 e42)))
(let ((e46 (ite e33 e11 e39)))
(let ((e47 (ite e27 e12 e13)))
(let ((e48 (ite e30 e47 e11)))
(let ((e49 (ite e16 v0 v1)))
(let ((e50 (ite e26 e14 e41)))
(let ((e51 (ite e20 v1 e50)))
(let ((e52 (ite e17 e6 e43)))
(let ((e53 (ite e22 e43 v0)))
(let ((e54 (ite e30 e7 e37)))
(let ((e55 (ite e29 e37 e54)))
(let ((e56 (ite e19 e9 e7)))
(let ((e57 (ite e34 e48 e37)))
(let ((e58 (ite e25 e37 e39)))
(let ((e59 (ite e28 e53 e8)))
(let ((e60 (ite e23 e14 e44)))
(let ((e61 (ite e18 e50 e6)))
(let ((e62 (= e5 e36)))
(let ((e63 (p1 e10)))
(let ((e64 (p2 e47 e4 e4)))
(let ((e65 (p4 e12 e46)))
(let ((e66 (p2 e13 v0 e7)))
(let ((e67 (p4 e44 e39)))
(let ((e68 (p0 e42)))
(let ((e69 (distinct e51 e7)))
(let ((e70 (distinct e54 e37)))
(let ((e71 (p1 e11)))
(let ((e72 (= e14 e14)))
(let ((e73 (p2 e56 e3 e52)))
(let ((e74 (distinct e9 e53)))
(let ((e75 (distinct e2 e40)))
(let ((e76 (= e6 e51)))
(let ((e77 (distinct e58 e12)))
(let ((e78 (= e50 e2)))
(let ((e79 (distinct e61 e44)))
(let ((e80 (= e60 e44)))
(let ((e81 (= e49 e50)))
(let ((e82 (p0 e58)))
(let ((e83 (= e43 e38)))
(let ((e84 (p4 e42 e48)))
(let ((e85 (= e41 e51)))
(let ((e86 (distinct v1 e4)))
(let ((e87 (= e57 e58)))
(let ((e88 (= e59 e41)))
(let ((e89 (p4 e48 e59)))
(let ((e90 (= e8 e60)))
(let ((e91 (distinct e55 e11)))
(let ((e92 (= e45 e12)))
(let ((e93 (p0 e12)))
(let ((e94 (p1 e6)))
(let ((e95 (p4 e6 e59)))
(let ((e96 (p1 e12)))
(let ((e97 (p0 e13)))
(let ((e98 (p4 e45 e7)))
(let ((e99 (p2 e61 e44 e52)))
(let ((e100 (p3 e8 e56)))
(let ((e101 (= e34 e24)))
(let ((e102 (=> e83 e86)))
(let ((e103 (not e76)))
(let ((e104 (xor e19 e78)))
(let ((e105 (or e27 e73)))
(let ((e106 (not e93)))
(let ((e107 (ite e72 e21 e35)))
(let ((e108 (xor e68 e26)))
(let ((e109 (or e102 e69)))
(let ((e110 (or e63 e85)))
(let ((e111 (and e66 e17)))
(let ((e112 (or e74 e105)))
(let ((e113 (=> e95 e70)))
(let ((e114 (ite e106 e97 e30)))
(let ((e115 (or e112 e109)))
(let ((e116 (=> e67 e81)))
(let ((e117 (or e108 e103)))
(let ((e118 (ite e89 e65 e113)))
(let ((e119 (not e98)))
(let ((e120 (not e33)))
(let ((e121 (= e115 e96)))
(let ((e122 (or e90 e16)))
(let ((e123 (=> e75 e64)))
(let ((e124 (xor e94 e18)))
(let ((e125 (= e15 e122)))
(let ((e126 (=> e82 e87)))
(let ((e127 (not e80)))
(let ((e128 (or e31 e110)))
(let ((e129 (=> e71 e71)))
(let ((e130 (ite e79 e120 e117)))
(let ((e131 (or e125 e100)))
(let ((e132 (ite e126 e130 e114)))
(let ((e133 (xor e111 e123)))
(let ((e134 (not e88)))
(let ((e135 (= e119 e62)))
(let ((e136 (or e92 e118)))
(let ((e137 (not e32)))
(let ((e138 (ite e29 e121 e132)))
(let ((e139 (=> e127 e99)))
(let ((e140 (xor e116 e136)))
(let ((e141 (= e23 e139)))
(let ((e142 (= e104 e129)))
(let ((e143 (or e141 e77)))
(let ((e144 (= e142 e28)))
(let ((e145 (= e135 e140)))
(let ((e146 (ite e145 e22 e138)))
(let ((e147 (=> e146 e20)))
(let ((e148 (xor e133 e131)))
(let ((e149 (ite e107 e124 e137)))
(let ((e150 (ite e143 e147 e134)))
(let ((e151 (ite e25 e149 e91)))
(let ((e152 (ite e84 e84 e148)))
(let ((e153 (xor e152 e150)))
(let ((e154 (not e153)))
(let ((e155 (= e154 e128)))
(let ((e156 (or e155 e151)))
(let ((e157 (or e144 e144)))
(let ((e158 (= e101 e157)))
(let ((e159 (xor e158 e156)))
e159
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
