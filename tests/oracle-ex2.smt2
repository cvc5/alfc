(declare-sort Int 0)
(declare-consts <numeral> Int)
(declare-sort String 0)
(declare-consts <string> String)
(declare-const or (-> Bool Bool Bool) :right-assoc-nil false)
(declare-const and (-> Bool Bool Bool) :right-assoc-nil true)
(declare-const not (-> Bool Bool))

(program to_drat_lit ((l Bool))
  (Bool) Int
  (
    ((to_drat_lit (not l))  (alf.neg (alf.hash l)))
    ((to_drat_lit l)        (alf.hash l))
  )
)
(program to_drat_clause ((l Bool) (C Bool :list))
  (Bool) String
  (
    ((to_drat_clause false)    "0")
    ((to_drat_clause (or l C)) (alf.concat (alf.to_str (to_drat_lit l)) (alf.concat " " (to_drat_clause C))))
    ((to_drat_clause l)        (alf.concat (alf.to_str (to_drat_lit l)) " 0"))
  )
)

(program to_drat_input ((C Bool) (F Bool :list))
  (Bool) String
  (
    ((to_drat_input true)       "")
    ((to_drat_input (and C F)) (alf.concat (to_drat_clause C) (alf.concat " " (to_drat_input F))))
  )
)

; ./dratt-verify.sh takes:
; - A DRAT input specification given by:
;   - A mapping (@AtomMapping) that maps atoms to unique identifiers.
;   - A conjunction of input clauses.
; - A DRAT proof file, whose file name is given as a String.
; It returns "true" if the preamble of the DRAT proof file matches
; the input clauses, as determined by the first two arguments.

(declare-oracle-fun dratt-verify (String String) Bool ./dratt-verify.sh)

; ./drat-check.sh
; - A DRAT proof file, whose file name is given as a String.
; It returns "true" if the DRAT proof file is a valid refutation proof.

(declare-oracle-fun drat-check (String) Bool ./drat-check.sh)

; The DRAT proof rule.
; Takes arbitrary list of premises, an atom mapping, and the file name of a DRAT
; proof and invokes the two oracles above.

(declare-rule drat ((F Bool) (P String))
  :premise-list F and
  :args (P)
  :requires (((dratt-verify (to_drat_input F) P) true) ((drat-check P) true))
  :conclusion false
)

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

(assume @p1 (or A B C))
(assume @p2 (not A))
(assume @p3 (not B))
(assume @p4 (or B (not C)))

;(step @p5 false :rule drat :premises (@p1 @p2 @p3 @p4) :args ("drat-proof.txt"))
