(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UF)
(declare-sort S0 0)
(declare-sort S1 0)
(declare-fun v0 () S0)
(declare-fun v1 () S0)
(declare-fun v2 () S0)
(declare-fun v3 () S1)
(declare-fun v4 () S1)
(declare-fun v5 () S1)
(declare-fun f0 ( S0 S0 S1) S1)
(declare-fun f1 ( S1 S0 S0) S0)
(declare-fun f2 ( S1) S0)
(declare-fun f3 ( S1) S0)
(declare-fun f4 ( S0) S0)
(declare-fun p0 ( S0 S1 S1) Bool)
(declare-fun p1 ( S1 S1 S1) Bool)
(declare-fun p2 ( S1 S0 S0) Bool)
(declare-fun p3 ( S1 S0 S1) Bool)
(declare-fun p4 ( S0 S0) Bool)
(assert (let ((e6 (f3 v4)))
(let ((e7 (f4 v2)))
(let ((e8 (f3 v5)))
(let ((e9 (f4 v0)))
(let ((e10 (f4 v1)))
(let ((e11 (f2 v5)))
(let ((e12 (f0 v1 v0 v3)))
(let ((e13 (f3 e12)))
(let ((e14 (f4 e9)))
(let ((e15 (f3 v5)))
(let ((e16 (f1 e12 e6 e6)))
(let ((e17 (p3 v4 e15 v3)))
(let ((e18 (= e12 v5)))
(let ((e19 (p2 v3 e7 e14)))
(let ((e20 (p0 e16 v4 v3)))
(let ((e21 (p2 v4 v1 e16)))
(let ((e22 (p2 v3 e13 v1)))
(let ((e23 (= e9 e6)))
(let ((e24 (p3 v5 e16 v4)))
(let ((e25 (p1 v4 v4 v3)))
(let ((e26 (distinct v2 e15)))
(let ((e27 (p2 e12 e16 e15)))
(let ((e28 (p3 v5 e14 v4)))
(let ((e29 (distinct e11 e7)))
(let ((e30 (distinct v0 e15)))
(let ((e31 (p2 e12 e14 e11)))
(let ((e32 (distinct e8 e9)))
(let ((e33 (p1 v3 v3 v4)))
(let ((e34 (p2 v5 e11 e9)))
(let ((e35 (p1 e12 v5 v4)))
(let ((e36 (distinct e10 e11)))
(let ((e37 (p3 v4 e7 v5)))
(let ((e38 (p0 e8 v4 v5)))
(let ((e39 (p2 v5 e8 e8)))
(let ((e40 (p0 v0 v4 v3)))
(let ((e41 (p4 e15 e13)))
(let ((e42 (ite e22 v5 v3)))
(let ((e43 (ite e29 e9 e7)))
(let ((e44 (ite e33 e8 v0)))
(let ((e45 (ite e40 e12 e12)))
(let ((e46 (ite e41 e13 e14)))
(let ((e47 (ite e29 v1 v1)))
(let ((e48 (ite e23 e16 v2)))
(let ((e49 (ite e29 e15 e9)))
(let ((e50 (ite e32 e49 v2)))
(let ((e51 (ite e35 e11 e13)))
(let ((e52 (ite e30 v3 e12)))
(let ((e53 (ite e18 v4 e12)))
(let ((e54 (ite e35 v5 e45)))
(let ((e55 (ite e21 e7 e13)))
(let ((e56 (ite e19 e48 v2)))
(let ((e57 (ite e19 e6 e11)))
(let ((e58 (ite e17 e55 e7)))
(let ((e59 (ite e22 e56 e8)))
(let ((e60 (ite e38 e12 v5)))
(let ((e61 (ite e36 e43 e57)))
(let ((e62 (ite e26 e10 e9)))
(let ((e63 (ite e32 v1 e56)))
(let ((e64 (ite e35 e58 v1)))
(let ((e65 (ite e22 e13 e48)))
(let ((e66 (ite e27 e57 e44)))
(let ((e67 (ite e27 e12 e42)))
(let ((e68 (ite e21 e8 e47)))
(let ((e69 (ite e33 e43 e65)))
(let ((e70 (ite e31 v3 e42)))
(let ((e71 (ite e41 e6 e6)))
(let ((e72 (ite e25 e58 e50)))
(let ((e73 (ite e24 e56 e9)))
(let ((e74 (ite e33 e51 e7)))
(let ((e75 (ite e22 e58 v2)))
(let ((e76 (ite e30 e67 e60)))
(let ((e77 (ite e20 e68 e43)))
(let ((e78 (ite e34 e56 e9)))
(let ((e79 (ite e39 v4 e70)))
(let ((e80 (ite e38 e53 e12)))
(let ((e81 (ite e38 e8 e43)))
(let ((e82 (ite e28 e64 e8)))
(let ((e83 (ite e37 e79 e54)))
(let ((e84 (p0 e61 e76 e12)))
(let ((e85 (distinct e58 e47)))
(let ((e86 (distinct e42 e52)))
(let ((e87 (p3 e12 v0 e67)))
(let ((e88 (= e71 e66)))
(let ((e89 (distinct e8 e51)))
(let ((e90 (distinct e72 e68)))
(let ((e91 (p0 v2 e12 e12)))
(let ((e92 (= e82 e55)))
(let ((e93 (p2 e80 e78 e58)))
(let ((e94 (p1 e70 v3 e76)))
(let ((e95 (p0 v1 v3 e60)))
(let ((e96 (p4 e57 e55)))
(let ((e97 (= e83 e83)))
(let ((e98 (p4 e81 e72)))
(let ((e99 (= e54 e83)))
(let ((e100 (p3 e83 e64 e76)))
(let ((e101 (p3 e42 e49 e53)))
(let ((e102 (p2 e79 e74 e14)))
(let ((e103 (= e44 e78)))
(let ((e104 (p1 e80 e80 v5)))
(let ((e105 (p2 v3 v0 e44)))
(let ((e106 (distinct e7 v0)))
(let ((e107 (= e56 e81)))
(let ((e108 (p1 e76 e67 e67)))
(let ((e109 (p2 e54 e69 e14)))
(let ((e110 (distinct e9 e15)))
(let ((e111 (= e59 e10)))
(let ((e112 (= e62 e14)))
(let ((e113 (distinct e13 e62)))
(let ((e114 (distinct e43 e8)))
(let ((e115 (= e16 e6)))
(let ((e116 (distinct e46 e72)))
(let ((e117 (= v4 e52)))
(let ((e118 (p1 e83 e70 e42)))
(let ((e119 (= e65 e58)))
(let ((e120 (p0 e69 e67 e83)))
(let ((e121 (= e45 e60)))
(let ((e122 (p1 v4 v4 e76)))
(let ((e123 (p3 e76 e72 e54)))
(let ((e124 (p4 e43 e73)))
(let ((e125 (distinct e63 e16)))
(let ((e126 (p2 e12 e57 e74)))
(let ((e127 (distinct e50 e55)))
(let ((e128 (= e77 e46)))
(let ((e129 (p3 e45 e6 e42)))
(let ((e130 (p2 e45 e50 e9)))
(let ((e131 (p4 e44 e81)))
(let ((e132 (p0 e11 e79 e79)))
(let ((e133 (p0 e61 e45 e67)))
(let ((e134 (p3 e76 e11 v4)))
(let ((e135 (p4 e55 e46)))
(let ((e136 (p1 v4 e52 e83)))
(let ((e137 (p4 e72 v2)))
(let ((e138 (p3 v5 v1 e76)))
(let ((e139 (p4 v0 e7)))
(let ((e140 (p2 e76 e55 e51)))
(let ((e141 (p4 v2 v0)))
(let ((e142 (distinct e48 v0)))
(let ((e143 (= e75 e8)))
(let ((e144 (= e22 e87)))
(let ((e145 (and e31 e112)))
(let ((e146 (or e91 e134)))
(let ((e147 (not e137)))
(let ((e148 (ite e26 e131 e114)))
(let ((e149 (not e102)))
(let ((e150 (or e30 e127)))
(let ((e151 (xor e115 e128)))
(let ((e152 (= e100 e143)))
(let ((e153 (ite e121 e38 e142)))
(let ((e154 (or e32 e29)))
(let ((e155 (not e41)))
(let ((e156 (and e109 e145)))
(let ((e157 (= e139 e99)))
(let ((e158 (xor e156 e24)))
(let ((e159 (=> e103 e33)))
(let ((e160 (=> e35 e88)))
(let ((e161 (or e85 e125)))
(let ((e162 (and e160 e157)))
(let ((e163 (or e129 e123)))
(let ((e164 (ite e106 e151 e132)))
(let ((e165 (= e146 e124)))
(let ((e166 (or e108 e119)))
(let ((e167 (ite e36 e17 e40)))
(let ((e168 (not e37)))
(let ((e169 (ite e158 e19 e94)))
(let ((e170 (and e161 e150)))
(let ((e171 (and e39 e92)))
(let ((e172 (xor e135 e20)))
(let ((e173 (=> e148 e116)))
(let ((e174 (not e110)))
(let ((e175 (and e170 e113)))
(let ((e176 (= e117 e152)))
(let ((e177 (not e169)))
(let ((e178 (or e167 e93)))
(let ((e179 (or e28 e147)))
(let ((e180 (=> e163 e141)))
(let ((e181 (or e174 e174)))
(let ((e182 (and e176 e89)))
(let ((e183 (xor e164 e105)))
(let ((e184 (or e86 e159)))
(let ((e185 (and e18 e183)))
(let ((e186 (xor e140 e182)))
(let ((e187 (=> e120 e149)))
(let ((e188 (and e95 e171)))
(let ((e189 (and e187 e178)))
(let ((e190 (xor e179 e107)))
(let ((e191 (ite e172 e27 e168)))
(let ((e192 (and e173 e126)))
(let ((e193 (and e144 e23)))
(let ((e194 (xor e34 e122)))
(let ((e195 (= e180 e97)))
(let ((e196 (xor e190 e138)))
(let ((e197 (ite e153 e133 e84)))
(let ((e198 (xor e194 e175)))
(let ((e199 (xor e188 e130)))
(let ((e200 (not e165)))
(let ((e201 (and e193 e25)))
(let ((e202 (xor e166 e98)))
(let ((e203 (xor e186 e184)))
(let ((e204 (xor e192 e96)))
(let ((e205 (ite e111 e200 e90)))
(let ((e206 (=> e202 e191)))
(let ((e207 (and e201 e155)))
(let ((e208 (=> e177 e185)))
(let ((e209 (xor e104 e196)))
(let ((e210 (not e197)))
(let ((e211 (= e206 e208)))
(let ((e212 (=> e21 e101)))
(let ((e213 (and e198 e211)))
(let ((e214 (= e181 e154)))
(let ((e215 (and e195 e210)))
(let ((e216 (xor e199 e213)))
(let ((e217 (ite e214 e189 e162)))
(let ((e218 (and e136 e217)))
(let ((e219 (ite e205 e218 e203)))
(let ((e220 (xor e215 e219)))
(let ((e221 (=> e212 e220)))
(let ((e222 (ite e209 e207 e207)))
(let ((e223 (=> e204 e222)))
(let ((e224 (and e216 e221)))
(let ((e225 (not e118)))
(let ((e226 (= e225 e224)))
(let ((e227 (=> e223 e226)))
e227
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
