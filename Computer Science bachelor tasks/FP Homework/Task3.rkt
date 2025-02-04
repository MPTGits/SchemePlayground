#lang racket
(require rackunit)
(require rackunit/text-ui)
;Taking n- element sublist
(define (take n lst)
  (if (= n 0)
      '()
      (cons (car lst) (take (- n 1) (cdr lst)))
 ))
;Skiping n elements from a list 
(define (drop lst n)
  (reverse (take (- (length lst) n) (reverse lst))))

;Искаме да вземем i-тата колона на дадена матрица
(define (taking-col-matrix matrix column)
  (cond((or (< column 1) (> column (length (car matrix)))) '())
       ((null? (cdr matrix)) (cons (car (drop (car matrix) (- column 1))) '()))
       (else(append (cons (car (drop (car matrix) (- column 1))) '()) (taking-col-matrix (cdr matrix) column)))
 ))
         


(define tests (test-suite
               "matrix give col. taker"
               
(test-case "Random column" (check-equal? (taking-col-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) 1) '(1 3 6 9)))
(test-case "Random column" (check-equal? (taking-col-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) 3) '(3 5 8 11)))
(test-case "Invalid column" (check-equal? (taking-col-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) -1) '()))
(test-case "Invalid column" (check-equal? (taking-col-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) 6) '()))
           ))

(run-tests tests 'verbose)