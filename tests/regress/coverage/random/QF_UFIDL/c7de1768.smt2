(set-info :source |fuzzsmt|)
(set-info :smt-lib-version 2.0)
(set-info :category "random")
(set-info :status unknown)
(set-logic QF_UFIDL)
(declare-fun v0 () Int)
(declare-fun v1 () Int)
(declare-fun v2 () Int)
(declare-fun v3 () Int)
(declare-fun v4 () Int)
(declare-fun f0 ( Int Int Int) Int)
(declare-fun f1 ( Int) Int)
(declare-fun p0 ( Int Int) Bool)
(declare-fun p1 ( Int Int Int) Bool)
(assert (let ((e5 11))
(let ((e6 2))
(let ((e7 1))
(let ((e8 0))
(let ((e9 (<= (- v1 v4) (- e5))))
(let ((e10 (< (- v2 v4) e8)))
(let ((e11 (>= v3 v0)))
(let ((e12 (distinct v4 v0)))
(let ((e13 (= v4 v1)))
(let ((e14 (distinct (- v3 v1) e8)))
(let ((e15 (<= v2 v4)))
(let ((e16 (= v4 v2)))
(let ((e17 (<= v0 v0)))
(let ((e18 (<= v0 v1)))
(let ((e19 (< v4 v0)))
(let ((e20 (<= (- v1 v4) (- e6))))
(let ((e21 (= (- v1 v4) e8)))
(let ((e22 (< (- v3 v3) e5)))
(let ((e23 (> (- v3 v1) (- e5))))
(let ((e24 (<= v2 v4)))
(let ((e25 (< (- v1 v1) e7)))
(let ((e26 (>= v2 v1)))
(let ((e27 (distinct (- v1 v2) e7)))
(let ((e28 (>= v0 v1)))
(let ((e29 (>= v3 v1)))
(let ((e30 (<= (- v4 v1) (- e6))))
(let ((e31 (> (- v1 v1) e6)))
(let ((e32 (= (- v1 v0) e7)))
(let ((e33 (<= v4 v4)))
(let ((e34 (distinct v3 v0)))
(let ((e35 (>= (- v4 v1) e7)))
(let ((e36 (< v0 v0)))
(let ((e37 (>= (- v1 v1) (- e5))))
(let ((e38 (distinct (- v0 v3) (- e5))))
(let ((e39 (>= (- v3 v3) (- e8))))
(let ((e40 (f0 v3 v4 v0)))
(let ((e41 (f0 v0 v0 v3)))
(let ((e42 (f1 v4)))
(let ((e43 (f0 v3 v1 v2)))
(let ((e44 (f1 v3)))
(let ((e45 (f0 v3 v0 v4)))
(let ((e46 (f1 e45)))
(let ((e47 (f0 v0 v2 v1)))
(let ((e48 (f1 v1)))
(let ((e49 (f0 v4 e43 e43)))
(let ((e50 (f1 v1)))
(let ((e51 (f1 v2)))
(let ((e52 (f1 v2)))
(let ((e53 (f0 v3 e47 v4)))
(let ((e54 (f1 v2)))
(let ((e55 (f1 e47)))
(let ((e56 (f0 v4 e43 e49)))
(let ((e57 (f0 v1 v1 v1)))
(let ((e58 (= e57 e46)))
(let ((e59 (distinct e48 e54)))
(let ((e60 (p0 e53 v0)))
(let ((e61 (p1 e45 v0 e46)))
(let ((e62 (distinct e56 e40)))
(let ((e63 (= v4 e44)))
(let ((e64 (p1 e50 v4 e51)))
(let ((e65 (p1 e46 e50 e51)))
(let ((e66 (p0 e50 v3)))
(let ((e67 (= v4 e47)))
(let ((e68 (p0 e49 e41)))
(let ((e69 (= e51 e46)))
(let ((e70 (p0 e54 v2)))
(let ((e71 (p1 e56 e48 e48)))
(let ((e72 (p1 v1 e47 v3)))
(let ((e73 (p1 v1 e43 e48)))
(let ((e74 (= e51 v3)))
(let ((e75 (distinct e56 e49)))
(let ((e76 (p1 e48 e56 e42)))
(let ((e77 (p1 e45 v0 e44)))
(let ((e78 (p0 e49 e42)))
(let ((e79 (= e46 e40)))
(let ((e80 (p1 e48 e41 e47)))
(let ((e81 (p0 e45 e45)))
(let ((e82 (p0 e46 e51)))
(let ((e83 (p1 e42 e47 e48)))
(let ((e84 (= e56 e47)))
(let ((e85 (= e53 e54)))
(let ((e86 (p0 v0 v4)))
(let ((e87 (p1 e45 e51 e48)))
(let ((e88 (distinct v4 e50)))
(let ((e89 (p1 e56 v1 e57)))
(let ((e90 (distinct e54 v4)))
(let ((e91 (p1 e52 v2 e49)))
(let ((e92 (p1 v4 e48 e46)))
(let ((e93 (distinct v1 e51)))
(let ((e94 (distinct e52 e42)))
(let ((e95 (= e57 e54)))
(let ((e96 (p1 e57 e56 e51)))
(let ((e97 (p0 e43 e48)))
(let ((e98 (p1 e57 e44 v0)))
(let ((e99 (p0 e42 e50)))
(let ((e100 (= e41 e50)))
(let ((e101 (= v3 e55)))
(let ((e102 (= e49 e45)))
(let ((e103 (p1 v2 e47 e51)))
(let ((e104 (p0 v0 e47)))
(let ((e105 (distinct e41 e50)))
(let ((e106 (= e41 e51)))
(let ((e107 (distinct e44 v2)))
(let ((e108 (= v2 v4)))
(let ((e109 (p1 v1 e48 e57)))
(let ((e110 (distinct e44 e56)))
(let ((e111 (p0 v2 e48)))
(let ((e112 (= e40 v1)))
(let ((e113 (distinct e52 v0)))
(let ((e114 (p0 v0 v3)))
(let ((e115 (p1 e40 e56 e45)))
(let ((e116 (p0 e48 v0)))
(let ((e117 (distinct e55 e47)))
(let ((e118 (distinct e52 e43)))
(let ((e119 (p0 v2 v3)))
(let ((e120 (p1 e47 e49 e45)))
(let ((e121 (distinct e53 e52)))
(let ((e122 (distinct e53 v0)))
(let ((e123 (p1 v1 e57 e54)))
(let ((e124 (distinct e40 e42)))
(let ((e125 (= e43 e45)))
(let ((e126 (p0 e50 e42)))
(let ((e127 (p1 v1 e53 e47)))
(let ((e128 (p1 e45 e54 e40)))
(let ((e129 (p1 e53 e44 e52)))
(let ((e130 (p1 e49 e46 e46)))
(let ((e131 (distinct e55 e46)))
(let ((e132 (distinct e43 e55)))
(let ((e133 (= e55 e56)))
(let ((e134 (= v1 e41)))
(let ((e135 (distinct e51 e53)))
(let ((e136 (= e55 e53)))
(let ((e137 (> e43 v1)))
(let ((e138 (p0 e43 e46)))
(let ((e139 (> e57 v2)))
(let ((e140 (= v2 e53)))
(let ((e141 (<= e48 v0)))
(let ((e142 (p1 e48 e43 e56)))
(let ((e143 (> e54 v0)))
(let ((e144 (<= e43 e40)))
(let ((e145 (<= e57 e48)))
(let ((e146 (> v4 e57)))
(let ((e147 (< v1 e56)))
(let ((e148 (< v3 e48)))
(let ((e149 (< e54 e41)))
(let ((e150 (= e40 e40)))
(let ((e151 (>= e44 e41)))
(let ((e152 (distinct e47 e52)))
(let ((e153 (= e51 e50)))
(let ((e154 (distinct e43 e40)))
(let ((e155 (> v2 e45)))
(let ((e156 (>= e45 e44)))
(let ((e157 (= e56 e49)))
(let ((e158 (< e44 e52)))
(let ((e159 (p0 e47 e54)))
(let ((e160 (= e54 e48)))
(let ((e161 (< e49 e56)))
(let ((e162 (< e57 e45)))
(let ((e163 (>= e57 e44)))
(let ((e164 (>= v1 e43)))
(let ((e165 (> e41 e50)))
(let ((e166 (= e50 e44)))
(let ((e167 (<= e42 e54)))
(let ((e168 (< e48 e41)))
(let ((e169 (< e50 e49)))
(let ((e170 (<= e52 e41)))
(let ((e171 (< e41 e53)))
(let ((e172 (> e49 e44)))
(let ((e173 (<= e45 e40)))
(let ((e174 (> e53 e57)))
(let ((e175 (< e46 e53)))
(let ((e176 (p0 e41 e45)))
(let ((e177 (p0 e56 e41)))
(let ((e178 (>= e52 v0)))
(let ((e179 (<= e43 e50)))
(let ((e180 (distinct e55 e47)))
(let ((e181 (<= v3 v2)))
(let ((e182 (> e48 e43)))
(let ((e183 (p1 e42 e54 e48)))
(let ((e184 (distinct e56 e46)))
(let ((e185 (= v1 e55)))
(let ((e186 (distinct v0 e48)))
(let ((e187 (= e42 e46)))
(let ((e188 (distinct e52 e47)))
(let ((e189 (> v0 v2)))
(let ((e190 (distinct e51 e50)))
(let ((e191 (>= e45 e51)))
(let ((e192 (distinct e42 v4)))
(let ((e193 (< e47 e54)))
(let ((e194 (distinct e57 e54)))
(let ((e195 (= e46 e54)))
(let ((e196 (distinct e42 v3)))
(let ((e197 (p0 e48 e50)))
(let ((e198 (>= v3 v1)))
(let ((e199 (p1 e43 e55 e45)))
(let ((e200 (<= v4 e51)))
(let ((e201 (>= e40 e51)))
(let ((e202 (< v4 v2)))
(let ((e203 (< v3 e52)))
(let ((e204 (> e49 e52)))
(let ((e205 (< v4 e53)))
(let ((e206 (< e40 v4)))
(let ((e207 (distinct e55 e44)))
(let ((e208 (distinct e56 v1)))
(let ((e209 (< e49 e47)))
(let ((e210 (<= e53 e40)))
(let ((e211 (distinct e52 e50)))
(let ((e212 (>= v1 e46)))
(let ((e213 (>= e52 v3)))
(let ((e214 (< e46 v0)))
(let ((e215 (>= v1 e40)))
(let ((e216 (= e55 v3)))
(let ((e217 (distinct e43 e53)))
(let ((e218 (> e43 e57)))
(let ((e219 (<= e45 v0)))
(let ((e220 (> e44 e47)))
(let ((e221 (< e57 e53)))
(let ((e222 (< e43 e44)))
(let ((e223 (= v1 e43)))
(let ((e224 (p0 e44 e41)))
(let ((e225 (> e45 e56)))
(let ((e226 (distinct e55 v3)))
(let ((e227 (<= e44 e49)))
(let ((e228 (= v1 e42)))
(let ((e229 (<= e55 v4)))
(let ((e230 (> e51 e51)))
(let ((e231 (< e53 e43)))
(let ((e232 (distinct e45 e56)))
(let ((e233 (< v0 e53)))
(let ((e234 (p1 e51 v3 v2)))
(let ((e235 (p1 e42 e46 e56)))
(let ((e236 (ite e155 e101 e30)))
(let ((e237 (ite e87 e171 e194)))
(let ((e238 (ite e232 e114 e144)))
(let ((e239 (ite e162 e61 e66)))
(let ((e240 (ite e125 e225 e16)))
(let ((e241 (and e76 e72)))
(let ((e242 (not e121)))
(let ((e243 (and e229 e131)))
(let ((e244 (and e164 e184)))
(let ((e245 (and e124 e174)))
(let ((e246 (and e182 e127)))
(let ((e247 (or e241 e110)))
(let ((e248 (and e82 e244)))
(let ((e249 (= e29 e9)))
(let ((e250 (=> e146 e24)))
(let ((e251 (=> e100 e227)))
(let ((e252 (not e233)))
(let ((e253 (xor e36 e154)))
(let ((e254 (xor e128 e242)))
(let ((e255 (= e238 e142)))
(let ((e256 (xor e207 e231)))
(let ((e257 (= e94 e23)))
(let ((e258 (ite e237 e10 e139)))
(let ((e259 (xor e206 e245)))
(let ((e260 (and e117 e222)))
(let ((e261 (ite e149 e161 e98)))
(let ((e262 (ite e95 e257 e186)))
(let ((e263 (not e218)))
(let ((e264 (not e136)))
(let ((e265 (not e112)))
(let ((e266 (not e169)))
(let ((e267 (= e93 e18)))
(let ((e268 (xor e235 e33)))
(let ((e269 (or e267 e181)))
(let ((e270 (=> e193 e223)))
(let ((e271 (or e81 e247)))
(let ((e272 (= e27 e165)))
(let ((e273 (not e150)))
(let ((e274 (xor e141 e105)))
(let ((e275 (= e210 e88)))
(let ((e276 (= e230 e266)))
(let ((e277 (ite e120 e73 e175)))
(let ((e278 (xor e19 e104)))
(let ((e279 (not e217)))
(let ((e280 (= e180 e163)))
(let ((e281 (= e78 e234)))
(let ((e282 (xor e269 e250)))
(let ((e283 (= e261 e122)))
(let ((e284 (and e177 e107)))
(let ((e285 (=> e92 e152)))
(let ((e286 (or e134 e285)))
(let ((e287 (not e14)))
(let ((e288 (and e283 e58)))
(let ((e289 (=> e153 e15)))
(let ((e290 (=> e137 e156)))
(let ((e291 (=> e290 e143)))
(let ((e292 (=> e64 e115)))
(let ((e293 (ite e96 e277 e239)))
(let ((e294 (= e158 e123)))
(let ((e295 (and e191 e276)))
(let ((e296 (=> e21 e275)))
(let ((e297 (and e216 e278)))
(let ((e298 (xor e59 e286)))
(let ((e299 (or e196 e74)))
(let ((e300 (xor e80 e295)))
(let ((e301 (not e246)))
(let ((e302 (not e28)))
(let ((e303 (xor e294 e251)))
(let ((e304 (not e201)))
(let ((e305 (= e108 e270)))
(let ((e306 (not e102)))
(let ((e307 (= e11 e280)))
(let ((e308 (or e37 e302)))
(let ((e309 (ite e173 e173 e274)))
(let ((e310 (or e271 e135)))
(let ((e311 (or e307 e129)))
(let ((e312 (xor e22 e292)))
(let ((e313 (not e65)))
(let ((e314 (=> e159 e176)))
(let ((e315 (xor e170 e289)))
(let ((e316 (=> e126 e291)))
(let ((e317 (xor e212 e282)))
(let ((e318 (or e219 e298)))
(let ((e319 (or e204 e209)))
(let ((e320 (ite e318 e299 e157)))
(let ((e321 (and e113 e301)))
(let ((e322 (=> e240 e313)))
(let ((e323 (xor e288 e214)))
(let ((e324 (ite e103 e168 e199)))
(let ((e325 (= e179 e208)))
(let ((e326 (or e211 e34)))
(let ((e327 (=> e35 e205)))
(let ((e328 (xor e279 e39)))
(let ((e329 (xor e248 e315)))
(let ((e330 (or e263 e89)))
(let ((e331 (xor e202 e320)))
(let ((e332 (=> e265 e259)))
(let ((e333 (ite e293 e260 e90)))
(let ((e334 (ite e317 e25 e106)))
(let ((e335 (=> e252 e160)))
(let ((e336 (xor e224 e308)))
(let ((e337 (=> e198 e130)))
(let ((e338 (xor e221 e200)))
(let ((e339 (not e13)))
(let ((e340 (or e97 e249)))
(let ((e341 (= e17 e328)))
(let ((e342 (or e296 e213)))
(let ((e343 (not e138)))
(let ((e344 (not e67)))
(let ((e345 (xor e203 e256)))
(let ((e346 (xor e316 e119)))
(let ((e347 (not e109)))
(let ((e348 (and e183 e281)))
(let ((e349 (= e86 e91)))
(let ((e350 (xor e268 e192)))
(let ((e351 (= e311 e190)))
(let ((e352 (or e326 e99)))
(let ((e353 (not e343)))
(let ((e354 (xor e195 e20)))
(let ((e355 (and e305 e336)))
(let ((e356 (not e319)))
(let ((e357 (=> e133 e312)))
(let ((e358 (xor e284 e62)))
(let ((e359 (= e345 e303)))
(let ((e360 (and e197 e297)))
(let ((e361 (=> e69 e255)))
(let ((e362 (and e253 e337)))
(let ((e363 (or e354 e287)))
(let ((e364 (ite e258 e355 e350)))
(let ((e365 (or e254 e32)))
(let ((e366 (or e63 e228)))
(let ((e367 (not e342)))
(let ((e368 (=> e172 e272)))
(let ((e369 (= e344 e12)))
(let ((e370 (or e361 e357)))
(let ((e371 (not e362)))
(let ((e372 (or e262 e333)))
(let ((e373 (=> e220 e38)))
(let ((e374 (= e118 e351)))
(let ((e375 (ite e365 e369 e140)))
(let ((e376 (xor e111 e346)))
(let ((e377 (not e77)))
(let ((e378 (=> e324 e356)))
(let ((e379 (not e188)))
(let ((e380 (= e364 e376)))
(let ((e381 (and e300 e132)))
(let ((e382 (=> e334 e304)))
(let ((e383 (=> e60 e335)))
(let ((e384 (or e366 e379)))
(let ((e385 (or e273 e79)))
(let ((e386 (not e374)))
(let ((e387 (ite e314 e145 e323)))
(let ((e388 (ite e382 e341 e264)))
(let ((e389 (ite e71 e358 e71)))
(let ((e390 (=> e360 e340)))
(let ((e391 (= e31 e359)))
(let ((e392 (and e189 e329)))
(let ((e393 (not e373)))
(let ((e394 (and e367 e116)))
(let ((e395 (=> e327 e363)))
(let ((e396 (or e394 e166)))
(let ((e397 (=> e396 e371)))
(let ((e398 (= e178 e347)))
(let ((e399 (= e70 e151)))
(let ((e400 (or e148 e215)))
(let ((e401 (= e330 e399)))
(let ((e402 (not e68)))
(let ((e403 (or e306 e390)))
(let ((e404 (or e310 e84)))
(let ((e405 (xor e401 e392)))
(let ((e406 (= e75 e375)))
(let ((e407 (xor e309 e372)))
(let ((e408 (and e352 e321)))
(let ((e409 (= e384 e406)))
(let ((e410 (= e404 e400)))
(let ((e411 (xor e331 e226)))
(let ((e412 (and e410 e348)))
(let ((e413 (=> e147 e393)))
(let ((e414 (=> e387 e236)))
(let ((e415 (= e388 e26)))
(let ((e416 (and e395 e412)))
(let ((e417 (= e415 e413)))
(let ((e418 (or e85 e397)))
(let ((e419 (not e380)))
(let ((e420 (=> e378 e325)))
(let ((e421 (ite e408 e419 e420)))
(let ((e422 (ite e417 e83 e377)))
(let ((e423 (not e187)))
(let ((e424 (or e421 e332)))
(let ((e425 (= e368 e403)))
(let ((e426 (and e381 e407)))
(let ((e427 (ite e370 e386 e167)))
(let ((e428 (and e424 e427)))
(let ((e429 (and e349 e322)))
(let ((e430 (ite e428 e243 e338)))
(let ((e431 (ite e405 e402 e383)))
(let ((e432 (not e431)))
(let ((e433 (=> e398 e414)))
(let ((e434 (ite e339 e418 e423)))
(let ((e435 (not e426)))
(let ((e436 (xor e353 e430)))
(let ((e437 (ite e389 e185 e432)))
(let ((e438 (not e422)))
(let ((e439 (= e416 e434)))
(let ((e440 (ite e391 e436 e391)))
(let ((e441 (= e440 e429)))
(let ((e442 (or e439 e425)))
(let ((e443 (xor e441 e411)))
(let ((e444 (and e385 e433)))
(let ((e445 (not e437)))
(let ((e446 (xor e443 e443)))
(let ((e447 (xor e438 e442)))
(let ((e448 (or e445 e409)))
(let ((e449 (= e446 e435)))
(let ((e450 (and e449 e444)))
(let ((e451 (or e448 e447)))
(let ((e452 (and e450 e451)))
e452
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(check-sat)
(set-option :regular-output-channel "/dev/null")
(get-model)
