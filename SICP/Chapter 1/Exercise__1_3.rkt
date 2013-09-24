"Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers."
(define (>= x y) (not (< x y)))
(define (largest x y) ( if (>= x y) x y))
(define (largest_of_3 x y z)
  (largest  (largest x y) 
            (largest (largest y z) (largest z x))))
(define (sum_squares x y) (+ (* x x) (* y y)))
(define (largest_sum_squares x y z)
  ( largest_of_3 (sum_squares x y) (sum_squares x z) (sum_squares y z)))
(largest_sum_squares 10 4 3)

