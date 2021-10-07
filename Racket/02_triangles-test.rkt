#|
Unit tests to evaluate basic functions in racket

Gilberto Echeverria
13/08/2020
|#

; Module for unit tests
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-hypot
    (test-suite
        " Test function: hypot"
        (check-= (hypot 0 0) 0 0.001 "Both sides equal to 0")
        (check-= (hypot 0 1) 1 0.001 "One side equal to 0")
        (check-= (hypot 3 4) 5 0.001 "Integer result")
        (check-= (hypot 1 1) 1.4142 0.001 "Float result")
        (check-= (hypot 3.2 7.4) 8.0622 0.001 "Floating inputs")
        ))

(define test-far-side
    (test-suite
        " Test function: far-side"
        (check-= (far-side 0 0) 0 0.001 "Both inputs are 0")
        (check-= (far-side 0 45) 0 0.001 "Length equal to 0")
        (check-= (far-side 10 0) 0 0.001 "Angle equal to 0")
        (check-= (far-side 10 45) 7.0710 0.001 "45 degrees")
        (check-= (far-side 10 90) 10.0 0.001 "90 degrees")
        (check-= (far-side 10 180) 0 0.001 "180 degrees")
        (check-= (far-side 10 270) -10 0.001 "270 degrees")
        (check-= (far-side 10 360) 0 0.001 "360 degrees")
        (check-= (far-side 10 29.3) 4.8938 0.001 "29.3 degrees")
    ))

(define test-near-side
    (test-suite
        " Test function: near-side"
        (check-= (near-side 0 0) 0 0.001 "Both inputs are 0")
        (check-= (near-side 0 45) 0 0.001 "Length equal to 0")
        (check-= (near-side 10 0) 10 0.001 "Angle equal to 0")
        (check-= (near-side 10 45) 7.0710 0.001 "45 degrees")
        (check-= (near-side 10 90) 0.0 0.001 "90 degrees")
        (check-= (near-side 10 180) -10 0.001 "180 degrees")
        (check-= (near-side 10 270) 0 0.001 "270 degrees")
        (check-= (near-side 10 360) 10 0.001 "360 degrees")
        (check-= (near-side 10 29.3) 8.7206 0.001 "29.3 degrees")
    ))

; Start the execution of the test suite
(displayln "Testing: hypot")
(run-tests test-hypot)
(displayln "Testing: far-side")
(run-tests test-far-side)
(displayln "Testing: near-side")
(run-tests test-near-side)
