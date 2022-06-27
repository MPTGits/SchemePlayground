#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да намерим броя комбинации на n-елемента, k-ти ред.
(define (accumulate op null-value start end term next)(if
                                                       (> start end) null-value
                                                       (op (term start) (accumulate op null-value (next start) end term next))))

(define (combination k n) (accumulate * 1 1 k (lambda (a) (/ (+ (- n a) 1) a)) (lambda (a) (+ a 1))))


(define tests (test-suite
  "Combination tests"

  (test-case "" (check-equal? (combination 3 7) 35))
  (test-case "" (check-equal? (combination 4 12) 495))
))

(run-tests tests 'verbose)
