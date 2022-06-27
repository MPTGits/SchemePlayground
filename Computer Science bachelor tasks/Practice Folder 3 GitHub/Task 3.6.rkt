#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да дефинираме процедурата, която намира n!, като използваме accumulate

(define (id x) x)
(define (inc x) (+ x 1))

(define (accumulate op null-value start end term next)(if
                                                       (> start end) null-value
                                                       (op (term start) (accumulate op null-value (next start) end term next))))

(define (fact n) (accumulate * 1 1 n id inc))

(define tests (test-suite
  "Factorial tests"

  (test-case "" (check-equal? (fact 5) 120))
  (test-case "" (check-equal? (fact 3) 6))
))

(run-tests tests 'verbose)

