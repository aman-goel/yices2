(set-option :print-success false)
(set-logic QF_UF)
; benchmark generated from python API
(set-info :status unknown)
(declare-sort I 0)
 (declare-fun e5 () I)
(declare-fun op (I I) I)
(declare-fun e4 () I)
(declare-fun e3 () I)
(declare-fun e0 () I)
(declare-fun e1 () I)
(declare-fun e2 () I)
(assert
 (let ((?x8896 (op e4 e4)))
 (let (($x1054 (= ?x8896 e5)))
 (let (($x6849 (not $x1054)))
 (let ((?x8924 (op e0 e3)))
 (let (($x1589 (= ?x8924 e5)))
 (let (($x4917 (not $x1589)))
 (and $x4917 $x6849))))))))
(assert
 (let ((?x14957 (op e1 e5)))
 (let ((?x8746 (op e5 e1)))
 (let (($x19384 (= ?x8746 ?x14957)))
 (let (($x8752 (not (= (op e1 ?x14957) e5))))
 (let (($x10310 (or $x8752 $x19384)))
 (let (($x4872 (not (= (op e0 e0) (op e4 e0)))))
 (and $x4872 $x10310))))))))
(assert
 (let (($x6907 (not (= (op (op e4 e5) (op e4 e5)) e5))))
 (let (($x5209 (not (= (op (op e4 e4) (op e4 e4)) e4))))
 (let (($x4165 (not (= (op (op e4 e3) (op e4 e3)) e3))))
 (let (($x2711 (not (= (op (op e4 e2) (op e4 e2)) e2))))
 (let (($x5360 (not (= (op (op e4 e1) (op e4 e1)) e1))))
 (let (($x3773 (not (= (op (op e4 e0) (op e4 e0)) e0))))
 (let (($x4815 (and $x3773 $x5360)))
 (let (($x7469 (and $x4815 $x2711)))
 (let (($x9822 (and $x7469 $x4165)))
 (let (($x9104 (and $x9822 $x5209)))
 (let (($x2025 (and $x9104 $x6907)))
 (let (($x1547 (not $x2025)))
 (let ((?x8888 (op e5 e4)))
 (let (($x6515 (= ?x8888 e0)))
 (let ((?x8746 (op e5 e1)))
 (let (($x15193 (= ?x8746 e3)))
 (let (($x2658 (not $x15193)))
 (let ((?x8770 (op e1 e3)))
 (let (($x15541 (= ?x8770 e5)))
 (let (($x8404 (or $x15541 $x2658)))
 (let (($x4458 (and $x8404 $x6515)))
 (let (($x5063 (and $x4458 $x1547)))
 (not $x5063))))))))))))))))))))))))
(assert
 (let (($x3805 (= (op (op e4 e1) e4) e1)))
 (not $x3805)))
(assert
 (let ((?x2352 (op e5 e2)))
 (let (($x15341 (= ?x2352 e0)))
 (not $x15341))))
(assert
 (let ((?x8794 (op e2 e1)))
 (let (($x1287 (= ?x8794 e5)))
 (let (($x3117 (not (= (op e1 (op e5 e1)) e5))))
 (let (($x2588 (and $x3117 $x1287)))
 (not $x2588))))))
