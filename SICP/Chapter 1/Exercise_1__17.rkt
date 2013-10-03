;; Design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps

(define (double i) (+ i i))
(define (halve i) (/ i 2))

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
        
(* 1 5)
