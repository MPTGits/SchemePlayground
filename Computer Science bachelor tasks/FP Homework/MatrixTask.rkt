#lang racket
(require rackunit)
(require rackunit/text-ui)

;Creating a list from numbers in a given range
(define (range start end)
  (define (range-iter start end Li)
    (if(> start end)
       Li
       (range-iter start (- end 1) (cons end Li))))
  (range-iter start end '()))
;Length of a list
(define (length? Li)
  (if(null? Li)
     0
     (+ 1 (length? (cdr Li)))
 ))
;Taking n- element sublist
(define (take n lst)
  (if (= n 0)
      '()
      (cons (car lst) (take (- n 1) (cdr lst)))
 ))
;Skiping n elements from a list 
(define (drop lst n)
  (reverse (take (- (length lst) n) (reverse lst))))
;Искаме да построим матрица от списък от стойности и дадени брой редове и колони
(define (make-matrix ranger rows cols)
  (define (make-matrix-iter resultList counter)
    (cond ((not (= (length? ranger) (* rows cols))) '())
          ((= counter (* rows cols)) resultList)
          (else (append (list (take cols (drop ranger counter)))
                        (make-matrix-iter resultList (+ counter cols))))))
  (make-matrix-iter '() 0)) 

;Tests
(define tests (test-suite
               "matrix creator"
               
(test-case "Matrix cannot be created" (check-equal? (make-matrix (range 1 8) 2 3) '()))
(test-case "1 row and 0 cols" (check-equal? (make-matrix (range 1 6) 1 6) '((1 2 3 4 5 6))))
(test-case "0 rows and 1 col" (check-equal? (make-matrix (range 1 6) 6 1) '((1) (2) (3) (4) (5) (6))))
(test-case "Multiply rows and cols" (check-equal? (make-matrix (range 1 12) 3 4) '((1 2 3 4) (5 6 7 8) (9 10 11 12)) '()))
 ))

(run-tests tests 'verbose)                                            
                                            
                                                                                                                                                                                  
                                         
                                                     
                                           