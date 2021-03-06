

(defn infix-to-prefix
  "Convert from infix notation to prefix notation"
  ([col]
    (cond
      ;; handle term only
      (not (seq? col)) col
      ;; handle sequence containing one term (i.e. handle parens)
      (= (count col) 1) (infix-to-prefix (first col))
      ;; handle all other cases
      true (let [lowest (find-lowest-precedence col)]
             (if (nil? lowest) ;; nothing to split
               col
               ;; (a b c) bind a to hd, c to tl, and b to op
               (let [[hd [op & tl]] (split-at lowest col)]
                 ;; recurse
                 (list (translate-op op)
                   (infix-to-prefix hd)
                   (infix-to-prefix tl))))))))
(defmacro formula
  "Convert from infix notation to prefix notation"
  ([& equation]
    (infix-to-prefix equation)))

;;; sym-core
(ns symdiff.core
  (:use [clojure.core.match :only (match)]
        clojure.math.numeric-tower))

(defn deriv [exp var]
  (match [exp]
    [(a :guard number?)] 0
    [(a :guard symbol?)] (if (= exp var) 1 0)
    [(['+ a b] :seq )] (list '+ (deriv a var) (deriv b var))
    [(['* a b] :seq )] (list '+ (list '* (deriv a var) b) (list '* a (deriv b var)))
    [(['expt a b] :seq )] (list '* b (list '* (list 'expt a (- b 1)) (deriv a var)))
    :else nil))


;; The simplest possible symbolic differentiator

;; Functions to create and unpack additions like (+ 1 2)
(defn make-add [ a b ] (list '+ a b))
(defn addition? [x] (and (=(count x) 3) (= (first x) '+)))
(defn add1   [x] (second x))
(defn add2   [x] (second (rest x)))


;; Similar for multiplications (* 1 2)
(defn make-mul [ a b ] (list '* a b))
(defn multiplication? [x] (and (=(count x) 3) (= (first x) '*)))
(defn mul1   [x] (second x))
(defn mul2   [x] (second (rest x)))


;; Differentiation.
(defn deriv [exp var]
  (cond (number? exp) 0                                                              ;; d/dx c -> 0
    (symbol? exp) (if (= exp var) 1 0)                                           ;; d/dx x -> 1, d/dx y -> 0

    (addition? exp) (make-add (deriv (add1 exp) var) (deriv (add2 exp) var))     ;; d/dx a+b -> d/dx a + d/dx b
    (multiplication? exp) (make-add (make-mul (deriv (mul1 exp) var) (mul2 exp)) ;; d/dx a*b -> d/dx a * b + a * d/dx b
                            (make-mul (mul1 exp) (deriv (mul2 exp) var)))
    :else :error))


;;an example of use: create the function x -> x^3 + 2x^2 + 1 and its derivative
(def poly '(+ (+ (* x (* x x)) (* 2 (* x x))) 1))

(defn poly->fnform [poly] (list 'fn '[x] poly))

(def polyfn  (eval (poly->fnform poly)))
(def dpolyfn (eval (poly->fnform (deriv poly 'x))))



;;tests

(use 'clojure.test)

(deftest deriv-test
  (testing "binary operators"
    (is (= (let [m '(* a b)] [(multiplication? m) (make-mul (mul1 m) (mul2 m))]) [true  '(* a b)]))
    (is (= (let [m '(* a b)] [(addition? m)       (make-add (add1 m) (add2 m))]) [false '(+ a b)])))
  (testing "derivative function"

    (is (= (deriv '0 'x)               '0))
    (is (= (deriv '1 'x)               '0))
    (is (= (deriv 'x 'x)               '1))
    (is (= (deriv 'y 'x)               '0))
    (is (= (deriv '(+ x x) 'x)         '(+ 1 1)))
    (is (= (deriv '(* x x) 'x)         '(+ (* 1 x) (* x 1))))
    (is (= (deriv '(* x x) 'y)         '(+ (* 0 x) (* x 0))))
    (is (= (deriv '(* x (* x x)) 'x)   '(+ (* 1 (* x x)) (* x (+ (* 1 x) (* x 1)))))))
  (testing "function creation: d/dx (x^3 + 2x^2 + 1) = 3x^2 + 4x "
    (let [poly '(+ (+ (* x (* x x)) (* 2 (* x x))) 1)]
      (is (= ((eval (poly->fnform poly)) 3) 46))
      (is (= ((eval (poly->fnform (deriv poly 'x))) 3))))))