#lang racket
(require rackunit)
(require rackunit/text-ui)

;Имаме дадена функция и число. Искаме функция, която представлява n-пъти прилагане на дадената
(define (repeat f x n)
  (if(= n 0)
     x
     (f (repeat f x (- n 1)))
 ))

(define tests (test-suite
               "Repeat function test"
               
(test-case "+ case" (check-equal? (repeat (lambda (x) (+ x 5)) 5 5) 30))
(test-case "+ case" (check-equal? (repeat (lambda (x) (* x 5)) 5 1) 25))
(test-case "+ case" (check-equal? (repeat (lambda (x) (/ x 5)) 5 0) 5))
(test-case "+ case" (check-equal? (repeat (lambda (x) (* x 0)) 8 10) 0))
           ))

(run-tests tests 'verbose)