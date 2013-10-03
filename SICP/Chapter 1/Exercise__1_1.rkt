"f(n) = n if n < 3 && f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n > 3"
"Recursive"

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))


"Iterative"
(define (f1 n)
  "iter")
 
(f 3)
(f 4)
(f 5)