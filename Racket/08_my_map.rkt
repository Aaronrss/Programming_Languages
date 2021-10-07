#lang racket

(provide my-map)


(define (my-map func lst)
    (let loop
        ([lst lst] [resutlt empty])
        (if (empty? lst)
            (reverse resutlt)
            (loop (cdr lst) (cons (func (car lst)) resutlt))
        )
    )
)