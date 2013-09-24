(define (abs x) (if (< x 0) (- 0 x) x))
(define (avg x y) (/ (+ x y) 2))
(define (croot-iter guess x)
  (if (good-enough? guess x)
      guess
      (croot-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs(- guess (improve guess x))) (/ guess 1000.0)))

(define (improve guess x)
  (/ 
   (+ 
    (/ x (square guess))
    (* 2 guess))
   3))

(define (croot x) (croot-iter 1.0 x))
(define (square x) (* x x))

(croot 64)