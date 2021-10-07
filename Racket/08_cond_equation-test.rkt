#|
Unit tests to evaluate basic functions in racket

Gilberto Echeverria
13/08/2020
|#

; Module for unit tests
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-f
    (test-suite
        " Test function: f"
        (check-= (f 0) 1 0.001 "f(0)")
        (check-= (f 1) 0 0.001 "f(1)")
        (check-= (f 2) -3 0.001 "f(2)")
        (check-= (f -1) 1 0.001 "f(-1)")
        (check-= (f -2) 0 0.001 "f(-2)")
        (check-= (f -3) -1 0.001 "f(-3)")
        (check-= (f 0.5) 0.75 0.001 "f(0.5)")
        (check-= (f -0.5) 1 0.001 "f(-0.5)")
        (check-= (f 2.5) -5.25 0.001 "f(2.5)")
    ))

; Start the execution of the test suite
(displayln "Testing: f")
(run-tests test-f)
