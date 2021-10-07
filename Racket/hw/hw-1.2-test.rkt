#|
    First Racket homework
    Using functions and arithmetic operations

    Gilberto Echeverria
    09/08/2020
|#

; Import library for unit testing
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-is-triangle?
    (test-suite
        " Test function: is-triangle? "
        (check-equal? (is-triangle? 0 0 0) #f "All sides are 0")
        (check-equal? (is-triangle? 0 0 1) #f "Two sides are 0")
        (check-equal? (is-triangle? 0 1 1) #f "One sides are 0")
        (check-equal? (is-triangle? 1 1 1) #t "All sides equal")
        (check-equal? (is-triangle? 1 6 1) #f "One side too long")
        (check-equal? (is-triangle? 1 6 8) #f "One side too short")
        (check-equal? (is-triangle? 5 6 8) #t "Correct triangle")
    ))

(define test-triangle-type
    (test-suite
        " Test function: triangle-type "
        (check-equal? (triangle-type 0 0 0) 'INVALID "Incorrect triangle sides")
        (check-equal? (triangle-type 1 6 1) 'INVALID "Incorrect triangle sides")
        (check-equal? (triangle-type 1 1 1) 'EQUILATERAL "All sides equal")
        (check-equal? (triangle-type 4 6 4) 'ISOSCELES "Two sides equal")
        (check-equal? (triangle-type 4 4 6) 'ISOSCELES "Two sides equal")
        (check-equal? (triangle-type 6 4 4) 'ISOSCELES "Two sides equal")
        (check-equal? (triangle-type 5 6 8) 'SCALENE "No equal sides")
    ))

(define test-point-quadrant
    (test-suite
        " Test function: point-quadrant "
        (check-equal? (point-quadrant 0 0) 'ORIGIN "Both coordinate are at 0")
        (check-equal? (point-quadrant 0 10) 'Y_AXIS "X is equal to 0")
        (check-equal? (point-quadrant 5.8 0) 'X_AXIS "Y is equal to 0")
        (check-equal? (point-quadrant 3.8 2) 'I "First quadrant")
        (check-equal? (point-quadrant -1 4) 'II "Second quadrant")
        (check-equal? (point-quadrant -3 -0.4) 'III "Third quadrant")
        (check-equal? (point-quadrant 6.4 -8) 'IV "Fourth quadrant")
    ))

(define test-parking-ticket
    (test-suite
        " Test function: parking-ticket "
        (check-= (parking-ticket 6 50 'LOST) 100 0.001 "For $100 for a lost ticket")
        (check-= (parking-ticket 0 0 'STAMPED) 0 0.001 "Pay $0 if there is no time")
        (check-= (parking-ticket 0 10 'STAMPED) 5 0.001 "Pay $5 for the first 2 hours")
        (check-= (parking-ticket 1 40 'STAMPED) 5 0.001 "Pay $5 for the first 2 hours")
        (check-= (parking-ticket 2 30 'STAMPED) 17 0.001 "During the third hour, pay $ 5 + 12")
        (check-= (parking-ticket 3 1 'STAMPED) 22 0.001 "For 3:01, pay $ 5 + 12 + 5")
        (check-= (parking-ticket 3 20 'STAMPED) 25 0.001 "For 3:20, pay $ 5 + 12 + 5 + 3")
        (check-= (parking-ticket 4 31 'STAMPED) 39 0.001 "For 4:31, pay $ 5 + 12 + 12 + 5 + 3 + 2")
        (check-= (parking-ticket 6 50 'STAMPED) 65 0.001 "For 6:50, pay $ 5 + 12 + 12 + 12 + 12 + 5 + 3 + 2 + 2")
        (check-= (parking-ticket 0 10 'UNSTAMPED) 12 0.001 "Pay $12 for the first 1 hour, not stamped")
        (check-= (parking-ticket 1 40 'UNSTAMPED) 22 0.001 "Pay $12 for the first 1 hour, plus fractions, not stamped")
        (check-= (parking-ticket 2 30 'UNSTAMPED) 32 0.001 "Pay $12 for the first 1 hour, plus fractions, not stamped")
    ))


; Start the execution of the test suite
(displayln "Testing: is-triangle?")
(run-tests test-is-triangle?)
(displayln "Testing: triangle-type")
(run-tests test-triangle-type)
(displayln "Testing: point-quadrant")
(run-tests test-point-quadrant)
(displayln "Testing: parking-ticket")
(run-tests test-parking-ticket)
