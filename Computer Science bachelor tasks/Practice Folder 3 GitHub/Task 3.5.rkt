#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да напишем процедурата accumulate

(define (id x) x)
(define (inc x) (+ x 1))

(define (accumulate op null-value start end term next)(if(> start end) null-value (op (term start) (accumulate op null-value (next start) end term next))))

(define tests
  (test-suite "Accumulate tests"

    (check-equal? (accumulate + 0 1 100 id inc) 5050)
    (check-equal? (accumulate + 0 9 9 id inc) 9)
    (check-equal? (accumulate * 1 1 5 id inc) 120)
  )
)

(run-tests tests 'verbose)
