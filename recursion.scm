; czr: return the last element of a list
; czr returns () for an empty list because there is no last item.
> (define czr
(lambda (L)
(if (null? L)
'()
(if (null?(cdr L))
(car L)
(czr(cdr L))))))
> (czr '(1 2 3 4 5 6))
6


; count: return how many items are in a list. Use czr as a guide to traversing the list.
; count returns 0 for an empty list because there are no items to count.
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



; reverse-list: reverse a list using only car, cdr, and append.
; reverse-list returns () for an empty list because there is nothing to reverse.
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


; largest: return the largest element. 
; largest returns () for an empty list because there is no largest number.
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
> (largest '(1 2 3 4 5 6 7 8))
8
; The og version makes way more recursive calls since it calculates (largest(cdr L)) more than once.
; In the improved version, let saves the answer so Scheme only needs to calculate it one time for each step.



; The empty-list sumlist question: 
; sumlist returns 0 for an empty list because there are no numbers to add.
> (define sumlist
(lambda (L)
(if (null? L)
0
(if (null? (cdr L))
(car L)
(+ (car L) (sumlist(cdr L)))))))
> (sumlist '())
0

; I think that the original version was a deliberate choice because it was assuming that the list would always contain one item.
; Returning 0 for an empty list makes sense because adding nothing gives a total of 0 and it makes the function work more often. 
