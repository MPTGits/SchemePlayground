#lang racket


(define (decToBinary n)
  (cond
   [(= n 0) '(0)]
   [(= n 1) '(1)]
   [else (append (decToBinary (floor (/ n 2))) (cons (remainder n 2) '()))]))
  

(define (consStream n)
  (stream-cons (decToBinary n) (consStream (+ n 1))))

;Testing section

;Stream testing

(define (infinite n)
  (stream-cons n (infinite (- n 1))))

(define (run p n)
(cond [(> n 0) (printf "~a: ~a\n" n (stream-first p))
(run (stream-rest p) (- n 1))]
[else (display "End\n")]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;State exam 2014.07.15
;A)

(define (totalMin fLst)
  (foldr (lambda (currEl currResult) (if (< (currEl 0) (currResult 0)) currEl currResult)) (car fLst) fLst))

(define res (totalMin (list (lambda (x) (+ x 2)) (lambda (x) (* x 2)) (lambda (x) (- x 2)) (lambda (x) (+ x 8)))))

;B)

(define (numRange x y)
  (if (> x y) '() (cons x (numRange (+ x 1) y))))

(define (chainMinCompositions p)
  (let* ((f0 (lambda (x) x))
        (f1 (lambda (x) (p x)))
    (minFunc (lambda (mainFunc num) (totalMin (stream->list (stream-take (mainFunc p f1 f0 0) (- num 1)))))))
  (define (compose p n1 n2 n)
    (cond [(= n 0) (stream-cons n2 (compose p  n1 n2 (+ n 1)))]
          [(= n 1) (stream-cons n1 (compose p  n1 n2 (+ n 1)))]
          [(member #f (map (lambda (x) (= (n1 x) (n2 x))) (numRange 0 n))) (stream-cons (lambda (x) (n1 (n2 x))) (compose p n1 (lambda (x) (n1 (n2 x))) (+ n 1)))]
          [else (stream-cons (minFunc (lambda (x y z t) (compose x y z t)) n)  (compose p n1 (minFunc (lambda (x y z t) (compose x y z t)) n) (+ n 1 )))]))
  (compose p f1 f0 0)))
  

(define test (stream->list (stream-take (chainMinCompositions (lambda (x) (if (< x 3) (* x 3) (* x 0)))) 15)))
