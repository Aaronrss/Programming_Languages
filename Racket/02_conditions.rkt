#|
Functions that use conditionals

Aaron Rosas
2021-08-20
|#

#lang racket

; IF CONDITIONS NESTED EXPLICILTY ALWAYS MUST HAVE A N ELSE CLAUSE
(define (number-sign number)
    (if (< number 0)
        ;When expression is true
        'negative
        ;When expression is false
        (if (> number 0)
            ;When expression is true
            'positive
            ;When expression is false
            'zero)))

; COND WAY TO A SOLUTION ABOVE ALLOW THE USE OF NESTED IF CONDITIONS
(define (number-sign-cond number)
    (cond
        ((< number 0) 'negative)
        ((> number 0) 'positive)
        (else 'zero)))

; CASE IS USED TO COMPARE THE SPECIFIED VARIABLE AGAINST A SET OF VALUES
(define (letter-to-grade letter)
    (case letter
        ['A 100]
        ['B 80]
        ['C 60]
        [else 'invalid]))

; CASE CAN BE COMPARED TO LISTS OF VALUES
(define (month-days month year)
    (case month
        [(2) (if (leap? year))29 28]
        [(1 3 5 7 8 10 12) 31]
        [(4 6 9 11) 30]))

; Finding the next day from a given date
(define (leap? year)
    (and (zero? (remainder year 4))(or (not (zero? (remainder year 100)))(zero? (remainder year 400)))))

;MY FIRST SOLUTION
;    (if (= (remainder year 4) 0)
;        ;True
;        (if (= (remainder year 100) 0)
;            ;True
;            (if (= (remainder year 400) 0)
;                ;True
;                'Bisiesto
;                ;False
;                'NoBis)
;            ;False
;            'Bisiesto)
;        ;False
;        'NoBis))

(define (next-day day month year)
    (cond
        [(= day (month-days month year))
            (if (= 12 month)
            ;(+ 1 year) OR (add1 year)
                (list 1 1 (+ 1 year))
                ;(+ 1 month) OR (add1 month)
                (list 1 (+ 1 month) year))]
        [else
            ;(+ 1 day) OR (add1 day)
            (list (+ 1 day) month year)]))




























