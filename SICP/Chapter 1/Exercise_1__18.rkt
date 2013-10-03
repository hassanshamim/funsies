;; Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving
;; and uses a logarithmic number of steps

(define (double i) (+ i i))
(define (halve i) (/ i 2))

;; my answer
(define (* a b)
  (define (iter a b sum)
    (cond ((= b 0) sum)
           ((and (even? b) (> 2 b)) (iter a (halve b)  (double sum)))
           (else (iter a (- b 1) (+ sum a)))))
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((= b 2) (double a))
        (else (iter a (- b 1) a))))

;; proper answer
(define (* a b)
  (define (iter a b sum)
    (cond ((= b 0) sum)
          ((even? b) (iter (double a) (halve b) sum))
          (else (iter a (- b 1) (+ sum a)))))
  (iter a b 0))

;Proper answer is much more elegant than mine.  It doubles the value 'b' rather than the sum.  Trying this gave me off by 'a' errors, as (halve b) = 1, and it would add another 'a' despite having
;; doubled sum.
;; The true answer exploits the fact that variable b will always hit 1, and is consequently able to add the value of 'a' to the sum whenever b is odd.


;; Test
(* 0 1) " should be 0"
(* 1 0) " should be 0"
(* 1 1) " should be 1"
(* 3 3) " should be 9"
(* 4 5) " should be 20"
(* 6 6) " should be 36"
(* 9 9) " should be 81"
(* 11 11) " should be 121"