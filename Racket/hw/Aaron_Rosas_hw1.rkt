#|
First HW

Aaron Rosas
2021-08-24
|#

; Indicate the language we need to interpret this file
#lang racket

;INDICATES IF THREE INPUTS ACHIVE THE RULES TO BECOME A TRIANGLE 
(define (is-triangle? a b c)
    (if (> a 0)
        ;TRUE
        (if (> b 0)
            ;TRUE
            (if (> c 0)
                ;TRUE
                (if (> (+ a b) c)
                    ;TRUE
                    (if (> (+ b c) a)
                        ;TRUE
                        (if (> (+ c a) b)
                            ;TRUE
                            #T
                            ;FALSE
                            #F
                        )
                        ;FALSE
                        #F
                    )
                    ;FALSE
                    #F
                )
                ;FALSE
                #F
            )
            ;FALSE
            #F
        )
        ;FASLE
        #F
    )
)

(define (triangle-type a b c)
    (cond
        ;FIRST CONDITION WICH CALL IS-TRIANGLE
        [(eq? #T (is-triangle? a b c))
            ;TRUE
            (if (eq? a b)
                ;TRURE
                (if (eq? b c)
                    ;TURE IF EVERY SIDE IS EQUAL 
                    'EQUILATERAL
                    ;FALSE IF JUST A IS EQUAL TO B WICH MEANS IT IS A ISAOSCELES
                    'ISOSCELES
                )
                ;FALSE IF A IS NOT EQUAL TO B
                (if (eq? b c)
                    ;TRUE IF A AND B ARE NOT EQUAL AND B AND C ARE EQUAL
                    'ISOSCELES
                    ;FALSE
                    (if (eq? c a)
                        ;TRUE
                        'ISOSCELES 
                        ;FALSE EVERY SIDE IS DIFFERENT
                        'SCALENE 
                    )
                )
            )
        ]
        ;ELSE CASE IF IS NOT A TRIANGLE AOUTMATIC SENDS INVALID
        [else 'INVALID]
    )
)

;FUNCTION THAT CHECK  X Y COORDINATES
(define (point-quadrant x y)
    (cond
        [(and (> x 0) (> y 0))'I]
        [(and (< x 0) (> y 0))'II]
        [(and (< x 0) (< y 0))'III]
        [(and (> x 0) (< y 0))'IV]
        [(and (eq? x 0) (or (> y 0)(< y 0)))'Y_AXIS]
        [(and (or (> x 0)(< x 0)) (eq? y 0))'X_AXIS]
        [else 'ORIGIN]
    )
)

(define (parking-ticket h min symb)
    ;FIRST CHECK FOR THE STATE OF THE TICKET
    (case symb
        ;FIRST CASE STAMPED
        ['STAMPED
            ;CHECK POR THE HOURS CASES
            (case h
                [(0) (if (eq? min 0) 0 #|False|# 5) ]
                [(1) 5]
                [(2) (if (eq? min 0) 5 17) ]
                ;THE LAST CASE SUBSTRACT THE FIRST TWO HOURS AND THEN MULTIPLY IT BY 12 (THE COST OF HOURS FROM DE SECOND ONE) AFTER THAT SUM 5 FOR THE PRICE OF THE FIRST TWO HOURS
                [else (+ 5 (* (- h 2) 12) (check-min min)) ]
                ;[(and (<= h 2) (or (eq? min 0) (> min 0))) 5]
                ;[(and (and (> h 2) (<= h 3)) (> min 0)) 17]
                ;[(and (<= h 2) (eq? min 0)) 5]
            )
        
        ]
        ['UNSTAMPED
            (case h
                [(0) (if (eq? min 0) 0 12) ]
                ;EVERY HOUR COST 12 SO IN HERE JUST MULTIPLY 12 AND HOURS AND THEN SUM THE COST PER MINUTES (WICH CALL CHECK-MIN FUNCTION)
                [else (if (eq? min 0) 12 (+ (* h 12)(check-min min)) )]
            )
        ]
        ;LAST CASE SIMPLE AS IF IS LOST 100 NO MATTER HOURS OR MINUTES
        ['LOST 100]
    )
)


;RETURN THE MINUTES TICKET PRICE  
(define (check-min min)
    (case min
        [(0) 0]
        [(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) 5]
        [(16 17 18 19 20 21 22 23 24 25 26 27 28 29 30) 8]
        [(31 32 33 34 35 36 37 38 39 40 41 42 43 44 45) 10]
        [(46 47 48 49 50 51 52 53 54 55 56 57 58 59 60) 12]
    )
)