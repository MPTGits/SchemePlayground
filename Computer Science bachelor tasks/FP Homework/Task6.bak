#lang racket
(require rackunit)
(require rackunit/text-ui)


;Min element function
(define (min lst)
  (cond ((null? (cdr lst)) (car lst))
        ((< (car lst) (min (cdr lst))) (car lst))
        (else (min (cdr lst)))
 ))


;Function to remove element from a list
(define (removeElement element list)
  (define (helper element list resultList counter)
    (cond((and (= counter 0) (= element (car list))) (helper element (cdr list) resultList (+ counter 1)))
         ((null? list) (reverse resultList))                                       
         (else(helper element (cdr list) (cons (car list) resultList) counter))))
  (helper element list '() 0))
  
;Имплементирайте Selection Sort
(define (selectionSort lst)
  (define (selectionSort-iter lst resultList)
    (if(null? lst)
       (reverse resultList)
       (selectionSort-iter (removeElement (min lst) lst) (cons (min lst) resultList))))
  (selectionSort-iter lst '()))


(define tests (test-suite
               "Selection sort test"
               
(test-case "Random case" (check-equal? (selectionSort '(2 4 5 1 2 4 5)) '(1 2 2 4 4 5 5)))
(test-case "Already sorted case" (check-equal? (selectionSort '(1 2 3 8 8 9)) '(1 2 3 8 8 9)))
(test-case "Reverse sorted case" (check-equal? (selectionSort '(9 8 7 6 5 )) '(5 6 7 8 9)))
(test-case "one number case" (check-equal? (selectionSort '(1)) '(1)))
(test-case "No number case" (check-equal? (selectionSort '()) '()))

           ))

(run-tests tests 'verbose)