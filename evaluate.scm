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
