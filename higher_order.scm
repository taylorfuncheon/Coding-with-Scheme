;6 y and a projectile
> (define y 
(lambda (m x b)
(+ (* x m) b)))
> (y 5 6 7)
37
> (define projectile 
(lambda (v0 t a)
(+ (* v0 t)
(* 0.5 a (* t t)))))
> (projectile 10 2 3)
26.
> (define square 
(lambda (n)
(* n n)))
> (define projectile-square
(lambda (v0 t a)
(+ (* v0 t)
(* 0.5 a (square t)))))
> (projectile-square 10 2 3)
26.
; Using square made it easier to read and write because I didn't have to keep writing (* t t) everytime I wanted to square t.
> (map
(lambda (t)
(projectile-square 10 t 3))
'( 1 2 3 4 5))
(11.5 26 43.5 64 87.5)

; 7 plusminus
> (define plusminus
(lambda ( a b)
((lambda (x y)
(list (+ x y) (- x y)))
a b)))
> (plusminus 6 2)
(8 4)
; So a and b are passed through the inner lambda as x and y. So when using 6 and 2, 6 becomes x and 2 becomes y. It adds them for x, and then subtracts them for y returning(8 4) 

; 8 oplist
> (define oplist
(lambda (L op)
(if (null? (cdr L))
(car L)
(op (car L) (oplist (cdr L) op)))))
> > (oplist '(2 4 6) +)
> 12
> (oplist '(2 4 6) *)
48
> (define subtract
(lambda (a b)
(- a b)))
> (oplist '(10 3 2) subtract)
9
> (apply * (list 2 4 6))
48
; oplist and apply give the same answers for multiplcation and addition. But they can give different answers for subtraction since oplist does the calculations from the right side.

; 9 make-counter
> (define (make-counter)
(let((count 0))
(lambda ()
(set! count (+ count 1))
count)))
> (define c1 (make-counter))
> (define c2 (make-counter))
> (c1)
1
> (c1)
2
> (c2)
1
> (c1)
3
> (c2)
2
> (c2)
3
; Each counter keeps track of its own number. c1 and c2 both are counting seperatly without interfering with the other. The value stays connected to the rturn function. A closure is like an object because it can keep its own data and use it later.


