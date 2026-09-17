My evaluate function is 7 lines long. 

(map evaluate (cdr expr)) goes through parts of the expression and solves the smaller expressions inside it.

The recursion stops when it reaches a number. It keeps breaking the expression down into smaller peices until theres nothing left to solve.

I used assq in lookup-op to find the correct operator. I also used let to save the result so Scheme did not have to find it again.
