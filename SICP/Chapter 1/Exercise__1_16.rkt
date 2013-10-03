;;Exercise 1.16.  Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. 
;;(Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that
;;the product a bn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. 
;;In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)


;;regular
(define (exp b n)
  (if (= n 0)
      1
      (* b (exp b (- n 1)))))

;;fast-exp
(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;;iterative
(define (myexp b n)
  (iter-exp b n 1))
(define (iter-exp b n a)
  (cond ((= n 0) a)
        ((even? n) (iter-exp (square b) (/ n 2) a))
        (else (iter-exp b (- n 1) (* a b)))))

;;Test
(myexp 3 4)
(exp 3 4)