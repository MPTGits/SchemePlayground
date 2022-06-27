#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да повдигнем число на степен, използвайки процедурата accumulate
(define (accumulate op null-value start end term next)(if
                                                       (> start end) null-value
                                                       (op (term start) (accumulate op null-value (next start) end term next))))
(define (pow x n) (accumulate * 1 1 n (lambda (a) (+ a (- x a))) (lambda (a) (+ a 1 ))))


(define tests (test-suite
  "Pow tests"

  (test-case "" (check-equal? (pow 3 3) 27))
  (test-case "" (check-equal? (pow 2 10) 1024))
))

(run-tests tests 'verbose)