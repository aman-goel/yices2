(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_BV)
(declare-fun v0 () (_ BitVec 9))
(declare-fun v1 () (_ BitVec 15))
(declare-fun v2 () (_ BitVec 15))
(declare-fun v3 () (_ BitVec 15))
(declare-fun v4 () (_ BitVec 9))
(assert (let ((e5(_ bv51981 16)))
(let ((e6 (bvsdiv ((_ sign_extend 1) v2) e5)))
(let ((e7 (bvmul v2 v2)))
(let ((e8 (bvsrem ((_ zero_extend 6) v4) v3)))
(let ((e9 (ite (bvsle ((_ sign_extend 6) v0) v2) (_ bv1 1) (_ bv0 1))))
(let ((e10 (ite (= ((_ sign_extend 1) v3) e6) (_ bv1 1) (_ bv0 1))))
(let ((e11 (ite (bvule e7 ((_ zero_extend 6) v4)) (_ bv1 1) (_ bv0 1))))
(let ((e12 ((_ extract 0 0) v3)))
(let ((e13 (bvurem e11 e10)))
(let ((e14 ((_ rotate_left 4) v3)))
(let ((e15 (bvxor ((_ zero_extend 7) v4) e6)))
(let ((e16 (ite (bvult ((_ zero_extend 14) e11) e14) (_ bv1 1) (_ bv0 1))))
(let ((e17 ((_ zero_extend 2) e11)))
(let ((e18 (bvadd e8 ((_ sign_extend 14) e13))))
(let ((e19 (bvnand e6 ((_ zero_extend 15) e10))))
(let ((e20 (bvnor e15 ((_ zero_extend 1) e14))))
(let ((e21 (ite (= (_ bv1 1) ((_ extract 15 15) e15)) e14 v2)))
(let ((e22 (bvnot e11)))
(let ((e23 (bvcomp v3 v3)))
(let ((e24 (bvmul e11 e10)))
(let ((e25 (ite (bvsge e19 ((_ zero_extend 15) e11)) (_ bv1 1) (_ bv0 1))))
(let ((e26 (ite (bvult e14 v3) (_ bv1 1) (_ bv0 1))))
(let ((e27 (ite (bvsgt e6 ((_ sign_extend 15) e23)) (_ bv1 1) (_ bv0 1))))
(let ((e28 (bvneg e22)))
(let ((e29 ((_ repeat 1) v0)))
(let ((e30 (bvor e13 e16)))
(let ((e31 (bvnor ((_ sign_extend 8) e13) e29)))
(let ((e32 (bvand ((_ sign_extend 14) e9) e18)))
(let ((e33 (bvxnor v3 ((_ zero_extend 14) e25))))
(let ((e34 ((_ rotate_left 4) e7)))
(let ((e35 (bvor e32 ((_ zero_extend 14) e27))))
(let ((e36 (ite (= (_ bv1 1) ((_ extract 0 0) e27)) e34 ((_ zero_extend 14) e13))))
(let ((e37 ((_ zero_extend 0) e26)))
(let ((e38 (bvadd e6 ((_ sign_extend 15) e11))))
(let ((e39 (ite (= (_ bv1 1) ((_ extract 1 1) e33)) e38 e20)))
(let ((e40 ((_ sign_extend 9) e28)))
(let ((e41 (ite (bvsgt e20 ((_ sign_extend 1) e34)) (_ bv1 1) (_ bv0 1))))
(let ((e42 ((_ rotate_left 11) e7)))
(let ((e43 (bvnor e26 e41)))
(let ((e44 ((_ extract 2 0) v1)))
(let ((e45 (bvult e31 ((_ sign_extend 8) e23))))
(let ((e46 (bvsle e36 ((_ sign_extend 14) e16))))
(let ((e47 (bvuge e13 e22)))
(let ((e48 (bvsge e34 e32)))
(let ((e49 (bvsge e13 e9)))
(let ((e50 (bvslt ((_ zero_extend 6) e17) v4)))
(let ((e51 (bvult e5 ((_ sign_extend 7) v0))))
(let ((e52 (bvugt e12 e37)))
(let ((e53 (bvule ((_ sign_extend 14) e23) e33)))
(let ((e54 (bvsgt e31 ((_ zero_extend 8) e41))))
(let ((e55 (bvule e17 e17)))
(let ((e56 (distinct v0 ((_ sign_extend 8) e12))))
(let ((e57 (bvsgt e34 ((_ sign_extend 14) e12))))
(let ((e58 (distinct e39 e39)))
(let ((e59 (bvugt ((_ sign_extend 1) v2) e6)))
(let ((e60 (= e33 ((_ sign_extend 12) e17))))
(let ((e61 (bvuge e5 e15)))
(let ((e62 (bvsge e42 ((_ zero_extend 6) v0))))
(let ((e63 (bvule e8 e14)))
(let ((e64 (bvugt v2 e18)))
(let ((e65 (bvsle ((_ sign_extend 1) v4) e40)))
(let ((e66 (bvule e29 ((_ sign_extend 8) e12))))
(let ((e67 (= e23 e37)))
(let ((e68 (bvsgt e39 e6)))
(let ((e69 (bvslt ((_ zero_extend 1) e42) e38)))
(let ((e70 (bvuge ((_ zero_extend 1) v3) e38)))
(let ((e71 (bvslt e31 ((_ sign_extend 8) e26))))
(let ((e72 (bvsle e6 ((_ sign_extend 1) e7))))
(let ((e73 (bvsle e8 e33)))
(let ((e74 (bvsgt ((_ sign_extend 2) e41) e17)))
(let ((e75 (distinct e11 e41)))
(let ((e76 (distinct e36 ((_ zero_extend 14) e24))))
(let ((e77 (bvule ((_ zero_extend 12) e17) e34)))
(let ((e78 (bvule e20 ((_ sign_extend 15) e13))))
(let ((e79 (distinct ((_ zero_extend 14) e12) e21)))
(let ((e80 (distinct e36 ((_ sign_extend 6) v0))))
(let ((e81 (bvuge ((_ sign_extend 8) e37) e29)))
(let ((e82 (bvult e41 e23)))
(let ((e83 (bvsle ((_ sign_extend 6) e29) v2)))
(let ((e84 (bvule e7 ((_ zero_extend 14) e28))))
(let ((e85 (= e20 ((_ zero_extend 7) e29))))
(let ((e86 (bvsge e25 e41)))
(let ((e87 (bvuge v0 ((_ sign_extend 8) e9))))
(let ((e88 (= e7 ((_ sign_extend 6) e31))))
(let ((e89 (bvuge ((_ zero_extend 8) e9) v0)))
(let ((e90 (bvsgt e30 e9)))
(let ((e91 (= e5 ((_ zero_extend 1) e42))))
(let ((e92 (= e11 e30)))
(let ((e93 (distinct e39 ((_ zero_extend 1) e32))))
(let ((e94 (bvsgt ((_ sign_extend 14) e43) v1)))
(let ((e95 (bvsle e18 ((_ sign_extend 14) e9))))
(let ((e96 (bvult e22 e16)))
(let ((e97 (bvule e21 ((_ zero_extend 14) e26))))
(let ((e98 (= ((_ zero_extend 15) e41) e5)))
(let ((e99 (distinct e34 ((_ sign_extend 14) e30))))
(let ((e100 (bvult e25 e28)))
(let ((e101 (distinct ((_ sign_extend 14) e41) e8)))
(let ((e102 (distinct e39 ((_ zero_extend 1) e35))))
(let ((e103 (bvult e8 ((_ zero_extend 14) e27))))
(let ((e104 (bvsle ((_ sign_extend 8) e13) v0)))
(let ((e105 (bvslt e5 ((_ sign_extend 7) v4))))
(let ((e106 (bvugt e42 ((_ zero_extend 14) e28))))
(let ((e107 (bvsgt e22 e13)))
(let ((e108 (bvsge e27 e13)))
(let ((e109 (bvslt e15 ((_ sign_extend 15) e12))))
(let ((e110 (bvult e7 v1)))
(let ((e111 (distinct ((_ zero_extend 14) e11) e36)))
(let ((e112 (bvult e43 e11)))
(let ((e113 (bvsle e36 e18)))
(let ((e114 (bvsge e20 ((_ zero_extend 7) e29))))
(let ((e115 (bvult ((_ sign_extend 14) e23) e34)))
(let ((e116 (bvsgt e34 e35)))
(let ((e117 (bvsgt v3 e7)))
(let ((e118 (bvsle e24 e27)))
(let ((e119 (bvsge e21 ((_ sign_extend 14) e9))))
(let ((e120 (bvult ((_ sign_extend 14) e43) e34)))
(let ((e121 (bvsge e32 ((_ zero_extend 6) e31))))
(let ((e122 (bvsgt e37 e9)))
(let ((e123 (bvuge ((_ sign_extend 15) e9) e5)))
(let ((e124 (bvsle ((_ zero_extend 14) e22) e7)))
(let ((e125 (bvslt e14 ((_ zero_extend 14) e41))))
(let ((e126 (bvuge e8 e18)))
(let ((e127 (bvsge ((_ sign_extend 14) e22) e8)))
(let ((e128 (bvsge e7 v1)))
(let ((e129 (= e42 e33)))
(let ((e130 (bvule e40 ((_ zero_extend 9) e28))))
(let ((e131 (distinct ((_ zero_extend 14) e12) e18)))
(let ((e132 (= ((_ sign_extend 14) e12) v2)))
(let ((e133 (= e23 e13)))
(let ((e134 (bvsgt e21 ((_ zero_extend 6) v0))))
(let ((e135 (bvsgt ((_ sign_extend 13) e17) e6)))
(let ((e136 (bvuge e26 e41)))
(let ((e137 (distinct e21 ((_ zero_extend 14) e16))))
(let ((e138 (bvsge ((_ sign_extend 15) e12) e19)))
(let ((e139 (bvslt e23 e10)))
(let ((e140 (bvsgt e21 e33)))
(let ((e141 (bvule e16 e43)))
(let ((e142 (bvslt e20 ((_ sign_extend 15) e27))))
(let ((e143 (bvuge ((_ zero_extend 14) e26) e7)))
(let ((e144 (bvuge v0 ((_ sign_extend 8) e28))))
(let ((e145 (bvuge e20 e20)))
(let ((e146 (distinct e10 e13)))
(let ((e147 (= e29 ((_ sign_extend 8) e16))))
(let ((e148 (= e14 ((_ zero_extend 14) e10))))
(let ((e149 (bvugt e6 ((_ sign_extend 1) e8))))
(let ((e150 (bvule e33 ((_ sign_extend 14) e12))))
(let ((e151 (bvsle e20 ((_ sign_extend 15) e16))))
(let ((e152 (bvsle e40 ((_ zero_extend 9) e24))))
(let ((e153 (bvsgt ((_ zero_extend 8) e41) v0)))
(let ((e154 (distinct e5 ((_ sign_extend 1) e18))))
(let ((e155 (bvslt v1 e33)))
(let ((e156 (bvuge ((_ sign_extend 6) e29) e35)))
(let ((e157 (bvuge e34 v2)))
(let ((e158 (bvsgt e14 v1)))
(let ((e159 (bvugt e24 e41)))
(let ((e160 (distinct e14 e36)))
(let ((e161 (bvsge e31 ((_ zero_extend 8) e16))))
(let ((e162 (bvsge e42 ((_ zero_extend 14) e22))))
(let ((e163 (bvsge e44 e44)))
(let ((e164 (xor e90 e53)))
(let ((e165 (ite e101 e133 e113)))
(let ((e166 (=> e157 e119)))
(let ((e167 (ite e57 e159 e100)))
(let ((e168 (xor e52 e145)))
(let ((e169 (or e92 e165)))
(let ((e170 (not e116)))
(let ((e171 (ite e147 e162 e107)))
(let ((e172 (or e117 e152)))
(let ((e173 (ite e51 e56 e132)))
(let ((e174 (and e128 e73)))
(let ((e175 (and e96 e130)))
(let ((e176 (and e63 e121)))
(let ((e177 (= e166 e82)))
(let ((e178 (ite e143 e65 e172)))
(let ((e179 (= e95 e91)))
(let ((e180 (and e58 e127)))
(let ((e181 (= e134 e46)))
(let ((e182 (ite e167 e62 e68)))
(let ((e183 (not e123)))
(let ((e184 (not e112)))
(let ((e185 (=> e102 e164)))
(let ((e186 (=> e180 e142)))
(let ((e187 (or e158 e70)))
(let ((e188 (ite e88 e176 e140)))
(let ((e189 (not e84)))
(let ((e190 (= e93 e125)))
(let ((e191 (xor e173 e161)))
(let ((e192 (xor e135 e76)))
(let ((e193 (=> e75 e59)))
(let ((e194 (= e109 e192)))
(let ((e195 (ite e138 e77 e136)))
(let ((e196 (and e104 e175)))
(let ((e197 (xor e86 e114)))
(let ((e198 (xor e190 e108)))
(let ((e199 (xor e72 e139)))
(let ((e200 (= e146 e169)))
(let ((e201 (xor e198 e64)))
(let ((e202 (not e195)))
(let ((e203 (= e49 e191)))
(let ((e204 (not e185)))
(let ((e205 (and e48 e137)))
(let ((e206 (not e106)))
(let ((e207 (not e200)))
(let ((e208 (or e155 e89)))
(let ((e209 (= e80 e98)))
(let ((e210 (ite e67 e177 e97)))
(let ((e211 (=> e156 e50)))
(let ((e212 (or e148 e78)))
(let ((e213 (not e115)))
(let ((e214 (not e85)))
(let ((e215 (=> e120 e144)))
(let ((e216 (and e154 e197)))
(let ((e217 (= e126 e205)))
(let ((e218 (= e212 e149)))
(let ((e219 (and e183 e193)))
(let ((e220 (=> e118 e178)))
(let ((e221 (=> e218 e220)))
(let ((e222 (or e111 e69)))
(let ((e223 (or e122 e215)))
(let ((e224 (ite e153 e55 e74)))
(let ((e225 (=> e45 e199)))
(let ((e226 (or e151 e54)))
(let ((e227 (ite e221 e201 e210)))
(let ((e228 (= e225 e170)))
(let ((e229 (=> e216 e194)))
(let ((e230 (or e141 e60)))
(let ((e231 (and e181 e124)))
(let ((e232 (=> e206 e160)))
(let ((e233 (ite e79 e228 e229)))
(let ((e234 (= e214 e182)))
(let ((e235 (=> e217 e211)))
(let ((e236 (or e131 e179)))
(let ((e237 (=> e189 e110)))
(let ((e238 (ite e171 e219 e171)))
(let ((e239 (xor e188 e231)))
(let ((e240 (xor e81 e103)))
(let ((e241 (= e239 e234)))
(let ((e242 (ite e235 e187 e87)))
(let ((e243 (ite e186 e224 e242)))
(let ((e244 (=> e232 e204)))
(let ((e245 (and e237 e244)))
(let ((e246 (ite e223 e203 e66)))
(let ((e247 (ite e236 e241 e174)))
(let ((e248 (not e99)))
(let ((e249 (ite e150 e209 e226)))
(let ((e250 (not e249)))
(let ((e251 (ite e163 e243 e168)))
(let ((e252 (or e105 e246)))
(let ((e253 (or e196 e248)))
(let ((e254 (or e247 e227)))
(let ((e255 (=> e213 e129)))
(let ((e256 (ite e245 e252 e253)))
(let ((e257 (ite e240 e222 e222)))
(let ((e258 (and e257 e71)))
(let ((e259 (or e61 e238)))
(let ((e260 (xor e259 e208)))
(let ((e261 (or e258 e256)))
(let ((e262 (=> e233 e251)))
(let ((e263 (ite e255 e94 e254)))
(let ((e264 (ite e261 e47 e262)))
(let ((e265 (or e230 e250)))
(let ((e266 (=> e260 e207)))
(let ((e267 (xor e263 e202)))
(let ((e268 (ite e83 e83 e83)))
(let ((e269 (= e265 e268)))
(let ((e270 (or e267 e269)))
(let ((e271 (= e266 e266)))
(let ((e272 (and e264 e270)))
(let ((e273 (xor e272 e184)))
(let ((e274 (=> e271 e271)))
(let ((e275 (=> e274 e274)))
(let ((e276 (=> e275 e273)))
(let ((e277 (and e276 (not (= e10 (_ bv0 1))))))
(let ((e278 (and e277 (not (= e5 (_ bv0 16))))))
(let ((e279 (and e278 (not (= e5 (bvnot (_ bv0 16)))))))
(let ((e280 (and e279 (not (= v3 (_ bv0 15))))))
(let ((e281 (and e280 (not (= v3 (bvnot (_ bv0 15)))))))
e281
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
