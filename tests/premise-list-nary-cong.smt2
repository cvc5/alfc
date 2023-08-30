
(declare-const = (-> (! Type :var T :implicit) T T Bool))
(declare-const and (-> Bool Bool Bool) :right-assoc-nil)


(program add_nary_arg ((U Type) (f (-> U U)) (s1 U) (s2 U) (t1 U) (t2 U) (nil U :list))
    ((-> U U) U U Bool) Bool
    (
      ((add_nary_arg f s1 s2 (= t1 t2)) (= (f s1 t1) (f s2 t2)))
    )
)

(program mk_nary_cong_eq ((U Type) (f (-> U U)) (t1 U :list) (t2 U :list) (s1 U) (s2 U) (tail Bool :list))
    ((-> U U) Bool) Bool
    (
        ((mk_nary_cong_eq f alf.nil)              (= alf.nil alf.nil))
        ((mk_nary_cong_eq f (and (= s1 s2) tail)) (add_nary_arg f s1 s2 (mk_nary_cong_eq f tail)))
    )
)

(declare-rule nary_cong ((U Type) (E Bool) (f (-> U U)))
    :premise-list E and
    :args (f)
    :conclusion (mk_nary_cong_eq f E)
)

(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)
(declare-const e Bool)
(declare-const f Bool)

(assume @p0 (= a b))
(assume @p1 (= c d))
(assume @p2 (= e f))

(step @p3 (= (and a c e) (and b d f)) :rule nary_cong :premises (@p0 @p1 @p2) :args (and))

