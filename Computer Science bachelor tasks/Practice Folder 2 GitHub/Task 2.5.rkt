#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да обърнем число от десетична в двоична бройна система
(define (dec-to-bin n) (define (Hdec-to-bin n counter) (if(<= n 0)
                                                          0
                                                          (+ (* counter (remainder n 2))  (Hdec-to-bin (quotient n 2) (* 10 counter)))))
                                                          (Hdec-to-bin n 1))


(define tests (test-suite
  "decimal to binary tests"

  (test-case "zero" (check-equal? (dec-to-bin 0) 0))
  (test-case "one" (check-equal? (dec-to-bin 1) 1))
  (test-case "rip" (check-equal? (dec-to-bin 5296) 1010010110000))
  (test-case "power of 2" (check-equal? (dec-to-bin 16) 10000))
))

(run-tests tests 'verbose)