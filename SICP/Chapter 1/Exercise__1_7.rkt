(define (abs x) (if (< x 0) (- 0 x) x))
(define (avg x y) (/ (+ x y) 2))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs(- guess (improve guess x))) (/ guess 1000)))

(define (improve guess x)
  (avg guess (/ x guess)))

(define (sqrt x) (sqrt-iter 1.0 x))
(define (square x) (* x x))

(sqrt 0.234234)
(sqrt 1123412341234123)