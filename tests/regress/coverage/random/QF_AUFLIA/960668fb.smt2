(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_AUFLIA)
(define-sort Index () Int)
(define-sort Element () Int)
(declare-fun f0 ( Int) Int)
(declare-fun f1 ( (Array Index Element)) (Array Index Element))
(declare-fun p0 ( Int Int Int) Bool)
(declare-fun p1 ( (Array Index Element) (Array Index Element) (Array Index Element)) Bool)
(declare-fun v0 () Int)
(declare-fun v1 () Int)
(declare-fun v2 () Int)
(declare-fun v3 () (Array Index Element))
(assert (let ((e4 1))
(let ((e5 (+ v1 v0)))
(let ((e6 (- v2 v0)))
(let ((e7 (+ v2 v0)))
(let ((e8 (+ e6 e7)))
(let ((e9 (- v2)))
(let ((e10 (ite (p0 e5 v2 e8) 1 0)))
(let ((e11 (- e7 v0)))
(let ((e12 (- e9 e7)))
(let ((e13 (f0 e7)))
(let ((e14 (- e10 e9)))
(let ((e15 (ite (p0 v2 e5 v1) 1 0)))
(let ((e16 (* e12 (- e4))))
(let ((e17 (store v3 v1 e8)))
(let ((e18 (store v3 e10 v1)))
(let ((e19 (f1 e17)))
(let ((e20 (f1 e18)))
(let ((e21 (f1 e20)))
(let ((e22 (f1 v3)))
(let ((e23 (p1 e17 v3 e22)))
(let ((e24 (p1 e21 e17 e18)))
(let ((e25 (p1 e19 e17 e20)))
(let ((e26 (>= e10 e5)))
(let ((e27 (p0 e14 e11 e15)))
(let ((e28 (p0 e13 e5 e16)))
(let ((e29 (> e9 v1)))
(let ((e30 (> e12 e14)))
(let ((e31 (>= e13 v1)))
(let ((e32 (>= v0 e13)))
(let ((e33 (> e8 e9)))
(let ((e34 (<= e5 v0)))
(let ((e35 (>= e7 e8)))
(let ((e36 (distinct e6 v1)))
(let ((e37 (<= v2 e9)))
(let ((e38 (ite e29 e22 e17)))
(let ((e39 (ite e36 e21 e38)))
(let ((e40 (ite e23 e18 e22)))
(let ((e41 (ite e26 e20 v3)))
(let ((e42 (ite e30 e20 e21)))
(let ((e43 (ite e31 e17 e42)))
(let ((e44 (ite e31 e19 e42)))
(let ((e45 (ite e37 e40 e18)))
(let ((e46 (ite e32 e18 e21)))
(let ((e47 (ite e27 e39 e38)))
(let ((e48 (ite e29 e17 e42)))
(let ((e49 (ite e35 e18 e19)))
(let ((e50 (ite e33 e49 e38)))
(let ((e51 (ite e25 e18 e49)))
(let ((e52 (ite e31 e41 v3)))
(let ((e53 (ite e34 e41 e42)))
(let ((e54 (ite e24 v3 e43)))
(let ((e55 (ite e28 e20 e18)))
(let ((e56 (ite e31 e11 e8)))
(let ((e57 (ite e27 e6 e15)))
(let ((e58 (ite e32 e13 e7)))
(let ((e59 (ite e34 e13 v0)))
(let ((e60 (ite e35 e59 e14)))
(let ((e61 (ite e23 e9 e6)))
(let ((e62 (ite e33 e12 e5)))
(let ((e63 (ite e36 v1 e15)))
(let ((e64 (ite e26 e10 e5)))
(let ((e65 (ite e25 e60 e14)))
(let ((e66 (ite e28 v2 e8)))
(let ((e67 (ite e37 v0 e5)))
(let ((e68 (ite e27 e16 e8)))
(let ((e69 (ite e29 e65 e13)))
(let ((e70 (ite e30 v2 e60)))
(let ((e71 (ite e23 e61 e59)))
(let ((e72 (ite e34 e61 e10)))
(let ((e73 (ite e24 e66 e11)))
(let ((e74 (store e43 e71 e62)))
(let ((e75 (select e46 e56)))
(let ((e76 (store e47 e63 e60)))
(let ((e77 (f1 e22)))
(let ((e78 (f1 e55)))
(let ((e79 (f1 e18)))
(let ((e80 (f1 e74)))
(let ((e81 (f1 e46)))
(let ((e82 (f1 e44)))
(let ((e83 (f1 e80)))
(let ((e84 (f1 e45)))
(let ((e85 (f1 e19)))
(let ((e86 (f1 e21)))
(let ((e87 (f1 e50)))
(let ((e88 (f1 e53)))
(let ((e89 (f1 e48)))
(let ((e90 (f1 e45)))
(let ((e91 (f1 e47)))
(let ((e92 (f1 e54)))
(let ((e93 (f1 e79)))
(let ((e94 (f1 e82)))
(let ((e95 (f1 e90)))
(let ((e96 (f1 e84)))
(let ((e97 (f1 e43)))
(let ((e98 (f1 e93)))
(let ((e99 (f1 e79)))
(let ((e100 (f1 e96)))
(let ((e101 (f1 e52)))
(let ((e102 (f1 e40)))
(let ((e103 (f1 e20)))
(let ((e104 (f1 e100)))
(let ((e105 (f1 e81)))
(let ((e106 (f1 e39)))
(let ((e107 (f1 e76)))
(let ((e108 (f1 e38)))
(let ((e109 (f1 e97)))
(let ((e110 (f1 e19)))
(let ((e111 (f1 e41)))
(let ((e112 (f1 e49)))
(let ((e113 (f1 e48)))
(let ((e114 (f1 e104)))
(let ((e115 (f1 e100)))
(let ((e116 (f1 e42)))
(let ((e117 (f1 e51)))
(let ((e118 (f1 e17)))
(let ((e119 (f1 e96)))
(let ((e120 (f1 v3)))
(let ((e121 (f0 e57)))
(let ((e122 (- e70)))
(let ((e123 (* e4 e122)))
(let ((e124 (* e4 e72)))
(let ((e125 (f0 e14)))
(let ((e126 (ite (p0 e62 e60 e65) 1 0)))
(let ((e127 (* (- e4) v0)))
(let ((e128 (ite (p0 e58 e64 e14) 1 0)))
(let ((e129 (ite (p0 e73 e75 e70) 1 0)))
(let ((e130 (* e9 e4)))
(let ((e131 (f0 e12)))
(let ((e132 (f0 e13)))
(let ((e133 (+ e56 e57)))
(let ((e134 (+ e61 e63)))
(let ((e135 (+ e7 e126)))
(let ((e136 (- e59)))
(let ((e137 (f0 e135)))
(let ((e138 (* e10 e4)))
(let ((e139 (f0 e71)))
(let ((e140 (f0 e69)))
(let ((e141 (- e5)))
(let ((e142 (* (- e4) e11)))
(let ((e143 (f0 v2)))
(let ((e144 (- v1)))
(let ((e145 (- e68)))
(let ((e146 (+ e67 v0)))
(let ((e147 (* (- e4) e130)))
(let ((e148 (- e8)))
(let ((e149 (f0 e66)))
(let ((e150 (f0 e136)))
(let ((e151 (- e143 e62)))
(let ((e152 (* e138 e4)))
(let ((e153 (- e56)))
(let ((e154 (+ e15 e16)))
(let ((e155 (+ e6 e14)))
(let ((e156 (p1 e84 e19 e53)))
(let ((e157 (p1 e52 e104 e107)))
(let ((e158 (p1 e55 e103 e39)))
(let ((e159 (p1 v3 e102 e19)))
(let ((e160 (p1 e117 e43 e87)))
(let ((e161 (p1 e103 e96 e49)))
(let ((e162 (p1 e50 e101 e101)))
(let ((e163 (p1 e98 e113 e82)))
(let ((e164 (p1 e112 e112 e51)))
(let ((e165 (p1 e109 e102 e83)))
(let ((e166 (p1 e21 e101 e81)))
(let ((e167 (p1 e55 e112 e101)))
(let ((e168 (p1 e119 e47 e110)))
(let ((e169 (p1 e50 e38 e103)))
(let ((e170 (p1 e38 e104 e108)))
(let ((e171 (p1 e79 e95 e76)))
(let ((e172 (p1 e111 e100 e54)))
(let ((e173 (p1 e82 e116 e109)))
(let ((e174 (p1 e88 e116 e76)))
(let ((e175 (p1 e117 e106 e79)))
(let ((e176 (p1 e82 e107 e39)))
(let ((e177 (p1 e93 e44 e76)))
(let ((e178 (p1 e118 e41 e18)))
(let ((e179 (p1 e40 e117 e87)))
(let ((e180 (p1 e92 e17 e22)))
(let ((e181 (p1 e99 e44 e100)))
(let ((e182 (p1 e91 e88 e110)))
(let ((e183 (p1 e46 e116 e54)))
(let ((e184 (p1 e76 e100 e94)))
(let ((e185 (p1 e85 e20 e44)))
(let ((e186 (p1 e79 e38 e94)))
(let ((e187 (p1 e38 e94 e106)))
(let ((e188 (p1 e96 e111 e102)))
(let ((e189 (p1 e109 e44 e111)))
(let ((e190 (p1 e89 e55 e88)))
(let ((e191 (p1 e42 e95 e20)))
(let ((e192 (p1 e78 e110 e109)))
(let ((e193 (p1 e90 e79 e106)))
(let ((e194 (p1 e113 e84 e48)))
(let ((e195 (p1 e103 e47 e90)))
(let ((e196 (p1 e113 e120 e115)))
(let ((e197 (p1 e114 e108 e95)))
(let ((e198 (p1 e102 e118 e48)))
(let ((e199 (p1 e89 e81 v3)))
(let ((e200 (p1 e97 e108 e106)))
(let ((e201 (p1 e105 e118 e44)))
(let ((e202 (p1 e86 e96 e21)))
(let ((e203 (p1 e78 e39 e74)))
(let ((e204 (p1 e45 e91 e41)))
(let ((e205 (p1 e105 e98 e47)))
(let ((e206 (p1 e118 e20 e92)))
(let ((e207 (p1 e80 e46 e78)))
(let ((e208 (p1 e77 e90 e97)))
(let ((e209 (p0 e58 e65 e151)))
(let ((e210 (> e125 e155)))
(let ((e211 (<= e5 e147)))
(let ((e212 (= e122 e65)))
(let ((e213 (<= e14 e145)))
(let ((e214 (> e56 e62)))
(let ((e215 (< v0 e11)))
(let ((e216 (< e126 e152)))
(let ((e217 (p0 e6 e68 e7)))
(let ((e218 (distinct e153 e7)))
(let ((e219 (< e128 e145)))
(let ((e220 (distinct e12 e11)))
(let ((e221 (= e63 e148)))
(let ((e222 (< e65 e138)))
(let ((e223 (distinct e131 e59)))
(let ((e224 (>= e125 e147)))
(let ((e225 (< e137 e124)))
(let ((e226 (p0 v1 e135 e140)))
(let ((e227 (> e62 e148)))
(let ((e228 (p0 e145 e124 v2)))
(let ((e229 (>= e141 e60)))
(let ((e230 (distinct e139 e61)))
(let ((e231 (<= e150 e67)))
(let ((e232 (<= e12 e11)))
(let ((e233 (<= e129 e151)))
(let ((e234 (< e121 e137)))
(let ((e235 (>= e61 e72)))
(let ((e236 (< e7 e137)))
(let ((e237 (p0 e124 e149 e140)))
(let ((e238 (> e142 e16)))
(let ((e239 (>= e133 e136)))
(let ((e240 (> e70 e59)))
(let ((e241 (p0 e75 e125 e67)))
(let ((e242 (p0 e140 e147 e57)))
(let ((e243 (> e143 e9)))
(let ((e244 (> e134 e148)))
(let ((e245 (p0 e6 e63 e66)))
(let ((e246 (> e62 e15)))
(let ((e247 (>= e143 e57)))
(let ((e248 (<= e152 e15)))
(let ((e249 (= e65 e149)))
(let ((e250 (<= e9 e129)))
(let ((e251 (distinct e124 e146)))
(let ((e252 (<= e73 e129)))
(let ((e253 (<= e71 e141)))
(let ((e254 (> e132 e64)))
(let ((e255 (= e143 e71)))
(let ((e256 (> e13 e9)))
(let ((e257 (> e68 e147)))
(let ((e258 (> e13 e146)))
(let ((e259 (> e6 e9)))
(let ((e260 (= e69 e122)))
(let ((e261 (= e9 e124)))
(let ((e262 (< e8 e12)))
(let ((e263 (> e10 e124)))
(let ((e264 (> e12 e145)))
(let ((e265 (= e123 e122)))
(let ((e266 (<= e75 e155)))
(let ((e267 (< v1 e135)))
(let ((e268 (> e127 e131)))
(let ((e269 (distinct e11 e62)))
(let ((e270 (p0 e130 e12 e16)))
(let ((e271 (p0 e14 e9 e152)))
(let ((e272 (<= e150 e8)))
(let ((e273 (> e68 e131)))
(let ((e274 (p0 e154 e69 e129)))
(let ((e275 (p0 e127 e141 e136)))
(let ((e276 (>= e142 e125)))
(let ((e277 (> e14 e61)))
(let ((e278 (<= e130 e130)))
(let ((e279 (distinct e144 e148)))
(let ((e280 (and e175 e268)))
(let ((e281 (= e195 e197)))
(let ((e282 (and e224 e23)))
(let ((e283 (ite e270 e252 e217)))
(let ((e284 (ite e247 e211 e26)))
(let ((e285 (=> e271 e242)))
(let ((e286 (xor e165 e160)))
(let ((e287 (= e206 e263)))
(let ((e288 (and e236 e171)))
(let ((e289 (ite e283 e198 e203)))
(let ((e290 (= e260 e176)))
(let ((e291 (and e204 e173)))
(let ((e292 (=> e169 e244)))
(let ((e293 (ite e170 e25 e291)))
(let ((e294 (ite e181 e288 e188)))
(let ((e295 (and e267 e249)))
(let ((e296 (=> e273 e33)))
(let ((e297 (ite e292 e168 e164)))
(let ((e298 (not e276)))
(let ((e299 (and e167 e219)))
(let ((e300 (ite e266 e226 e240)))
(let ((e301 (ite e31 e31 e232)))
(let ((e302 (not e214)))
(let ((e303 (and e159 e293)))
(let ((e304 (= e187 e189)))
(let ((e305 (not e245)))
(let ((e306 (not e37)))
(let ((e307 (not e161)))
(let ((e308 (not e199)))
(let ((e309 (=> e227 e290)))
(let ((e310 (and e221 e223)))
(let ((e311 (=> e184 e200)))
(let ((e312 (and e259 e201)))
(let ((e313 (xor e279 e163)))
(let ((e314 (xor e277 e218)))
(let ((e315 (ite e191 e178 e286)))
(let ((e316 (= e246 e307)))
(let ((e317 (=> e185 e213)))
(let ((e318 (or e284 e303)))
(let ((e319 (xor e318 e202)))
(let ((e320 (not e193)))
(let ((e321 (ite e196 e278 e301)))
(let ((e322 (not e157)))
(let ((e323 (= e180 e34)))
(let ((e324 (or e315 e230)))
(let ((e325 (not e228)))
(let ((e326 (ite e210 e225 e298)))
(let ((e327 (= e231 e29)))
(let ((e328 (ite e251 e179 e183)))
(let ((e329 (and e258 e27)))
(let ((e330 (or e235 e312)))
(let ((e331 (or e295 e207)))
(let ((e332 (= e326 e304)))
(let ((e333 (or e243 e324)))
(let ((e334 (not e262)))
(let ((e335 (not e313)))
(let ((e336 (ite e239 e237 e239)))
(let ((e337 (=> e323 e182)))
(let ((e338 (or e208 e28)))
(let ((e339 (and e216 e261)))
(let ((e340 (= e32 e35)))
(let ((e341 (or e282 e250)))
(let ((e342 (or e321 e289)))
(let ((e343 (or e325 e222)))
(let ((e344 (not e229)))
(let ((e345 (xor e329 e280)))
(let ((e346 (not e305)))
(let ((e347 (= e297 e309)))
(let ((e348 (and e172 e172)))
(let ((e349 (=> e319 e330)))
(let ((e350 (or e194 e341)))
(let ((e351 (not e333)))
(let ((e352 (or e212 e327)))
(let ((e353 (ite e190 e255 e257)))
(let ((e354 (ite e265 e338 e334)))
(let ((e355 (not e174)))
(let ((e356 (and e332 e350)))
(let ((e357 (ite e253 e296 e275)))
(let ((e358 (ite e349 e241 e294)))
(let ((e359 (not e177)))
(let ((e360 (=> e158 e205)))
(let ((e361 (ite e162 e308 e166)))
(let ((e362 (not e248)))
(let ((e363 (xor e346 e357)))
(let ((e364 (not e331)))
(let ((e365 (=> e30 e24)))
(let ((e366 (not e299)))
(let ((e367 (xor e311 e348)))
(let ((e368 (not e256)))
(let ((e369 (or e274 e215)))
(let ((e370 (or e209 e306)))
(let ((e371 (and e342 e234)))
(let ((e372 (ite e344 e238 e353)))
(let ((e373 (and e36 e369)))
(let ((e374 (not e335)))
(let ((e375 (not e340)))
(let ((e376 (xor e364 e156)))
(let ((e377 (ite e352 e360 e186)))
(let ((e378 (xor e376 e328)))
(let ((e379 (ite e339 e354 e368)))
(let ((e380 (or e359 e371)))
(let ((e381 (not e347)))
(let ((e382 (xor e317 e281)))
(let ((e383 (ite e378 e361 e365)))
(let ((e384 (and e366 e300)))
(let ((e385 (ite e370 e192 e337)))
(let ((e386 (or e302 e343)))
(let ((e387 (not e351)))
(let ((e388 (= e269 e269)))
(let ((e389 (not e367)))
(let ((e390 (= e386 e362)))
(let ((e391 (or e374 e358)))
(let ((e392 (=> e336 e389)))
(let ((e393 (xor e320 e320)))
(let ((e394 (ite e285 e356 e254)))
(let ((e395 (or e380 e310)))
(let ((e396 (xor e387 e322)))
(let ((e397 (= e264 e373)))
(let ((e398 (ite e220 e233 e382)))
(let ((e399 (and e396 e377)))
(let ((e400 (not e390)))
(let ((e401 (not e388)))
(let ((e402 (and e379 e272)))
(let ((e403 (not e400)))
(let ((e404 (= e392 e402)))
(let ((e405 (xor e355 e393)))
(let ((e406 (= e403 e345)))
(let ((e407 (or e316 e398)))
(let ((e408 (xor e399 e381)))
(let ((e409 (and e408 e391)))
(let ((e410 (or e383 e409)))
(let ((e411 (and e363 e375)))
(let ((e412 (ite e410 e287 e411)))
(let ((e413 (=> e385 e314)))
(let ((e414 (ite e384 e413 e394)))
(let ((e415 (ite e412 e407 e397)))
(let ((e416 (and e415 e395)))
(let ((e417 (xor e414 e401)))
(let ((e418 (xor e416 e405)))
(let ((e419 (and e404 e418)))
(let ((e420 (not e406)))
(let ((e421 (ite e372 e420 e417)))
(let ((e422 (or e419 e419)))
(let ((e423 (or e421 e421)))
(let ((e424 (xor e422 e422)))
(let ((e425 (or e424 e423)))
e425
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
