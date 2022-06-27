#lang racket
(define (inc x) (+ x 1))

(define (string-append list1 list2)

  (cons (car list1) (string-append (cdr lsit1)  list2)))