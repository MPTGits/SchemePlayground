#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да намерим сумата на цифрите на дадено числo

(define (sum-digits num) (define (sumOfDigits num sum) (if (num<0) sum (+ sum (remainder num 10) (sumOfDigits num/10 sum)))) (sumOfDigits num 0))

(define tests (test-suite
  "sum-digits tests"

  (test-case "no-digit" (check-equal? (sum-digits 0) 0))
  (test-case "single digit" (check-equal? (sum-digits 4) 4))
  (test-case "many digits" (check-equal? (sum-digits 492148) 28))
  (test-case "100" (check-equal? (sum-digits 100) 1))
))

(run-tests tests 'verbose)
