1. czr: return the last element of a list :
> (define czr
(lambda (L)
(if (null? L)
'()
(if (null?(cdr L))
(car L)
(czr(cdr L))))))
> (czr '(1 2 3 4 5 6))
6


2. count: return how many items are in a list. Use czr as a guide to traversing the list. 
> (define count
(lambda (L)
(if(null? L)
0
(+ 1 (count(cdr L))))))
> (count '(1 2 3 4 5))
5
> (count '(a b c d))
4
> (count '())
0



3. reverse-list: reverse a list using only car, cdr, and append. 
> (define reverse-list
(lambda (L)
(if (null? L)
'()
(append(reverse-list(cdr L))
(list(car L))))))
> (reverse-list '(1 2 3 4))
(4 3 2 1)
> (reverse-list '(a b c d))
(d c b a)
> (reverse-list '(1 3 2 4))
(4 2 3 1)
> (reverse '(1 2 3 4))
(4 3 2 1)
> (reverse '(a b c d))
(d c b a)


4. largest: return the largest element. 
> (define largest
(lambda (L)
(if (null? L)
'()
(if (null? (cdr L))
(car L)
(let ((x(largest(cdr L))))
(if (>= (car L) x)
(car L)
x))))))
> (largest '(1 9 2 3 7))
9
> (largest '(a c h d e))
*** ERROR IN largest, console@8:5 -- (Argument 1) REAL expected
(>= 'd 'e)
1> 



