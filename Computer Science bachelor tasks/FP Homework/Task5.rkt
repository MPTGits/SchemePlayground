#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (add2 x)(+ x 2))
(define (add4 x)(+ x 4))
(define (add5 x)(+ x 5))

(define (multiply2 x)(* x 2))
(define (multiply3 x)(* x 4))
(define (multiply5 x)(* x 5))

(define (substract2 x)(- x 2))
(define (substract4 x)(- x 4))
(define (substract5 x)(- x 5))
;Намипра най-малкия елемент в списък
(define (mini lst)
  (define (helper lst minElement)
    (cond((null? lst) minElement)
         ((< (car lst) minElement) (helper (cdr lst) (car lst)))
         (else(helper (cdr lst) minElement))))
    (helper lst (car lst)))
;Тази функция прилага всяка функция от списъка към аргумент позиционно съответстващ от списъка с числа и накрая връща най-малкия
(define (minElementFromList lstOperations lstNumbers)
  (mini(map (lambda(x y) (x y)) lstOperations lstNumbers)))
;Създава списък от най-малки елементи за всеки ред от матрицата
(define (list-creator matrixOfOperations lstOfNumbers)
  (if(null? matrixOfOperations)
     '()
     (cons (minElementFromList (car matrixOfOperations) lstOfNumbers) (list-creator (cdr matrixOfOperations) lstOfNumbers))))
;Правим матрица 3x3 от вече дефенераните ни функции
(define operationMatrix (list (list add2 add4 add5) (list multiply2 multiply3 multiply5) (list substract2 substract4 substract5)))


(define tests (test-suite
               "list creator"
               
(test-case "Random list" (check-equal? (list-creator operationMatrix '(2 4 1)) '(4 4 -4)))
(test-case "List out of same numbers" (check-equal? (list-creator operationMatrix '(0 0 0)) '(2 0 -5)))
(test-case "Growing values list" (check-equal? (list-creator operationMatrix '(1 2 3)) '(3 2 -2)))

           ))

(run-tests tests 'verbose)