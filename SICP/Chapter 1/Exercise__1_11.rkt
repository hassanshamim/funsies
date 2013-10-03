"f(n) = n if n < 3 && f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n > 3"
"Recursive"

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;; comment


"Iterative"
(define (f1 n)
  (iter 0 1 2 n)
  )

(define (iter a b c count)
  (if (< count 3)
      c
      (iter b c (+ (* 3 a) (* 2 b) c) (dec count))))


;; Testing

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)