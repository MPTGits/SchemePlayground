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

; Искаме да проверим дали дадено число е палиндром.
(define (palindrome? n)(if(= n (my-reverse n))
                         #t
                         #f))

(define tests (test-suite
  "Palindrome tests"

  (check-true (palindrome? 1))
  (check-false (palindrome? 10))
  (check-true (palindrome? 101))
  (check-true (palindrome? 121))
  (check-false (palindrome? 122))
  (check-false (palindrome? 221))
  (check-false (palindrome? 1220))
  (check-true (palindrome? 1221))
  (check-false (palindrome? 12210))
  (check-true (palindrome? 1234321))
  (check-true (palindrome? 12344321))
  (check-false (palindrome? 123421))
  (check-false (palindrome? 124321))
))

(run-tests tests 'verbose)