(assert
 (let ((?x8737 (op e2 e2)))
 (let (($x5528 (= e3 ?x8737)))
 (let ((?x2402 (op e4 e3)))
 (let (($x7218 (= e1 ?x2402)))
 (let ((?x14986 (op e2 e3)))
 (let (($x8632 (= e4 ?x14986)))
 (let (($x5704 (and (and (and (= e0 (op e1 e4)) (= e5 (op e1 e3))) $x8632) $x7218)))
 (let (($x15097 (not (and $x5704 $x5528))))
 (let ((?x8816 (op e5 e0)))
 (let (($x6173 (= ?x8816 e2)))
 (let (($x4664 (not $x6173)))
 (let ((?x9781 (op e0 e2)))
 (let (($x14829 (= ?x9781 e5)))
 (let (($x4974 (or $x14829 $x4664)))
 (let ((?x14972 (op e0 e5)))
 (let (($x1209 (= ?x14972 e2)))
 (let (($x3742 (not $x1209)))
 (let (($x6800 (or $x3742 $x4974)))
 (let ((?x8802 (op e4 e0)))
 (let (($x5158 (= ?x8802 e2)))
 (let (($x5123 (not $x5158)))
 (let (($x8727 (= ?x9781 e4)))
 (let (($x10439 (or $x8727 $x5123)))
 (let ((?x8902 (op e0 e4)))
 (let (($x6122 (= ?x8902 e2)))
 (let (($x5563 (not $x6122)))
 (let (($x5937 (or $x5563 $x10439)))
 (let ((?x15003 (op e3 e0)))
 (let (($x1082 (= ?x15003 e2)))
 (let (($x4028 (not $x1082)))
 (let (($x8730 (= ?x9781 e3)))
 (let (($x5196 (or $x8730 $x4028)))
 (let ((?x8924 (op e0 e3)))
 (let (($x9852 (= ?x8924 e2)))
 (let (($x6191 (not $x9852)))
 (let (($x7453 (or $x6191 $x5196)))
 (let ((?x14961 (op e2 e0)))
 (let (($x1423 (= ?x14961 e2)))
 (let (($x1759 (not $x1423)))
 (let (($x8735 (= ?x9781 e2)))
 (let (($x10515 (or $x8735 $x1759)))
 (let (($x5939 (not $x8735)))
 (let (($x3020 (or $x5939 $x10515)))
 (let ((?x8894 (op e1 e0)))
 (let (($x15587 (= ?x8894 e2)))
 (let (($x6865 (not $x15587)))
 (let (($x14937 (= ?x9781 e1)))
 (let (($x10026 (or $x14937 $x6865)))
 (let ((?x8883 (op e0 e1)))
 (let (($x8772 (= ?x8883 e2)))
 (let (($x3962 (not $x8772)))
 (let (($x6472 (or $x3962 $x10026)))
 (let ((?x8836 (op e0 e0)))
 (let (($x8823 (= ?x8836 e2)))
 (let (($x4089 (not $x8823)))
 (let (($x8906 (= ?x9781 e0)))
 (let (($x3075 (or $x8906 $x4089)))
 (let (($x5814 (or $x4089 $x3075)))
 (let (($x8674 (and $x5814 $x6472)))
 (let (($x4354 (and $x8674 $x3020)))
 (let (($x8390 (and $x4354 $x7453)))
 (let (($x1511 (and $x8390 $x5937)))
 (let (($x8624 (and $x1511 $x6800)))
 (and $x8624 $x15097)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let ((?x8802 (op e4 e0)))
 (let (($x6801 (= ?x8802 e0)))
 (let (($x3084 (not $x6801)))
 (let ((?x8836 (op e0 e0)))
 (let (($x8754 (= ?x8836 e4)))
 (let (($x2177 (or $x8754 $x3084)))
 (let ((?x8902 (op e0 e4)))
 (let (($x14833 (= ?x8902 e0)))
 (let (($x9072 (not $x14833)))
 (or $x9072 $x2177)))))))))))
(assert
 (let ((?x15003 (op e3 e0)))
 (let (($x1094 (= ?x15003 e3)))
 (let (($x5016 (not $x1094)))
 (let ((?x8924 (op e0 e3)))
 (let (($x9858 (= ?x8924 e3)))
 (let (($x10183 (and $x9858 $x5016)))
 (not $x10183))))))))
(assert
 (let ((?x8888 (op e5 e4)))
 (let (($x4242 (= ?x8888 e3)))
 (not $x4242))))
(assert
 (let ((?x2337 (op e4 e5)))
 (let (($x9589 (= ?x2337 e0)))
 (not $x9589))))
(assert
 (let ((?x8891 (op e1 e2)))
 (let (($x15534 (= ?x8891 e4)))
 (not $x15534))))
(assert
 (let ((?x8894 (op e1 e0)))
 (let (($x3821 (= ?x8894 e1)))
 (let ((?x9781 (op e0 e2)))
 (let (($x8727 (= ?x9781 e4)))
 (let (($x4169 (not $x8727)))
 (and $x4169 $x3821)))))))
(assert
 (let ((?x14976 (op e3 e3)))
 (let (($x1558 (= e2 ?x14976)))
 (let ((?x14984 (op e4 e2)))
 (let (($x10492 (= e1 ?x14984)))
 (let ((?x14945 (op e3 e2)))
 (let (($x3591 (= e4 ?x14945)))
 (let (($x9348 (and (and (and (= e0 (op e1 e4)) (= e5 (op e1 e2))) $x3591) $x10492)))
 (let (($x5789 (not (and $x9348 $x1558))))
 (let ((?x14939 (op e5 e5)))
 (let (($x14970 (= ?x14939 e2)))
 (let ((?x2337 (op e4 e5)))
 (let (($x5764 (= ?x2337 e2)))
 (let ((?x8742 (op e3 e5)))
 (let (($x7187 (= ?x8742 e2)))
 (let ((?x8779 (op e2 e5)))
 (let (($x1389 (= ?x8779 e2)))
 (let ((?x14957 (op e1 e5)))
 (let (($x15600 (= ?x14957 e2)))
 (let ((?x14972 (op e0 e5)))
 (let (($x1209 (= ?x14972 e2)))
 (let (($x19441 (or $x1209 $x15600)))
 (let (($x19442 (or $x19441 $x1389)))
 (let (($x19443 (or $x19442 $x7187)))
 (let (($x19444 (or $x19443 $x5764)))
 (let (($x19445 (or $x19444 $x14970)))
 (let ((?x8888 (op e5 e4)))
 (let (($x14880 (= ?x8888 e2)))
 (let ((?x8765 (op e5 e3)))
 (let (($x15331 (= ?x8765 e2)))
 (let ((?x2352 (op e5 e2)))
 (let (($x9003 (= ?x2352 e2)))
 (let ((?x8746 (op e5 e1)))
 (let (($x4662 (= ?x8746 e2)))
 (let ((?x8816 (op e5 e0)))
 (let (($x6173 (= ?x8816 e2)))
 (let (($x19436 (or $x6173 $x4662)))
 (let (($x19437 (or $x19436 $x9003)))
 (let (($x19438 (or $x19437 $x15331)))
 (let (($x19439 (or $x19438 $x14880)))
 (let (($x19440 (or $x19439 $x14970)))
 (let (($x19446 (and $x19440 $x19445)))
 (let (($x8539 (= ?x14939 e1)))
 (let (($x15189 (= ?x2337 e1)))
 (let (($x8582 (= ?x8742 e1)))
 (let (($x1427 (= ?x8779 e1)))
 (let (($x15594 (= ?x14957 e1)))
 (let (($x15510 (= ?x14972 e1)))
 (let (($x19429 (or $x15510 $x15594)))
 (let (($x19430 (or $x19429 $x1427)))
 (let (($x19431 (or $x19430 $x8582)))
 (let (($x19432 (or $x19431 $x15189)))
 (let (($x19433 (or $x19432 $x8539)))
 (let (($x8625 (= ?x8888 e1)))
 (let (($x6736 (= ?x8765 e1)))
 (let (($x3265 (= ?x2352 e1)))
 (let (($x1334 (= ?x8746 e1)))
 (let (($x6261 (= ?x8816 e1)))
 (let (($x19424 (or $x6261 $x1334)))
 (let (($x19425 (or $x19424 $x3265)))
 (let (($x19426 (or $x19425 $x6736)))
 (let (($x19427 (or $x19426 $x8625)))
 (let (($x19428 (or $x19427 $x8539)))
 (let (($x19434 (and $x19428 $x19433)))
 (let (($x5454 (= ?x14939 e0)))
 (let (($x9589 (= ?x2337 e0)))
 (let (($x15350 (= ?x8742 e0)))
 (let (($x2183 (= ?x8779 e0)))
 (let (($x15593 (= ?x14957 e0)))
 (let (($x15509 (= ?x14972 e0)))
 (let (($x19418 (or $x15509 $x15593)))
 (let (($x19419 (or $x19418 $x2183)))
 (let (($x19420 (or $x19419 $x15350)))
 (let (($x19421 (or $x19420 $x9589)))
 (let (($x19422 (or $x19421 $x5454)))
 (let (($x6515 (= ?x8888 e0)))
 (let (($x3247 (= ?x8765 e0)))
 (let (($x15341 (= ?x2352 e0)))
 (let (($x1682 (= ?x8746 e0)))
 (let (($x9747 (= ?x8816 e0)))
 (let (($x19413 (or $x9747 $x1682)))
 (let (($x19414 (or $x19413 $x15341)))
 (let (($x19415 (or $x19414 $x3247)))
 (let (($x19416 (or $x19415 $x6515)))
 (let (($x19417 (or $x19416 $x5454)))
 (let (($x19423 (and $x19417 $x19422)))
 (let (($x19435 (and $x19423 $x19434)))
 (let (($x19447 (and $x19435 $x19446)))
 (let (($x3996 (and $x19447 $x5789)))
 (not $x3996))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let ((?x8794 (op e2 e1)))
 (let (($x1314 (= ?x8794 e4)))
 (not $x1314))))
(assert
 (let (($x7816 (not (= (op e1 e2) (op e1 e3)))))
 (let (($x7815 (not (= (op e1 e1) (op e1 e5)))))
 (let (($x7813 (not (= (op e1 e1) (op e1 e4)))))
 (let (($x5999 (not (= (op e1 e1) (op e1 e3)))))
 (let (($x5800 (not (= (op e1 e1) (op e1 e2)))))
 (let (($x4887 (not (= (op e1 e0) (op e1 e5)))))
 (let (($x9628 (not (= (op e1 e0) (op e1 e4)))))
 (let (($x6152 (not (= (op e1 e0) (op e1 e3)))))
 (let (($x15091 (not (= (op e1 e0) (op e1 e2)))))
 (let (($x9606 (not (= (op e1 e0) (op e1 e1)))))
 (let (($x7809 (and $x9606 $x15091)))
 (let (($x3074 (and $x7809 $x6152)))
 (let (($x7810 (and $x3074 $x9628)))
 (let (($x7811 (and $x7810 $x4887)))
 (let (($x1856 (and $x7811 $x5800)))
 (let (($x7812 (and $x1856 $x5999)))
 (let (($x7814 (and $x7812 $x7813)))
 (let (($x2133 (and $x7814 $x7815)))
 (let (($x4950 (and $x2133 $x7816)))
 (let ((?x8883 (op e0 e1)))
 (let (($x8750 (= ?x8883 e1)))
 (let (($x7647 (and $x8750 $x4950)))
 (not $x7647))))))))))))))))))))))))
(assert
 (let ((?x8816 (op e5 e0)))
 (let (($x9435 (= ?x8816 e3)))
 (let ((?x8802 (op e4 e0)))
 (let (($x5247 (= ?x8802 e3)))
 (let ((?x15003 (op e3 e0)))
 (let (($x1094 (= ?x15003 e3)))
 (let ((?x14961 (op e2 e0)))
 (let (($x1431 (= ?x14961 e3)))
 (let ((?x8894 (op e1 e0)))
 (let (($x15585 (= ?x8894 e3)))
 (let ((?x8836 (op e0 e0)))
 (let (($x14946 (= ?x8836 e3)))
 (let (($x9579 (or $x14946 $x15585)))
 (let (($x9530 (or $x9579 $x1431)))
 (let (($x5916 (or $x9530 $x1094)))
 (let (($x15372 (or $x5916 $x5247)))
 (let (($x4156 (or $x15372 $x9435)))
 (let ((?x14972 (op e0 e5)))
 (let (($x1198 (= ?x14972 e3)))
 (let ((?x8902 (op e0 e4)))
 (let (($x15497 (= ?x8902 e3)))
 (let ((?x8924 (op e0 e3)))
 (let (($x9858 (= ?x8924 e3)))
 (let ((?x9781 (op e0 e2)))
 (let (($x8730 (= ?x9781 e3)))
 (let ((?x8883 (op e0 e1)))
 (let (($x14974 (= ?x8883 e3)))
 (let (($x15327 (or $x14946 $x14974)))
 (let (($x4977 (or $x15327 $x8730)))
 (let (($x15311 (or $x4977 $x9858)))
 (let (($x8909 (or $x15311 $x15497)))
 (let (($x1085 (or $x8909 $x1198)))
 (let (($x5215 (and $x1085 $x4156)))
 (let ((?x14957 (op e1 e5)))
 (let (($x1397 (= ?x14957 e5)))
 (let (($x1259 (= ?x14957 e4)))
 (let (($x1403 (= ?x14957 e3)))
 (let (($x15600 (= ?x14957 e2)))
 (let (($x15594 (= ?x14957 e1)))
 (let (($x15593 (= ?x14957 e0)))
 (let (($x15598 (or $x15593 $x15594)))
 (let (($x5793 (or $x15598 $x15600)))
 (let (($x7150 (or $x5793 $x1403)))
 (let (($x1399 (or $x7150 $x1259)))
 (let (($x5981 (or $x1399 $x1397)))
 (let (($x8406 (and $x5981 $x5215)))
 (not $x8406))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let ((?x8779 (op e2 e5)))
 (let (($x2183 (= ?x8779 e0)))
 (let (($x1698 (not $x2183)))
 (let ((?x8816 (op e5 e0)))
 (let (($x6173 (= ?x8816 e2)))
 (let (($x6675 (and $x6173 $x1698)))
 (let ((?x2402 (op e4 e3)))
 (let (($x5335 (= ?x2402 e3)))
 (let (($x9376 (not $x5335)))
 (let (($x6089 (not $x9376)))
 (let (($x6468 (and $x6089 $x6675)))
 (not $x6468)))))))))))))
(assert
 (let ((?x14945 (op e3 e2)))
 (let ((?x14986 (op e2 e3)))
 (let (($x19359 (= ?x14986 ?x14945)))
 (let (($x19358 (not $x19359)))
 (let ((?x8899 (op e3 e1)))
 (let ((?x8770 (op e1 e3)))
 (let (($x19362 (= ?x8770 ?x8899)))
 (let (($x19361 (not $x19362)))
 (let ((?x15003 (op e3 e0)))
 (let ((?x8924 (op e0 e3)))
 (let (($x19364 (= ?x8924 ?x15003)))
 (let (($x19363 (not $x19364)))
 (let (($x19360 (or $x19363 $x19361)))
 (let (($x19357 (or $x19360 $x19358)))
 (let (($x9073 (not $x19357)))
 (not $x9073)))))))))))))))))
(assert
 (let ((?x2352 (op e5 e2)))
 (let (($x9003 (= ?x2352 e2)))
 (not $x9003))))
(assert
 (let ((?x8883 (op e0 e1)))
 (let (($x15004 (= ?x8883 e5)))
 (let (($x4224 (not $x15004)))
 (let ((?x14957 (op e1 e5)))
 (let (($x15593 (= ?x14957 e0)))
 (let (($x3192 (and $x15593 $x4224)))
 (let (($x8762 (= ?x8883 e4)))
 (let (($x15473 (not $x8762)))
 (let ((?x2464 (op e1 e4)))
 (let (($x15552 (= ?x2464 e0)))
 (let (($x10287 (and $x15552 $x15473)))
 (let (($x14974 (= ?x8883 e3)))
 (let (($x1782 (not $x14974)))
 (let ((?x8770 (op e1 e3)))
 (let (($x15521 (= ?x8770 e0)))
 (let (($x2295 (and $x15521 $x1782)))
 (let (($x8772 (= ?x8883 e2)))
 (let (($x3962 (not $x8772)))
 (let ((?x8891 (op e1 e2)))
 (let (($x15544 (= ?x8891 e0)))
 (let (($x10156 (and $x15544 $x3962)))
 (let (($x8750 (= ?x8883 e1)))
 (let (($x2005 (not $x8750)))
 (let ((?x14998 (op e1 e1)))
 (let (($x3739 (= ?x14998 e0)))
 (let (($x15500 (and $x3739 $x2005)))
 (let (($x14983 (= ?x8883 e0)))
 (let (($x3300 (not $x14983)))
 (let ((?x8894 (op e1 e0)))
 (let (($x15543 (= ?x8894 e0)))
 (let (($x1833 (and $x15543 $x3300)))
 (let (($x1849 (or $x1833 $x15500)))
 (let (($x9786 (or $x1849 $x10156)))
 (let (($x6721 (or $x9786 $x2295)))
 (let (($x15085 (or $x6721 $x10287)))
 (let (($x2799 (or $x15085 $x3192)))
 (let ((?x14979 (op e3 e4)))
 (let (($x14790 (= ?x14979 e5)))
 (let (($x4581 (not $x14790)))
 (let ((?x2337 (op e4 e5)))
 (let (($x15332 (= ?x2337 e3)))
 (let (($x2929 (or $x15332 $x4581)))
 (let ((?x2402 (op e4 e3)))
 (let (($x8501 (= ?x2402 e5)))
 (let (($x6724 (not $x8501)))
 (let (($x10473 (or $x6724 $x2929)))
 (let (($x4870 (and $x10473 $x2799)))
 (not $x4870)))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let ((?x8888 (op e5 e4)))
 (let (($x4242 (= ?x8888 e3)))
 (let ((?x14976 (op e3 e3)))
 (let (($x19252 (= ?x14976 e4)))
 (let (($x5630 (not $x19252)))
 (let ((?x14979 (op e3 e4)))
 (let (($x5371 (= ?x14979 e3)))
 (let (($x2989 (or $x5371 $x5630)))
 (let (($x2380 (or $x5630 $x2989)))
 (let (($x6530 (and $x2380 $x4242)))
 (not $x6530))))))))))))
(assert
 (let ((?x8802 (op e4 e0)))
 (let (($x6801 (= ?x8802 e0)))
 (not $x6801))))
(assert
 (let ((?x2352 (op e5 e2)))
 (let (($x3265 (= ?x2352 e1)))
 (let (($x9934 (not $x3265)))
 (let ((?x8794 (op e2 e1)))
 (let (($x1287 (= ?x8794 e5)))
 (let (($x2846 (or $x1287 $x9934)))
 (let (($x9494 (not (= (op e5 (op e5 e4)) e4))))
 (let (($x8827 (and $x9494 $x2846)))
 (not $x8827))))))))))
(assert
 (let ((?x14976 (op e3 e3)))
 (let (($x19247 (= ?x14976 e5)))
 (let (($x4811 (not $x19247)))
 (let (($x3626 (not $x4811)))
 (not $x3626))))))
(assert
 (let ((?x8896 (op e4 e4)))
 (= ?x8896 e3)))
(assert
 (let ((?x2337 (op e4 e5)))
 (let (($x9589 (= ?x2337 e0)))
 (not $x9589))))
(assert
 (let (($x1180 (not (= (op e2 (op e2 e4)) e4))))
 (let (($x10037 (not (= (op (op e5 e1) (op e5 e1)) e5))))
 (let (($x6768 (not (= (op (op e4 e1) (op e4 e1)) e4))))
 (let (($x8834 (not (= (op (op e3 e1) (op e3 e1)) e3))))
 (let (($x4772 (not (= (op (op e2 e1) (op e2 e1)) e2))))
 (let (($x4472 (not (= (op (op e1 e1) (op e1 e1)) e1))))
 (let (($x1050 (not (= (op (op e0 e1) (op e0 e1)) e0))))
 (let (($x2158 (and $x1050 $x4472)))
 (let (($x2136 (and $x2158 $x4772)))
 (let (($x10436 (and $x2136 $x8834)))
 (let (($x10293 (and $x10436 $x6768)))
 (let (($x5651 (and $x10293 $x10037)))
 (let (($x1190 (and $x5651 $x1180)))
 (not $x1190)))))))))))))))
(assert
 (let ((?x2337 (op e4 e5)))
 (let (($x15189 (= ?x2337 e1)))
 (let (($x15401 (not $x15189)))
 (let ((?x8746 (op e5 e1)))
 (let (($x15188 (= ?x8746 e4)))
 (let (($x1149 (or $x15188 $x15401)))
 (let ((?x8888 (op e5 e4)))
 (let (($x8625 (= ?x8888 e1)))
 (let (($x9815 (not $x8625)))
 (let (($x3045 (or $x9815 $x1149)))
 (let ((?x8742 (op e3 e5)))
 (let (($x8582 (= ?x8742 e1)))
 (let (($x3379 (not $x8582)))
 (let (($x15193 (= ?x8746 e3)))
 (let (($x10297 (or $x15193 $x3379)))
 (let ((?x8765 (op e5 e3)))
 (let (($x6736 (= ?x8765 e1)))
 (let (($x4210 (not $x6736)))
 (let (($x1446 (or $x4210 $x10297)))
 (let ((?x8779 (op e2 e5)))
 (let (($x1427 (= ?x8779 e1)))
 (let (($x15386 (not $x1427)))
 (let (($x4662 (= ?x8746 e2)))
 (let (($x5888 (or $x4662 $x15386)))
 (let ((?x2352 (op e5 e2)))
 (let (($x3265 (= ?x2352 e1)))
 (let (($x9934 (not $x3265)))
 (let (($x10061 (or $x9934 $x5888)))
 (let ((?x14957 (op e1 e5)))
 (let (($x15594 (= ?x14957 e1)))
 (let (($x9011 (not $x15594)))
 (let (($x1334 (= ?x8746 e1)))
 (let (($x7487 (or $x1334 $x9011)))
 (let (($x961 (not $x1334)))
 (let (($x3080 (or $x961 $x7487)))
 (let ((?x14972 (op e0 e5)))
 (let (($x15510 (= ?x14972 e1)))
 (let (($x3069 (not $x15510)))
 (let (($x1682 (= ?x8746 e0)))
 (let (($x9686 (or $x1682 $x3069)))
 (let ((?x8816 (op e5 e0)))
 (let (($x6261 (= ?x8816 e1)))
 (let (($x5562 (not $x6261)))
 (let (($x1371 (or $x5562 $x9686)))
 (let (($x10060 (and $x1371 $x3080)))
 (let (($x1037 (and $x10060 $x10061)))
 (let (($x1551 (and $x1037 $x1446)))
 (let (($x2327 (and $x1551 $x3045)))
 (let (($x3355 (not $x2327)))
 (not $x3355)))))))))))))))))))))))))))))))))))))))))))))))))))
(assert
 (let (($x1830 (= (op e0 (op e1 e0)) e1)))
 (let (($x6207 (not $x1830)))
 (let (($x5099 (not $x6207)))
 (not $x5099)))))
(assert
 (let (($x7889 (not (= e1 e4))))
 (let (($x7887 (not (= e1 e3))))
 (let (($x7886 (not (= e1 e2))))
 (let (($x7885 (not (= e0 e5))))
 (let (($x7884 (not (= e0 e4))))
 (let (($x7883 (not (= e0 e3))))
 (let (($x7882 (not (= e0 e2))))
 (let (($x7881 (not (= e0 e1))))
 (let (($x9082 (and $x7881 $x7882)))
 (let (($x5232 (and $x9082 $x7883)))
 (let (($x5419 (and $x5232 $x7884)))
 (let (($x2286 (and $x5419 $x7885)))
 (let (($x3255 (and $x2286 $x7886)))
 (let (($x5054 (and $x3255 $x7887)))
 (let (($x2106 (and $x5054 $x7889)))
 (let (($x6427 (not $x2106)))
 (not $x6427))))))))))))))))))
(assert
 (let ((?x8894 (op e1 e0)))
 (let (($x3821 (= ?x8894 e1)))
 (let (($x2907 (not $x3821)))
 (let ((?x8883 (op e0 e1)))
 (let (($x8750 (= ?x8883 e1)))
 (let (($x6506 (or $x8750 $x2907)))
 (let (($x2005 (not $x8750)))
 (let (($x9998 (or $x2005 $x6506)))
 (let (($x6741 (not $x9998)))
 (not $x6741)))))))))))
(check-sat)