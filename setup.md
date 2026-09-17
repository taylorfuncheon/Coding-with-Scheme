Route Picked : try.scheme.org.

Example 1:
> (define L (list 'a 'b 'c))
> (car L)
a
> (cdr L)
(b c)
> (cons 'z L)
(z a b c)
> 
(define x (+ 3 2))
> (+ x 5)
10
> 
(define add +)
> (add 3 2)
5



Example 2:
> (define square
  (lambda (n)
    (* n n)))
> (define pow
  (lambda (n k)
    (if (= k 0)
        1
        (* n (pow n (- k 1))))))
> (square (pow 5 3))
15625



Example 3: 
(define sumlist
  (lambda (L)
    (if (null? (cdr L))
        (car L)
        (+ (car L) (sumlist (cdr L))))))
> (sumlist (list 1 2 3))
6



Example 4:
> (define classify
  (lambda (n)
    (cond ((< n 0) 'negative)
          ((= n 0) 'zero)
          (else    'positive))))
> (map classify '(-3 0 7))
(negative zero positive)
> (define L1 '(1 2 3))
> (define L2 '(4 5 6))
> (map - L1 L2)
(-3 -3 -3)
> (apply + '(1 2 3))
6



I had no errors using try.scheme.org so I intentionally entered (1 2 3) and it printed:
*** ERROR IN console@32:1 -- Operator is not a PROCEDURE
This happened because Scheme tried to run (1 2 3) as a function, but when you add the quote like '(1 2 3) that's when it treats it as a list. 
When I entered '(1 2 3) thats when it printed (1 2 3).
