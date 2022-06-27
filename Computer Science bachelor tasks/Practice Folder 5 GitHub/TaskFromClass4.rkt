#lang racket

(define (only-even xs) (define (only-even-helper xs resultList) (cond ((null? xs) resultList)
                                                                     ((= (remainder (car xs) 2) 0) (cons (car xs) (only-even-helper (cdr xs) resultList)))
                                                                     (else (only-even-helper (cdr xs) resultList))))
  (only-even-helper xs '()))
                                                                   
                                                                   