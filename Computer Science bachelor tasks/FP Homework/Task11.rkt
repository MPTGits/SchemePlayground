#lang racket
(define count 0)
(define sum 0)
(define (nullCounter)((set! count 0))0)

(define (notPair x)(if(not (pair? x)) #t
                      #f))

;(define (my-map p? op lst)(define (helper lst sum)(cond  ((null? lst) sum)
                                                         ;((p? (car lst)) (helper (cdr lst) (op sum (car lst))))
                                                         ;(else (helper (cdr lst) sum))))(helper lst 0)) 
;Removeing lvls in a list and creating a new list as a pair of element and its lvl on the main list.

(define (flatten lst lvlNeeded)(cond ((= count lvlNeeded) (map + (filter notPair lst))
                                     ((null? lst) (begin (set! count 0)))
                                     (else (+ sum (flatten (car lst) lvlNeeded) (flatten (cdr lst) lvlNeeded))))))
                                                                   


(flatten '(2 (123 (243)) (432) (34 (432 (432) (23) 2 4 43) 12)) 0)