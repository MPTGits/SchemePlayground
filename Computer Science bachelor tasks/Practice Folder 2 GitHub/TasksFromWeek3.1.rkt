#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да обърнем цифрите на дадено число.
(define (my-reverse x) (define (reverser x n) (if (< x 10)
                                                  x
                                                  (+ (* (remainder x 10) n) (reverser (/ (- x (remainder x 10)) 10) (pow n 10)))))
                                                  (reverser x 1))

(define tests (test-suite
  "Reverse tests"

  (test-case "" (check-equal? (my-reverse 0) 0))
  (test-case "" (check-equal? (my-reverse 5) 5))
  (test-case "" (check-equal? (my-reverse 10) 1))
  (test-case "" (check-equal? (my-reverse 21) 12))
  (test-case "" (check-equal? (my-reverse 10234) 43201))
  (test-case "" (check-equal? (my-reverse 10234003) 30043201))
))

(run-tests tests 'verbose)