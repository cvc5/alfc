; Since we don't have full support for scopes, we just import all of Ints for now
(include "../theories/Ints.smt2")

;(declare-const BitVec 
;  (-> 
;    (! Int :var w)
;    (! Type :requires ((alf.is_neg w) false))))

(declare-const BitVec (-> Int Type))
; TODO: requires
(declare-consts <binary> (BitVec (alf.len alf.self)))
(declare-consts <hexadecimal> (BitVec (alf.len alf.self)))


(declare-const bvempty (BitVec 0))

(declare-const concat (->
  (! Int :var n :implicit)
  (! Int :var m :implicit)
  (BitVec n)
  (BitVec m)
  (BitVec (alf.add n m))) :right-assoc-nil bvempty)

; does not work:
;  (BitVec (alf.add n (alf.match ((m Int)) U (alf.nil 0) ((BitVec m) m))))) :right-assoc-nil)

(declare-const extract (->
  (! Int :var n :implicit)
  (! Int :var h)
  (! Int :var l)
  (BitVec n)
  (!
    (BitVec (alf.add h (alf.add (alf.neg l) 1)))
      :requires ((alf.is_neg l) false)
      ; TODO: more conditions
  ))
)

(declare-const repeat 
    (-> (! Int :var n :implicit)
        (! Int :var i)
        (BitVec n)
        (BitVec (alf.mul i n))
    ) 
)

(declare-const bvnot
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m))
)

(declare-const bvand
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec m))
    :right-assoc-nil
)

(declare-const bvor
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec m))
    :right-assoc-nil
)

(declare-const bvnand
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m)) 
)

(declare-const bvnor
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m)) 
)

(declare-const bvxor
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec m))
    :right-assoc-nil
)

(declare-const bvxnor
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m))
)

(declare-const bvcomp
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec 1))
)

(declare-const bvneg
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m))
)

(declare-const bvadd
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec m))
    :right-assoc-nil
)

(declare-const bvmul
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec m))
    :right-assoc-nil
)

(declare-const bvudiv
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m))
)

(declare-const bvurem
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m)) 
)

(declare-const bvsub
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m))
)

(declare-const bvsdiv
  (-> (! Int :var m :implicit) 
      (BitVec m) (BitVec m) (BitVec m)) 
)

(declare-const bvsrem
  (-> (! Int :var m :implicit) 
      (BitVec m) (BitVec m) (BitVec m)) 
)

(declare-const bvsmod
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m))
)

(declare-const bvult
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
    :chainable and
)

(declare-const bvule
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
)

(declare-const bvugt
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
)

(declare-const bvuge
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
)

(declare-const bvslt
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool)
)

(declare-const bvsle
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool)
)

(declare-const bvsgt
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
)
  
(declare-const bvsge
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) Bool) 
)   

(declare-const bvshl
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec m))
)
 
(declare-const bvlshr
    (-> (! Int :var m :implicit) 
    (BitVec m) (BitVec m) (BitVec m))
)

(declare-const bvashr
    (-> (! Int :var m :implicit)
    (BitVec m) (BitVec m) (BitVec m))
)

(declare-const zero_extend
    (-> (! Int :var m :implicit)
        (! Int :var i)
        (BitVec m) (BitVec (alf.add m i)))
)

(declare-const sign_extend
    (-> (! Int :var m :implicit)
        (! Int :var i)
        (BitVec m) (BitVec (alf.add m i)))
)

(declare-const rotate_left
    (-> (! Int :var m :implicit)
        Int (BitVec m) (BitVec m))
)
 
(declare-const rotate_right
    (-> (! Int :var m :implicit)
        Int (BitVec m) (BitVec m))
)
 
(declare-const reduce_and
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec 1))
)

(declare-const reduce_or
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec 1))
)

(declare-const reduce_xor
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec 1))
)

; NOTE: does not require branches to be bitvector
(declare-const bvite
  (-> (! Type :var T :implicit)
      (BitVec 1) T T T)
)

(declare-const bv1ult
    (-> (! Int :var m :implicit) 
        (BitVec m) (BitVec m) (BitVec 1))
)


(declare-const bitOf
    (-> (! Int :var m :implicit)
        Int (BitVec m) Bool))


(declare-const bvuaddo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvsaddo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvumulo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvsmulo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvusubo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvssubo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)

(declare-const bvsdivo
  (-> (! Int :var m :implicit)
      (BitVec m) (BitVec m) Bool)
)


(declare-const bvultbv
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec 1))
)
(declare-const bvsltbv
    (-> (! Int :var m :implicit)
        (BitVec m) (BitVec m) (BitVec 1))
)



(declare-const bbT (->
  (! Int :var n :implicit)
  Bool
  (BitVec n)
  (BitVec (alf.add 1 n))))

(declare-const int2bv (->
  (! Int :var w)
  Int (BitVec w)))

(declare-const bv2nat (->
  (! Int :var m :implicit)
  (BitVec m) Int))

(declare-const BITVECTOR_EAGER_ATOM (-> Bool Bool))

; Internal definitions for Bitblasting
;(declare f_BITVECTOR_EAGER_ATOM term)
;(define BITVECTOR_EAGER_ATOM (# x term (apply f_BITVECTOR_EAGER_ATOM x)))
;(declare f_BITVECTOR_ITE term)
;(define BITVECTOR_ITE (# x term (# y term (# z term (apply (apply (apply f_BITVECTOR_ITE x) y) z)))))
;(declare f_BITVECTOR_SLTBV term)
;(define BITVECTOR_SLTBV (# x term (# y term (apply (apply f_BITVECTOR_SLTBV x) y))))
;(declare f_BITVECTOR_ULTBV term)
;(define BITVECTOR_ULTBV (# x term (# y term (apply (apply f_BITVECTOR_ULTBV x) y))))
