#|
Exercises Racket

Aaron Rosas
2021-09-10
|#

#lang racket
#|
1. La funci ́on insert toma dos entradas: un nu ́mero n y una lista lst que
contiene nu ́meros en orden ascendente.
Devuelve una nueva lista con los mismos elementos de lst pero con n
insertado en su lugar correspondiente.
|#

(define (insert num lst)
    (let loop
        ;rlist will have all elements smaller than num
        ([lst lst] [rlst empty])
        (cond
            ; When the input list is empty, add the new element at the end
            [(empty? lst) (append rlst (list num))]
            ; Join the smaller element, num and the larger elements
            [(< num (car lst)) (append rlst (list num) (list (car lst))(cdr lst))]
            ; Keep looking for an element larger than n
            [else (loop (cdr lst) (append rlst (list (car lst))))])))


(define (insertion-sort lst)
    (let loop
        ([lst lst] [rlst empty])
        (if (empty? lst)
            rlst
            (loop (cdr lst) (insert (car lst) rlst))
        )
    )
)