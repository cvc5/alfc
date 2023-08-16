(declare-sort Int 0)
(declare-consts <numeral> Int)

(declare-const = (-> (! Type :var T :implicit) T T Bool))

(declare-const BitVec 
  (-> Int Type))

(declare-consts <binary> (BitVec (alf.len alf.self)))
  
(declare-const bvadd (->
  (! Int :var n :implicit)
  (BitVec n)
  (BitVec n)
  (BitVec n)))
  
(declare-rule eq-symm 
  ((T Type) (x T) (y T))
  :premises ((= x y))
  :args ()
  :conclusion (= y x))
  
(declare-const x (BitVec 3))

(assume a1 (= x #b101))
(step a2 (= #b101 x) :rule eq-symm :premises (a1))
