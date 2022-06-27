#lang racket
(define (square a) (* a a))

(define (id x) (* x 1))

(define (multiply a b) (* a b))

(define (inc a) (+ a 1))

(define (accumulate start end term next op null_value)
  (if (> start end)
      null_value 
      (op (term start) (accumulate (next start) end term  next op null_value))))
;Use accumulator to output x^n
(define (pow x n) (define (const a) x) (accumulate 1 n (lambda (a) x) inc multiply 1))
;Predstavqne na  lamba 1. nachin => ( (lamba (...) ....)  ) 2.Nachin => ( (define func (lambda (x) (+ x 14))) )