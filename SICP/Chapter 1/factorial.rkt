(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))



(define (fact n)
  (define (fact-iter product counter)
    (if (< n counter)
        product
        (fact-iter (* product counter) (+ counter 1))))
  (fact-iter 1 1))
(fact 1)
(fact 3)
(fact 6)