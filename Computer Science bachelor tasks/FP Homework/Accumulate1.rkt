#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (accumulate op null_value term start next end)
     (if(> start end)
        null_value
        (op (term start) (accumulate op null_value term (next start) next end ))))


(define (sumProc num end)
  (accumulate  + ;parm1
               0; parm2
               (lambda(index)(/ (expt num index)
                                (accumulate *
                                            1
                                            (lambda(x) (+ 1 (expt num x)))
                                            1
                                            (lambda(x) (+ x 1))
                                            index)
                                ));parm3
               1;parm4
               (lambda(x) (+ x 1));parm5
               end);parm6


  
  )

(define tests (test-suite
               "Accumulate tester"
               
(test-case "case 1" (check-equal? (sumProc 3 2) 39/40))
(test-case "case 2" (check-equal? (sumProc 1 4) 15/16))
(test-case "case 0 repititions" (check-equal? (sumProc 5 0) 0))
           ))

(run-tests tests 'verbose)