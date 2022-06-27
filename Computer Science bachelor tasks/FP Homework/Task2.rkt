#lang racket
(require rackunit)
(require rackunit/text-ui)
;Искаме да вземем i-тия ред на дадена матрица

(define (row-matrix matrix row)
  (define (row-matrix-iter counter matrix)
    (cond ((= counter row)  (car matrix))
          ((or (< row 1) (null? (cdr matrix))) '())
          (else (row-matrix-iter (+ counter 1) (cdr matrix)))))
  (row-matrix-iter 1 matrix))


(define tests (test-suite
               "matrix creator"
               
(test-case "Random row" (check-equal? (row-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) 3) '(6 7 8)))
(test-case "Unexisting row" (check-equal? (row-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) -1) '()))
(test-case "Unexisting row 2" (check-equal? (row-matrix '((1 2 3) (3 4 5) (6 7 8) (9 10 11)) 6) '()))
           ))

(run-tests tests 'verbose)