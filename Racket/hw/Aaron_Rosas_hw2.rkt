#|
Second Racket HW

Aaron Rosas
2021-08-30
2021-09-02
|#

;Indicate the language we need to interpret this file
#lang racket
;Allow debugging the funcition
(require racket/trace)

;Use 'trace-define' to show each call the the function

;REGULAR RECURSION IS THE LAST THING TO DO
;TAIL RECURSION IS THE FIRST THING TO DO

;COMPUTES TH VALUE OF ∏, USING THE INFINITE SERIES
(define (get-pi-regular nterms)
    ;IF NTERMS = 0 RETURN 0.0, FALSE REGULAR RECURSION
    (if (zero? nterms)
        0.0
        (+ (/ (* (expt -1 (+ nterms 1) ) 4 )
            (- (* 2 nterms) 1 ))
                (get-pi-regular (sub1 nterms)))))

;THE SAME AS THE PREVIOUS FUNCTION, BUT USING TAIL RECURSION
(define (get-pi nterms)
    ;DEFINE INNER FUNCION WITH VAR A
    (define (get-pi-tail nterms a)
        ;IF NTERMS IS 0 RETURN A, FALSE RECURSIVE WITH TAIL
        (if (zero? nterms)
            a
            ;FIRST THING RECURSION
            (get-pi-tail (sub1 nterms)
                ;LAST THING "A" TAIL
                (+ (/ (* (expt -1 (+ nterms 1) ) 4 ) (- (* 2 nterms) 1 ))
                    a ))))
    (get-pi-tail nterms 0.0))

;COMPUTES THE VALUE OF THE NATURAL LOGARITHM OF 2, USING INFINITE SERIES
(define (ln-2 nterms)
    (define (ln-2-tail nterms a)
        ;IF NTERMS IS 0 RETURN A, FALSE RECURSION WITH TAIL
        (if (zero? nterms)
            a
            ;FIRST THING RECURSION
            (ln-2-tail (sub1 nterms)
                ;LAST THING "A" TAIL
                (+ (/ 1 (* (* 2 nterms) (- (* 2 nterms) 1))) a ))))
    (ln-2-tail nterms 0.0))

;TAKES TWO NUMBERS (A AND B) AS ARGUMENTS, AND RETURNS THEIR MULTIPLICATION,
;FOLLOWING THIS METHOD: AT EACH ITERATION, A IS MULTIPLIED BY 2 AND B IS DIVIDED
;BY TWO (INTEGER DIVISION). FOR ANY ODD VALUE OF B, THE CORRESPONDING VALUE OF A
;IS ADDED TO THE RESULT.
(define (russian-* a b)
    ;TAIL RECURSION VARIATION DEFINITION OF LOOP AND VARIABLES (LET CONSTANT)
    (let loop
        ;VAR DECLARATION
        ([a a] [b b] [c 0])
        ;COND FOR SOME CASES 
        (cond
            ;FIRST CASE B EQUAL TO 0 RETURN C
            [(eq? b 0) c]
            ;SECOND CASE B <= 1 RETURN C+A
            [(<= b 1) (+ c a)]
            ;THIRD CASE IF B % 2 = 0, TAIL RECURSION WITH INTEGER DIVISION
            [(zero? (remainder b 2)) (loop (* a 2) (quotient b 2) c) ]
            ;FOURTH CASE TAIL RECURSION WITH INTEGER DIVISION AND C+A
            [else (loop (* a 2) (quotient b 2) (+ c a))])))

;THE SAME AS THE PREVIOUS ONE, BUT USING REGULAR RECURSION
(define (russian-*-regular a b)
    ;COND FOR SOME CASES
    (cond
        ;FIRST CASE B EQUAL TO 0 RETURN 0
        [(eq? b 0) 0]
        ;SECOND CASE IF B % 2 = 0, REGULAR RECURSION WITH INTEGER DIVISION 
        [(zero? (remainder b 2)) (russian-*-regular (* a 2) (quotient b 2))]
        ;THIRD CASE ELSE REGULAR RECURSION WITH INTEGER DIVISION
        [else (+ a (russian-*-regular (* a 2) (quotient b 2)) )]))