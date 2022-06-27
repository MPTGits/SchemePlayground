#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (factorial n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))
))


(define (accumulate op null_value term start next end)
  (if(> start end)
     null_value
     (op (term start) (accumulate op null_value term (next start) next end ))
))



(define (multiProc num end)
  (accumulate  *;parm1
               1;parm2
               (lambda(index)(+ 1
                                (accumulate +
                                            0
                                            (lambda(x) (* (expt -1 x) (/ (expt num (* 2 x)) (factorial (* 2 x)))))
                                            1
                                            (lambda(x) (+ x 1))
                                            index)));parm3
               1;parm4
               (lambda(x) (+ x 1));parm5
               end;parm6
))
  

(define tests (test-suite
               "Accumulate tester"
               
(test-case "case 1" (check-equal? (multiProc 3 2) 7/16))
(test-case "case 1 repetitions" (check-equal? (multiProc 3 1) -7/2))
(test-case "case constant is zero" (check-equal? (multiProc 0 5) 1))
           ))

(run-tests tests 'verbose)