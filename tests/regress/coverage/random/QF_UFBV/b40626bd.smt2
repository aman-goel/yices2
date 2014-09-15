(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UFBV)
(declare-fun f0 ( (_ BitVec 1) (_ BitVec 11) (_ BitVec 2)) (_ BitVec 2))
(declare-fun f1 ( (_ BitVec 10)) (_ BitVec 1))
(declare-fun p0 ( (_ BitVec 16) (_ BitVec 5)) Bool)
(declare-fun v0 () (_ BitVec 14))
(declare-fun v1 () (_ BitVec 8))
(declare-fun v2 () (_ BitVec 13))
(declare-fun v3 () (_ BitVec 2))
(assert (let ((e4(_ bv1457 11)))
(let ((e5 (ite (p0 ((_ sign_extend 3) v2) ((_ extract 4 0) v2)) (_ bv1 1) (_ bv0 1))))
(let ((e6 (bvxnor v2 ((_ zero_extend 5) v1))))
(let ((e7 (bvand ((_ sign_extend 12) e5) v2)))
(let ((e8 ((_ rotate_right 10) v2)))
(let ((e9 (f1 ((_ extract 12 3) v2))))
(let ((e10 (ite (= (_ bv1 1) ((_ extract 0 0) e5)) e8 e8)))
(let ((e11 (f0 ((_ extract 0 0) v3) ((_ sign_extend 9) v3) v3)))
(let ((e12 (bvadd v2 ((_ zero_extend 5) v1))))
(let ((e13 (bvlshr e6 e12)))
(let ((e14 (bvshl ((_ sign_extend 9) v3) e4)))
(let ((e15 (bvor v2 ((_ zero_extend 5) v1))))
(let ((e16 ((_ rotate_right 0) e10)))
(let ((e17 (bvand e12 e16)))
(let ((e18 ((_ rotate_right 1) e10)))
(let ((e19 (ite (= e12 ((_ zero_extend 2) e4)) (_ bv1 1) (_ bv0 1))))
(let ((e20 ((_ rotate_right 0) e5)))
(let ((e21 (bvnot e18)))
(let ((e22 (bvnot e16)))
(let ((e23 ((_ extract 1 0) e14)))
(let ((e24 (bvudiv e6 e21)))
(let ((e25 (bvadd ((_ zero_extend 2) e4) e13)))
(let ((e26 (bvlshr e19 e20)))
(let ((e27 (bvsub ((_ zero_extend 6) e11) v1)))
(let ((e28 (bvxnor e7 e15)))
(let ((e29 (bvxor e15 ((_ sign_extend 2) e4))))
(let ((e30 (bvand v2 ((_ sign_extend 12) e9))))
(let ((e31 (bvadd e25 e12)))
(let ((e32 (bvsub e31 ((_ zero_extend 2) e4))))
(let ((e33 ((_ extract 11 2) e6)))
(let ((e34 (bvsdiv ((_ zero_extend 7) e9) e27)))
(let ((e35 (ite (= (_ bv1 1) ((_ extract 3 3) e14)) e24 e30)))
(let ((e36 (ite (bvsle e22 ((_ sign_extend 11) e11)) (_ bv1 1) (_ bv0 1))))
(let ((e37 (ite (distinct e16 ((_ sign_extend 5) e27)) (_ bv1 1) (_ bv0 1))))
(let ((e38 (bvneg e25)))
(let ((e39 (ite (bvslt e13 e13) (_ bv1 1) (_ bv0 1))))
(let ((e40 (bvand e25 e31)))
(let ((e41 (ite (bvslt e22 e17) (_ bv1 1) (_ bv0 1))))
(let ((e42 (ite (bvult e13 e30) (_ bv1 1) (_ bv0 1))))
(let ((e43 (bvxnor ((_ zero_extend 12) v3) v0)))
(let ((e44 (p0 ((_ sign_extend 5) e14) ((_ extract 6 2) e13))))
(let ((e45 (bvule e18 e13)))
(let ((e46 (bvult v0 ((_ zero_extend 1) e12))))
(let ((e47 (bvule e30 ((_ sign_extend 5) e34))))
(let ((e48 (p0 ((_ sign_extend 3) e38) ((_ sign_extend 4) e39))))
(let ((e49 (bvult e12 ((_ zero_extend 5) v1))))
(let ((e50 (bvslt e10 e6)))
(let ((e51 (bvule e22 e30)))
(let ((e52 (bvule v2 e15)))
(let ((e53 (bvsge e16 ((_ sign_extend 3) e33))))
(let ((e54 (bvsle e43 ((_ zero_extend 1) e22))))
(let ((e55 (bvugt e21 e21)))
(let ((e56 (bvsle ((_ sign_extend 5) v1) e8)))
(let ((e57 (bvule e43 ((_ zero_extend 1) e22))))
(let ((e58 (bvugt e31 ((_ zero_extend 12) e26))))
(let ((e59 (bvuge ((_ sign_extend 7) e19) v1)))
(let ((e60 (bvult ((_ zero_extend 10) e19) e4)))
(let ((e61 (= v2 ((_ sign_extend 12) e5))))
(let ((e62 (bvsge e24 ((_ sign_extend 2) e4))))
(let ((e63 (bvule e16 ((_ sign_extend 12) e9))))
(let ((e64 (p0 ((_ zero_extend 8) e27) ((_ extract 11 7) e38))))
(let ((e65 (p0 ((_ zero_extend 15) e9) ((_ zero_extend 4) e39))))
(let ((e66 (bvsge e29 e6)))
(let ((e67 (= e22 ((_ sign_extend 12) e26))))
(let ((e68 (distinct ((_ sign_extend 12) e19) e29)))
(let ((e69 (p0 ((_ sign_extend 3) e35) ((_ extract 11 7) e40))))
(let ((e70 (bvugt ((_ zero_extend 13) e5) e43)))
(let ((e71 (distinct e41 e39)))
(let ((e72 (bvugt e41 e37)))
(let ((e73 (bvule e12 ((_ zero_extend 12) e20))))
(let ((e74 (bvslt e38 ((_ zero_extend 12) e26))))
(let ((e75 (= ((_ sign_extend 12) e37) e28)))
(let ((e76 (bvslt e24 ((_ sign_extend 12) e42))))
(let ((e77 (bvsge ((_ zero_extend 12) v3) v0)))
(let ((e78 (bvuge ((_ zero_extend 12) e19) e10)))
(let ((e79 (= e12 e18)))
(let ((e80 (bvsgt e29 ((_ zero_extend 12) e5))))
(let ((e81 (bvule e38 ((_ sign_extend 12) e41))))
(let ((e82 (bvule e43 ((_ sign_extend 1) e13))))
(let ((e83 (bvugt e15 e15)))
(let ((e84 (= ((_ sign_extend 1) e21) e43)))
(let ((e85 (= e29 e13)))
(let ((e86 (= ((_ zero_extend 3) e33) e32)))
(let ((e87 (bvsgt e29 ((_ zero_extend 5) v1))))
(let ((e88 (p0 ((_ sign_extend 3) e29) ((_ extract 6 2) e13))))
(let ((e89 (bvsle e35 e38)))
(let ((e90 (bvsge ((_ sign_extend 12) e20) e12)))
(let ((e91 (= e35 ((_ sign_extend 12) e37))))
(let ((e92 (bvsge e17 ((_ zero_extend 12) e9))))
(let ((e93 (distinct e4 ((_ sign_extend 1) e33))))
(let ((e94 (bvule ((_ zero_extend 1) e15) v0)))
(let ((e95 (bvsle e25 ((_ sign_extend 12) e42))))
(let ((e96 (bvsle e43 ((_ zero_extend 1) e22))))
(let ((e97 (bvugt e34 ((_ sign_extend 6) e11))))
(let ((e98 (bvult e4 ((_ zero_extend 10) e37))))
(let ((e99 (bvugt e21 e25)))
(let ((e100 (bvsle ((_ sign_extend 2) e34) e33)))
(let ((e101 (p0 ((_ zero_extend 3) e17) ((_ extract 9 5) e7))))
(let ((e102 (bvult e5 e20)))
(let ((e103 (bvult ((_ zero_extend 13) e41) v0)))
(let ((e104 (distinct e19 e37)))
(let ((e105 (bvuge e32 e12)))
(let ((e106 (bvslt e18 e40)))
(let ((e107 (bvult e40 ((_ sign_extend 12) e42))))
(let ((e108 (bvsge e17 e7)))
(let ((e109 (distinct e31 e16)))
(let ((e110 (bvsge ((_ zero_extend 12) e41) v2)))
(let ((e111 (bvsgt v0 ((_ zero_extend 12) e23))))
(let ((e112 (bvsgt v3 ((_ sign_extend 1) e26))))
(let ((e113 (bvule e22 ((_ sign_extend 12) e26))))
(let ((e114 (bvugt ((_ zero_extend 11) e11) e8)))
(let ((e115 (p0 ((_ zero_extend 3) e10) ((_ extract 9 5) e16))))
(let ((e116 (p0 ((_ sign_extend 8) e27) ((_ extract 9 5) e33))))
(let ((e117 (bvugt e12 e22)))
(let ((e118 (bvule e12 ((_ zero_extend 5) e34))))
(let ((e119 (distinct e10 e17)))
(let ((e120 (p0 ((_ zero_extend 14) e11) ((_ extract 10 6) e40))))
(let ((e121 (= e8 ((_ zero_extend 3) e33))))
(let ((e122 (bvslt e29 ((_ sign_extend 12) e5))))
(let ((e123 (p0 ((_ zero_extend 8) e27) ((_ extract 7 3) e21))))
(let ((e124 (bvule ((_ zero_extend 7) e37) e34)))
(let ((e125 (bvsle ((_ sign_extend 12) e37) e30)))
(let ((e126 (bvslt e7 e18)))
(let ((e127 (bvsle e27 ((_ sign_extend 6) v3))))
(let ((e128 (bvult e13 ((_ zero_extend 5) e34))))
(let ((e129 (bvslt ((_ sign_extend 11) e11) e29)))
(let ((e130 (bvule e7 ((_ zero_extend 5) e27))))
(let ((e131 (distinct e17 ((_ zero_extend 12) e26))))
(let ((e132 (bvsgt e7 e24)))
(let ((e133 (bvule e35 e7)))
(let ((e134 (bvult e31 e8)))
(let ((e135 (p0 ((_ zero_extend 3) e32) ((_ extract 12 8) e40))))
(let ((e136 (bvuge e21 e12)))
(let ((e137 (distinct e11 ((_ sign_extend 1) e19))))
(let ((e138 (= v3 e11)))
(let ((e139 (distinct ((_ sign_extend 12) e20) e40)))
(let ((e140 (bvsgt ((_ sign_extend 3) e34) e4)))
(let ((e141 (bvuge e40 e18)))
(let ((e142 (p0 ((_ sign_extend 5) e14) ((_ extract 5 1) e40))))
(let ((e143 (distinct e40 ((_ sign_extend 5) v1))))
(let ((e144 (p0 ((_ zero_extend 3) e38) ((_ extract 8 4) e38))))
(let ((e145 (bvule e6 e31)))
(let ((e146 (= ((_ zero_extend 1) e12) e43)))
(let ((e147 (bvsgt e7 e21)))
(let ((e148 (bvult ((_ zero_extend 5) v1) e16)))
(let ((e149 (bvslt v0 ((_ zero_extend 1) e10))))
(let ((e150 (bvuge ((_ sign_extend 11) v3) e35)))
(let ((e151 (bvult e29 v2)))
(let ((e152 (bvslt e11 ((_ zero_extend 1) e20))))
(let ((e153 (distinct e10 e15)))
(let ((e154 (distinct ((_ sign_extend 1) e32) v0)))
(let ((e155 (bvult e24 ((_ sign_extend 12) e26))))
(let ((e156 (distinct e38 ((_ sign_extend 12) e19))))
(let ((e157 (bvsle e29 e17)))
(let ((e158 (bvsle ((_ sign_extend 12) e39) e28)))
(let ((e159 (distinct e10 e18)))
(let ((e160 (bvult e21 ((_ sign_extend 11) e23))))
(let ((e161 (bvslt ((_ sign_extend 13) e36) e43)))
(let ((e162 (ite e135 e105 e53)))
(let ((e163 (or e85 e149)))
(let ((e164 (= e124 e156)))
(let ((e165 (ite e118 e81 e90)))
(let ((e166 (xor e116 e134)))
(let ((e167 (ite e125 e63 e108)))
(let ((e168 (ite e159 e69 e71)))
(let ((e169 (=> e104 e86)))
(let ((e170 (= e162 e55)))
(let ((e171 (not e137)))
(let ((e172 (=> e168 e75)))
(let ((e173 (=> e146 e97)))
(let ((e174 (= e74 e117)))
(let ((e175 (ite e87 e130 e152)))
(let ((e176 (or e151 e84)))
(let ((e177 (ite e88 e92 e172)))
(let ((e178 (= e158 e95)))
(let ((e179 (ite e114 e107 e96)))
(let ((e180 (ite e91 e122 e106)))
(let ((e181 (ite e47 e103 e166)))
(let ((e182 (xor e98 e45)))
(let ((e183 (=> e115 e142)))
(let ((e184 (or e64 e144)))
(let ((e185 (xor e102 e51)))
(let ((e186 (and e66 e120)))
(let ((e187 (ite e76 e83 e167)))
(let ((e188 (=> e150 e176)))
(let ((e189 (ite e65 e165 e50)))
(let ((e190 (= e112 e179)))
(let ((e191 (=> e154 e186)))
(let ((e192 (=> e62 e141)))
(let ((e193 (= e99 e80)))
(let ((e194 (or e129 e131)))
(let ((e195 (or e48 e59)))
(let ((e196 (and e101 e174)))
(let ((e197 (ite e169 e193 e169)))
(let ((e198 (and e56 e136)))
(let ((e199 (ite e121 e184 e52)))
(let ((e200 (not e191)))
(let ((e201 (ite e79 e196 e161)))
(let ((e202 (or e173 e199)))
(let ((e203 (= e132 e73)))
(let ((e204 (= e111 e111)))
(let ((e205 (and e192 e148)))
(let ((e206 (=> e46 e147)))
(let ((e207 (ite e123 e70 e123)))
(let ((e208 (or e61 e44)))
(let ((e209 (or e203 e195)))
(let ((e210 (not e93)))
(let ((e211 (= e170 e127)))
(let ((e212 (xor e202 e128)))
(let ((e213 (= e198 e49)))
(let ((e214 (xor e78 e177)))
(let ((e215 (or e190 e155)))
(let ((e216 (=> e113 e143)))
(let ((e217 (and e60 e208)))
(let ((e218 (or e181 e138)))
(let ((e219 (=> e110 e218)))
(let ((e220 (=> e68 e185)))
(let ((e221 (ite e214 e210 e153)))
(let ((e222 (not e67)))
(let ((e223 (or e206 e222)))
(let ((e224 (= e187 e77)))
(let ((e225 (ite e140 e175 e163)))
(let ((e226 (=> e223 e194)))
(let ((e227 (=> e139 e224)))
(let ((e228 (ite e209 e57 e164)))
(let ((e229 (or e54 e189)))
(let ((e230 (and e58 e212)))
(let ((e231 (ite e157 e215 e230)))
(let ((e232 (xor e229 e228)))
(let ((e233 (or e145 e226)))
(let ((e234 (= e227 e221)))
(let ((e235 (and e231 e213)))
(let ((e236 (or e72 e219)))
(let ((e237 (not e160)))
(let ((e238 (not e171)))
(let ((e239 (=> e204 e235)))
(let ((e240 (or e109 e133)))
(let ((e241 (and e240 e233)))
(let ((e242 (xor e201 e205)))
(let ((e243 (and e182 e237)))
(let ((e244 (xor e225 e241)))
(let ((e245 (xor e178 e232)))
(let ((e246 (not e82)))
(let ((e247 (and e242 e200)))
(let ((e248 (or e89 e89)))
(let ((e249 (xor e236 e188)))
(let ((e250 (and e234 e211)))
(let ((e251 (=> e126 e183)))
(let ((e252 (= e180 e243)))
(let ((e253 (not e251)))
(let ((e254 (xor e207 e248)))
(let ((e255 (and e249 e253)))
(let ((e256 (= e252 e94)))
(let ((e257 (ite e119 e247 e217)))
(let ((e258 (=> e216 e257)))
(let ((e259 (ite e245 e250 e254)))
(let ((e260 (and e238 e255)))
(let ((e261 (and e100 e244)))
(let ((e262 (ite e261 e260 e260)))
(let ((e263 (xor e258 e197)))
(let ((e264 (and e220 e262)))
(let ((e265 (not e239)))
(let ((e266 (not e259)))
(let ((e267 (= e264 e263)))
(let ((e268 (xor e267 e266)))
(let ((e269 (and e256 e268)))
(let ((e270 (not e269)))
(let ((e271 (=> e246 e246)))
(let ((e272 (ite e265 e270 e265)))
(let ((e273 (not e271)))
(let ((e274 (or e273 e273)))
(let ((e275 (= e274 e272)))
(let ((e276 (and e275 (not (= e27 (_ bv0 8))))))
(let ((e277 (and e276 (not (= e27 (bvnot (_ bv0 8)))))))
(let ((e278 (and e277 (not (= e21 (_ bv0 13))))))
e278
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
