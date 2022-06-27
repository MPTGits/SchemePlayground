#lang racket
(require rackunit)
(require rackunit/text-ui)


; Искаме едно нивo на влагане да изчезне.
(define (oneLvlLess lst)
  (define (helper lst resultList)
    (cond((null? lst) resultList)
         ((pair? (car lst)) (helper (cdr lst) (append resultList (car lst))))
         (else (helper (cdr lst) (append resultList (list (car lst)))))))
  (helper lst '()))

     

(define tests (test-suite
               "One level less in list"
               
(test-case "case1 " (check-equal? (oneLvlLess '(2 (4 (5 6) 1) (2) (4 5))) '(2 4 (5 6) 1 2 4 5)))
(test-case "case2 " (check-equal? (oneLvlLess '(2 (4 (5 6 (4)) 1) 2 5)) '(2 4 (5 6 (4)) 1 2 5)))
(test-case "case3 " (check-equal? (oneLvlLess '(2 2 5 2 (4))) '(2 2 5 2 4)))
           ))

(run-tests tests 'verbose)

