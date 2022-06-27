#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да проверим дали дадено число е просто

(define (prime? n) (define (prime-Helper n div) (cond ((= n div ) #t)
                                                      ((= (remainder n div) 0) #f)
                                                      (else (prime-Helper n (+ div 1))))) (prime-Helper n 2))

(define tests (test-suite
  "prime tests"

  (test-case "" (check-true (prime? 2)))
  (test-case "" (check-true (prime? 3)))
  (test-case "" (check-false (prime? 4)))
  (test-case "" (check-false (prime? 10)))
  (test-case "" (check-true (prime? 11)))
))

(run-tests tests 'verbose)
