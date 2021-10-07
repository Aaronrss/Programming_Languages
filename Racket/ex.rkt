#lang racket

(define (invert-digits number)
    (let loop
        ([n number] [result 0])
        (if (zero? n)
            result
            (loop (quotient n 10 ) (+ (* result 10) (remainder n 10)))
        )
    )
)

(define (interest money yearly-interest)
    (let loop
        ([money money] [monthly-interest (/ yearly-interest 12 100.0)] [month 1])
        (if (> month 12)
            money
            (loop (+ money (* money monthly-interest)) monthly-interest (+ month 1) ))))