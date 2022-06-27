#lang racket

(define (orFunc x y)(or x y))

(define (accumulate op null_value term start next end)(if(= start end) null_value
                                                    (op (term start) (accumulate op null_value term (next start) next end ))))

(define (meetTwice? f g a b)(accumulate orFunc
                                        #f;??
                                        (lambda(x)(accumulate orFunc #f (lambda(y)(and (eq? (f y) (g y)) (eq? (f x) (g x)))) x (lambda(x)(+ x 1)) (+ b 1)))
                                        a
                                        (lambda(x) (+ x 1)) 
                                        b
                                        ))


(meetTwice? (lambda(x) x) (lambda(x) (- x)) -3 1)

(meetTwice? (lambda(x)x) (lambda(x) (- x)) 0 1)