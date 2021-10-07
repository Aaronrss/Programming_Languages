#|
First examples of functions in Racket

Aaron Rosas
2021-09-07
|#

; Indicate the language we need to interpret this file
#lang racket

(require racket/trace)

; DECLARE THE FUNCTIONS THAT YOU HAVE IN THIS FILE 
(provide sum-list sum-list-t duplicate)

(trace-define (sum-list lst)
;IF THE LIST IS EMPTY IS THE BASE CASE
    (if (empty? lst)
        0
        ;ADD FIRST ELEMENT PLUS THE SUM OF ALL ELEMENTS IN THE REST OF THE LIST
        (+ (car lst) (sum-list (cdr lst)))))

(define (sum-list-t lst )
    (trace-let loop
        ([lst lst] [result 0])
        (if (empty? lst)
            result
            (loop (cdr lst) (+ result (car lst))))))



(define (duplicate lst)
    (let loop
        ([lst lst] [result empty])
        (if (empty? lst)
            result
            (loop (cdr lst) (append result (list (car lst) (car lst)))))))