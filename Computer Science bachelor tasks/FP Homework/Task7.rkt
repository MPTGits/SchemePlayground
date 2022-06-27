#lang racket
(require rackunit)
(require rackunit/text-ui)

;Helper insert function
(define (insert Li1 Li2)
  (cond ((null? Li1) Li2)
        ((null? Li2) Li1)
        ((< (car Li1) (car Li2)) (cons (car Li1) (insert (cdr Li1) Li2)))
        (else (cons (car Li2) (insert (cdr Li2) Li1)))
))
;Insertion sort
(define (insertionSort Li)
  (if (null? Li)
      '()
      (insert (list (car Li)) (insertionSort (cdr Li)))
 ))


(define tests (test-suite
               "Insertion sort test"
               
(test-case "Random case" (check-equal? (insertionSort '(2 4 5 1 2 4 5)) '(1 2 2 4 4 5 5)))
(test-case "Already sorted case" (check-equal? (insertionSort '(1 2 3 8 8 9)) '(1 2 3 8 8 9)))
(test-case "Reverse sorted case" (check-equal? (insertionSort '(9 8 7 6 5 )) '(5 6 7 8 9)))
(test-case "one number case" (check-equal? (insertionSort '(1)) '(1)))
(test-case "No number case" (check-equal? (insertionSort '()) '()))

           ))

(run-tests tests 'verbose)