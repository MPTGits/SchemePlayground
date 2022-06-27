#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да намерим броя вариации на n елемента, k-ти ред

(define (accumulate op null-value start end term next)(if
                                                       (> start end) null-value
                                                       (op (term start) (accumulate op null-value (next start) end term next))))

(define (variation k n) (accumulate * 1 (+ (- n k) 1) n (lambda (a) a) (lambda (a) (+ a 1))))

(define tests (test-suite
  "Variation tests"

  (test-case "" (check-equal? (variation 3 7) 210))
  (test-case "" (check-equal? (variation 4 12) 11880))
))

(run-tests tests 'verbose)
