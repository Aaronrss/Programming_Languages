#|
First examples of recursion

=! = 1
n! = n * (n-1)!

Aaron Rosas
2021-08-24
|#

#lang racket

; Allow debugging the functions
(require racket/trace)
; Use 'trace-define' to show each call the the function

; Regular recusion
(define (factorial n)
    (if (zero? n)
        1
        (* n (factorial (sub1 n)))))


; Tail recursion
(define (fact n)
    ; Internal definition of the function with the accumulator
    (trace-define (fact-tail n a)
        (if (zero? n)
            a
            (fact-tail (sub1 n)(* n a))))
    ; Now call the function with the right starting value for a
    (fact-tail n 1))

; TAIL RECURSION USING NAMED LET
(define (! n)
    (trace-let loop 
        ([n n] [a 1])
        (if (zero? n)
            a
            (loop (sub1 n) (* n a))
        )
    )

)