#lang racket
(require rackunit)
(require rackunit/text-ui)

; Да се конструира списъкът с числата от start до end.

(define (range start end)(define (range-helper start end list)(if(> start end)
                                                                 list
                                                                 (cons start (range-helper (+ 1 start) end list))))
                                                                 (range-helper start end '()))

(define tests
  (test-suite "Range tests"

    (test-case "" (check-equal? (range 1 1) '(1)))
    (test-case "" (check-equal? (range 1 4) '(1 2 3 4)))
  )
)

(run-tests tests 'verbose)
