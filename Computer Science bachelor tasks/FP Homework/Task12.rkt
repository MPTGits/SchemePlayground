#lang racket
(require rackunit)
(require rackunit/text-ui)


;Сбор на елементи от дадено ниво

;Remover of lvls in a list
(define (removingLvls lst)
  (define (helper lst resultList)
    (cond((null? lst) resultList)
         ((pair? (car lst)) (helper (cdr lst) (append resultList (car lst))))
         (else (helper (cdr lst) resultList))))
  (helper lst '()))
;Function for summing non pair elements in a list
(define (summingElements lst)
  (define (helper lst result)
    (cond((null? lst) result)
         ((pair? (car lst)) (helper (cdr lst) result))
         (else (helper (cdr lst) (+ result (car lst))))))
  (helper lst 0))
                                                          
;Main function
(define (sumOnSetLvl f lst lvl)
  (if(= lvl 0)
     lst
     (f (sumOnSetLvl f lst (- lvl 1)))
 ))


(define tests (test-suite
               "One level less in list"
               
(test-case "lvl 2 " (check-equal? (summingElements (sumOnSetLvl removingLvls '(2 (4 (5 6) 1) (2) (4 5)) 2)) 11))
(test-case "lvl 1 " (check-equal? (summingElements (sumOnSetLvl removingLvls '(2 (4 (5 6) 1) (2) (4 5)) 1)) 16))
(test-case "lvl 0 " (check-equal? (summingElements (sumOnSetLvl removingLvls '(2 (4 (5 6) 1) (2) (4 5)) 0)) 2))
(test-case "empty list " (check-equal? (summingElements (sumOnSetLvl removingLvls '() 1)) 0))
           ))

(run-tests tests 'verbose)