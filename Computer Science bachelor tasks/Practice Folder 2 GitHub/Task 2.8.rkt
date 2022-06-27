#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да преброим колко цифри има дадено число. Ама итеративно.
(define (count-digits-iter n)(define (iter-helper counter n)(if(< n 10) (+ counter 1) (iter-helper (+ counter 1) (/ n 10))))(iter-helper 0 n))

(define tests
  (test-suite "Iterative count digits"

    (test-case "" (check-equal? (count-digits-iter 0) 0))
    (test-case "" (check-equal? (count-digits-iter 1) 1))
    (test-case "" (check-equal? (count-digits-iter 9) 1))
    (test-case "" (check-equal? (count-digits-iter 10) 2))
    (test-case "" (check-equal? (count-digits-iter 100) 3))
  )
)