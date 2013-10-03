;; Pascal's triangle
;;         1
;;       1   1
;;     1   2   1
;;   1   3   3   1
;; 1   4   6   4   1

 ;; ex 1.12 


(define (pascal-triangle row col)
  (cond ((< row 3) 1)
        ((or (= col 1) (= col row)) 1)
        (else (+ (pascal-triangle (dec row) col)
                 (pascal-triangle (dec row) (dec col))))))

  
 ;; Testing 
 (pascal-triangle 1 1) 
 (pascal-triangle 2 2) 
 (pascal-triangle 3 2) 
 (pascal-triangle 4 2) 
 (pascal-triangle 5 2) 
 (pascal-triangle 5 3) 