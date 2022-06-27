#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (maxi a)
 (if (null? (cdr a)) (car a) 
  (min (car a) (maxi(cdr a))) 
 )
)


(define (list-of-min-el matrix numbers)(apply map matrix 