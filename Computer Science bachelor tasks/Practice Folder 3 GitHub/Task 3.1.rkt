#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (count-digits-iter n)
  (define (helper current result)
    (if (<= current 0)
        result
        (helper (quotient current 10)
                (+ result 1))))
  (helper n 0))

; Искаме да обърнем цифрите на дадено число.

(define (my-reverse n) (define (reverser multiPly newNum n) (if(= n 0)
                                                               newNum
                                                               (reverser (quotient multiPly 10) (+ newNum  (* multiPly (remainder n 10))) (quotient n 10))))
  (reverser (expt 10 (- (count-digits-iter n) 1)) 0 n))

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
