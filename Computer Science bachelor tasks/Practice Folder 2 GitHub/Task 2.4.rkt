#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да обърнем число от двоична в десетична бройна система
(define (bin-to-dec n) (define (Hbin-to-dec n counter) (if(<= n 0)
                                                          0
                                                          (+ (* (remainder n 10) (expt 2 counter))  (Hbin-to-dec (quotient n 10) (+ 1 counter)))))
                                                          (Hbin-to-dec n 0)) 


(define tests (test-suite
  "binary to decimal tests"

  (test-case "zero" (check-equal? (bin-to-dec 0) 0))
  (test-case "one" (check-equal? (bin-to-dec 1) 1))
  (test-case "rip" (check-equal? (bin-to-dec 1010010110000) 5296))
  (test-case "power of 2" (check-equal? (bin-to-dec 10000) 16))
))

(run-tests tests 'verbose)

