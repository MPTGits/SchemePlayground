#lang racket
;(define  (all? p? xs)(cond ((null? xs) #t)
 ;                           ((not (p? (car xs))) #f)
   ;                         (else (all? p? (cdr xs)))))

(define (pred x) (if(= (remainder x 2) 0)
                    #t
                    #f))


(define  (any? p? xs)(cond ((null? xs) #f)
                            ((p? (car xs)) #t)
                            (else (any? p? (cdr xs)))))

(define (all? p? xs) (if(null? xs) #t
                     (not (any?  p? xs)))))            