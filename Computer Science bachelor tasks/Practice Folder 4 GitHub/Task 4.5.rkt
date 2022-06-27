#lang racket
(require rackunit)
(require rackunit/text-ui)

; Искаме да залепим два списъка


(define (my-append list1 list2) (cond ((null?  list1) list2)
                                      ((null? list2) list1)
                                      (else (cons (car list1) (my-append (cdr list1) list2)))))
                                   

(define tests
  (test-suite "Append tests"

    (test-case "" (check-equal? (my-append '(1 2 3) '()) '(1 2 3)))
    (test-case "" (check-equal? (my-append '() '(1 2 3)) '(1 2 3)))
    (test-case "" (check-equal? (my-append '(4 5 6) '(1 2 3)) '(4 5 6 1 2 3)))
  )
)

(run-tests tests 'verbose)