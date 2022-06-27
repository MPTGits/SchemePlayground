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


; Искаме да проверим дали даден низ съдържа в себе си друг даден низ.
(define  (substr? str substr) (cond ((= (remainder str (expt 10 (count-digits-iter substr))) substr) #t)
                                    ((= str 0) #f)
                                    (else (substr? (quotient str 10) substr))))

(define tests (test-suite
  "Substring tests"

  (check-true (substr? 1234 23))
  (check-true (substr? 1234 12))
  (check-true (substr? 1234 1))
  (check-true (substr? 1234 2))
  (check-true (substr? 1234 4))
))

(run-tests tests 'verbose)