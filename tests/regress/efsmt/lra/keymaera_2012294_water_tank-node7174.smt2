(set-logic LRA)
(set-info :source |
These benchmarks used in the paper:

  Dejan Jovanovic and Leonardo de Moura.  Solving Non-Linear Arithmetic.
  In IJCAR 2012, published as LNCS volume 7364, pp. 339--354.

The keymaera family contains VCs from Keymaera verification, see:

  A. Platzer, J.-D. Quesel, and P. Rummer.  Real world verification.
  In CADE 2009, pages 485-501. Springer, 2009.

Submitted by Dejan Jovanovic for SMT-LIB.

 KeYmaera example: water_tank, node 7174 For more info see: No further information available.
|)
(set-info :smt-lib-version 2.0)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun ts3uscore1 () Real)
(declare-fun yuscore2dollarskuscore5 () Real)
(declare-fun t3uscore0dollarskuscore1 () Real)
(declare-fun stuscore2dollarskuscore5 () Real)
(assert (not (exists ((ts3uscore1 Real)) (=> (and (and (and (and (and (=> (and (<= 0 ts3uscore1) (<= ts3uscore1 t3uscore0dollarskuscore1)) (>= (+ (* (- 2) ts3uscore1) yuscore2dollarskuscore5) 5)) (>= t3uscore0dollarskuscore1 0)) (> yuscore2dollarskuscore5 5)) (= stuscore2dollarskuscore5 2)) (>= yuscore2dollarskuscore5 1)) (<= yuscore2dollarskuscore5 12)) (or (or (= stuscore2dollarskuscore5 1) (= stuscore2dollarskuscore5 3)) (<= (+ (* (- 2) t3uscore0dollarskuscore1) yuscore2dollarskuscore5) 12))))))
(check-sat)
(exit)
