
(deftype num [u]   )
(deftype var [u]   )
(deftype dif [u]   )
(deftype par [u]   )
(deftype neg [u]   )
(deftype pow [u v] )
(deftype mul [u v] )
(deftype div [u v] )
(deftype add [u v] )
(deftype sub [u v] )

([exp e]
  (cond
    (num? exp)  (num 0)
    (var? exp)  (dif exp
    (add? exp)  (add
    (difference? exp) (make-sum (deriv* (second exp) v)
                        (deriv* (make-prod -1 (reduce-expr exp '+)) v))
    (product? exp)
    (make-sum
      (make-prod (second exp)
        (deriv* (reduce-expr exp '*) v))
      (make-prod (deriv* (second exp) v)
        (reduce-expr exp '*)))
    (quotient? exp) (deriv* (conv-qtnt exp) v)
    (expnt? exp)
    (let [u (second exp)
          n (expnt exp)]
      (make-prod (make-prod
                   (expnt exp)
                   (make-expnt (second exp) (make-sum (expnt exp) -1)))
        (deriv* (second exp) v)))
    (chainable? exp)
    (let [u (first exp)
          n (second exp)]
      (cond
        (number? n) 0;things could be out-of-bounds a la log(0), but that's philosophical
        (= 'sin u) (make-prod (list 'cos n) (deriv* n v))
        (= 'cos u) (make-prod (list '* -1 (list 'sin n)) (deriv* n v))
        (= 'tan u) (make-prod (list 'pow (list 'cos n) -2) (deriv* n v))
        ;multiply by inverse of denominator is same as numerator/denominator
        (= 'log u) (make-prod (deriv* n v) (list 'pow n -1))
        (= 'exp u) (make-prod (list 'exp n) (deriv* n v))
        true false));should not happen as chainable? refers to a list that
    ;we should completely specify here
    true (list 'deriv* exp v);some kind of error here, return a description of
    ;"the derivative of this function" rather than the actual result
    ))
([exp vr degree]
  (loop [x exp v vr dgr degree]
    (if (zero? dgr) x
      (recur (deriv* x v) v (dec dgr) )))))