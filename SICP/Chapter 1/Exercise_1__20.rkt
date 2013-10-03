(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder (remainder 206 40) 40))
(gcd 6 (remainder 6 40))
(gcd 4 (remainder 6 4))
(gcd 2 (remainder 4 2))
2 ; 9 remainder called?  --Actually 18, forgot how remainders aren't evaled until the (if = (remainder x y) 0)), then stack on the GCD calls

;; Applicative order
(gcd 206 40)
(gcd (remainder 206 40) 40)
(gcd (remainder 40 6) 6)
(gcd (remainder 6 4) 4)
(gcd (remainder 4 2) 2)
2 ;; 4 remainder calls?