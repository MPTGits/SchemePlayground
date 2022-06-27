#lang racket
; x^2-x+4 if x>2 ,1/x if 1<=x<=2,0 if x<1
(define (expresion x) (cond ((> x 2) (+ (- (* x x) x) 4))
                              ((and (>= x 1) (<= x 2)) (/ 1 x))
                              ((< x 1) 0)))
;(expresion -2)
;Double the smaller or returns either if equal 
(define (doubler x y) (cond ((> x y) (* y y))
                            ((< x y ) (* x x))
                            ((= x y) x)))
;(doubler 4 4)
;Max number out of 3
;Too long to implement tbh

;If given a finds f(x)=0 as f(x)=2*a*x+|a-5| if a>2,else (x/(10+sign(a))-20

(define (function a) (cond ((and (> a 2) (<= a 5)) (/ (- 5 a) (* 2 a)))
                           ((and (> a 2) (> a 5))  (/ (- a 5 ) (* 2 a)))
                           (else (* 20 (+ 10 (* -1 a))))))     
;(function 8)


;function that x^10-x^5+5 if x>5,and 100-x^20-x^15 if x<=5
(define (power x n) (if (= n 1) x
  (* x (power x (- n 1)))))

(define (function2 x) (if (> x 5) (+ (- (power x 10) (power x 5)) 5)
  (- (- 100 (power x 20)) (power x 15))))

(function2 6)

;Magda FP book page 44 problem 8 a)
(define (triPoint x y) (cond ((or (or (> x 1) (< x -1)) (or (> y 1) (< y -1))) #f)
                             ((>= x y) #t)
                             ((>= y x) #f)))
(triPoint 0.6 0.4)