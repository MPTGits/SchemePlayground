#lang racket

(define (add-one xs)(if(null? xs)
                         '()
                         (cos (+ 1 (car xs)) (add-one (cdr xs)))))

(define (add-bangs xs)(if(null? xs)
                         '()
                         (cons (string-append (car xs) "!!!")
                               (add-bangs (cdr xs)))))