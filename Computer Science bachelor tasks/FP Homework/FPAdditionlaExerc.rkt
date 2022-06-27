#lang racket
;Нека е дадаен списък L  от числа и двуместна операция над числа XOR.

(define (member? x l)
  (cond
    ((null? l) #f)
    ((= (car l) x) #t)
    (else (member? x (cdr l)))))




;(define (listChecker mainList checkerList)(cond((member? (car checkerList) mainList) (listChecker mainList (cdr checkerList)))
                                               ;((null? chekerList) #t) 
                                               ;(else #f)))

(define (applyer lst)


(define (cartesientSqr lst1 lst2)(define (helper lst1 lst2 resultList)
                                   (if(null? lst1)
                                      resultList
                                    (helper (cdr lst1) (apply  (car lst1) lst2))))(helper lst1 lst2 '()))

(cartesientSqr '(2 4 5 6) '(2 4 5 6))

;(define (is-em? lst op f)(if(and  (listChecker lst (map f lst)) (

