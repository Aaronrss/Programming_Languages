#|
Unit tests to evaluate basic functions in racket

Gilberto Echeverria
13/08/2020
|#

; Module for unit tests
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-C->F
    (test-suite
        " Test function: C->F"
        ;Numerical_test Expression Expected_result Tolerance Message
        (check-=         (C->F 0)   32              0.001     "Converting 0")
        (check-= (C->F 10) 50 0.001 "Converting a positive integer")
        (check-= (C->F 38.2) 100.76 0.001 "Converting a positive float")
        (check-= (C->F -5) 23 0.001 "Converting a negative integer")
        (check-= (C->F -15.7) 3.74 0.001 "Converting negative float")
        (check-= (C->F -28.3) -18.94 0.001 "Converting to negative result")
    ))

(define test-F->C
    (test-suite
        " Test function: F->C"
        (check-= (F->C 0) -160/9 0.001 "Converting 0")
        (check-= (F->C 10) -110/9 0.001 "Converting a positive integer")
        (check-= (F->C 18.2) -7.6666 0.001 "Converting a positive float")
        (check-= (F->C -5) -185/9 0.001 "Converting a negative integer")
        (check-= (F->C -15.7) -26.50 0.001 "Converting negative float")
        (check-= (F->C 38.4) 3.5555 0.001 "Converting to positive result")
    ))

; Start the execution of the test suite
(displayln "Testing: C->F")
(run-tests test-C->F)
(displayln "Testing: F->C")
(run-tests test-F->C)
