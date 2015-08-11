(set-logic LRA)
(set-info :source |
These benchmarks used in the paper:

  Dejan Jovanovic and Leonardo de Moura.  Solving Non-Linear Arithmetic.
  In IJCAR 2012, published as LNCS volume 7364, pp. 339--354.

The keymaera family contains VCs from Keymaera verification, see:

  A. Platzer, J.-D. Quesel, and P. Rummer.  Real world verification.
  In CADE 2009, pages 485-501. Springer, 2009.

Submitted by Dejan Jovanovic for SMT-LIB.

 KeYmaera example: water_tank, node 31000 For more info see: No further information available.
|)
(set-info :smt-lib-version 2.0)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun xuscore2dollarskuscore70 () Real)
(declare-fun t36uscore0dollarskuscore0 () Real)
(declare-fun yuscore2dollarskuscore80 () Real)
(declare-fun ts36uscore0 () Real)
(declare-fun stuscore2dollarskuscore80 () Real)
(assert (not (exists ((ts36uscore0 Real)) (=> (and (and (and (and (and (and (and (=> (and (<= 0 ts36uscore0) (<= ts36uscore0 t36uscore0dollarskuscore0)) (<= (+ ts36uscore0 xuscore2dollarskuscore70) 2)) (>= t36uscore0dollarskuscore0 0)) (> xuscore2dollarskuscore70 2)) (= stuscore2dollarskuscore80 1)) (>= yuscore2dollarskuscore80 1)) (<= yuscore2dollarskuscore80 12)) (>= yuscore2dollarskuscore80 (- 5 (* 2 xuscore2dollarskuscore70)))) (<= yuscore2dollarskuscore80 (+ 10 xuscore2dollarskuscore70))) (>= (+ t36uscore0dollarskuscore0 yuscore2dollarskuscore80) 1)))))
(check-sat)
(exit)
