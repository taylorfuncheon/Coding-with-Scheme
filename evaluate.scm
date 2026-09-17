> (define ops
(list (cons '+ +)
(cons '- -)
(cons '* *)
(cons '/ /)))
> (define lookup-op
(lambda (sym)
(let ((found (assq sym ops)))
(if found 
(cdr found)
(error "unknown operator:" sym)))))
> (lookup-op '+)
#<procedure #2 +>
> ((lookup-op '+)1 2)
3
> (lookup-op '&)
*** ERROR IN console@14:1 -- unknown operator: &
1> (define evaluate
(lambda (expr)
(if (number? expr)
expr
(apply
(lookup-op (car expr))
(map evaluate (cdr expr))))))
*** WARNING -- defining global variable: evaluate
1> (evaluate 42)
42
1> (evaluate '(+ 1 2))
3
1> (evaluate '(* (+ 2 3) 4))
20
; Evaluate function is 7 lines long
; I used way B with assq to match each operator to the function it should use. The evaluate function checks if the expression is just a number and if it's not, it finds the operator, solves the numbers inside and then does the final calculation.
> (evaluate '(+ 1 2))
3
> (evaluate '(* (+ 2 3) 4))
20
> (evaluate '(- (* 6 7) (/ 10 2)))
37
> (evaluate '(+ 1 (* 2 (- 10 (/ 8 4)))))
17
> (evaluate 42)
42
> (evaluate '(+ 1))
1
; I chose (evaluate '(+ 1)) since it only has one number. I wanted to see if it would still work with only one operator.

;unknown operator
> (evaluate '(+ 1 (& 2 3)))
*** ERROR IN evaluate, console@19:11 -- unknown operator: &

; Option A
2> (evaluate '(+ 1 2 3 4))
10
2> (evaluate '(* 2 3 4 5))
120
3> (evaluate '(+ 5))
5
3> (evaluate '(+))
0
3> (evaluate '(- 5))
-5
; I chose A for using any number of arguments. My evaluator already worked because map goes through every value and apply sends them to the operator. 

