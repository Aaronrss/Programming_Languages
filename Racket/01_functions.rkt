#|
First examples of functions in Racket

Aaron Rosas
2021-08-17
|#

; Indicate the language we need to interpret this file
#lang racket

; Declare the functions in this file
;LLAMAR DESDE OTRO ARCHIVO
(provide triangle-area years-to-100 lustrums lose-weight slope phone)

(define (triangle-area base height)
    (/ (* base height) 2.0))

(define (years-to-100 age current-year)
    (+ (- 100 age) current-year))

(define (lustrums born-year current-year)
    (/ (- current-year born-year) 5.0))

(define (lose-weight initial-weight final-weight months)
    (* (/ (- initial-weight final-weight) months) 1.0))

(define (slope x1 y1 x2 y2)
    (/ (- y2 y1) (- x2 x1)))

(define (phone messages megabytes minutes)
    (+ (* minutes .80)(* megabytes .80)(* messages .80)))