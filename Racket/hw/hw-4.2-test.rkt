#|
    Third Racket homework
    Using lists

    Gilberto Echeverria
    13/08/2020
|#

; Import library for unit testing
(require rackunit)
; Import necesary to view the test results
(require rackunit/text-ui)

(define test-hailstone
    (test-suite
        " Test function: hailstone "
        (check-equal? (hailstone 0) '() "Input less than 1")
        (check-equal? (hailstone 1) '(1) "Input is 1")
        (check-equal? (hailstone 2) '(2 1) "Input is 2")
        (check-equal? (hailstone 3) '(3 10 5 16 8 4 2 1) "Input is 3")
        (check-equal? (hailstone 5) '(5 16 8 4 2 1) "Input is 5")
        (check-equal? (hailstone 58) '(58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1) "Input is 58")
    ))

(define test-hailstone-list
    (test-suite
        " Test function: hailstone-list "
        (check-equal? (hailstone-list 0 0) '(()) "A single number 0")
        (check-equal? (hailstone-list 5 5) '((5 16 8 4 2 1)) "A single number 5")
        (check-equal? (hailstone-list 2 3) '((2 1) (3 10 5 16 8 4 2 1)) "Hailstones for 2 and 3")
        (check-equal? (hailstone-list 1 4) '((1) (2 1) (3 10 5 16 8 4 2 1) (4 2 1)) "Hailstones for 1 to 4")
        (check-equal? (hailstone-list 15 21) '((15 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1)
                                               (16 8 4 2 1)
                                               (17 52 26 13 40 20 10 5 16 8 4 2 1)
                                               (18 9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
                                               (19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
                                               (20 10 5 16 8 4 2 1)
                                               (21 64 32 16 8 4 2 1))
                      "Hailstones from 15 to 21")
    ))


(define test-shift-char
    (test-suite
        " Test function: shift-char "
        (check-equal? (shift-char #\a 0) #\a "No shift")
        (check-equal? (shift-char #\a 1) #\b "Shift one char")
        (check-equal? (shift-char #\a 3) #\d "Shift three chars")
        (check-equal? (shift-char #\b -1) #\a "Shift negative chars")
        (check-equal? (shift-char #\a -1) #\z "Shift back")
        (check-equal? (shift-char #\z 1) #\a "Shift around")
        (check-equal? (shift-char #\A 0) #\A "No shift uppercase")
        (check-equal? (shift-char #\A 1) #\B "Shift one char uppercase")
        (check-equal? (shift-char #\A 3) #\D "Shift three chars uppercase")
        (check-equal? (shift-char #\B -1) #\A "Shift negative chars uppercase")
        (check-equal? (shift-char #\A -1) #\Z "Shift back uppercase")
        (check-equal? (shift-char #\Z 1) #\A "Shift around uppercase")
        (check-equal? (shift-char #\5 9) #\5 "No change to non letter characters")
        (check-equal? (shift-char #\" 9) #\" "No change to non letter characters")
        (check-equal? (shift-char #\  9) #\  "No change to non letter characters")
    ))

(define test-caesar-encode
    (test-suite
        " Test function: caesar-encode "
        (check-equal? (caesar-encode "abc" 0 #f) "abc" "No shift")
        (check-equal? (caesar-encode "abc" 1 #f) "bcd" "Encode one char")
        (check-equal? (caesar-encode "abc" 3 #f) "def" "Encode three chars")
        (check-equal? (caesar-encode "def" -3 #f) "abc" "Encode negative three chars")
        (check-equal? (caesar-encode "abc" -3 #f) "xyz" "Encode negative three chars around")
        (check-equal? (caesar-encode "xyz" 3 #f) "abc" "Encode positive three chars around")
        (check-equal? (caesar-encode "abc" -2 #f) "yza" "Encode negative two chars around")
        (check-equal? (caesar-encode "abc" 0 #t) "abc" "No shift")
        (check-equal? (caesar-encode "bcd" 1 #t) "abc" "Decode one char")
        (check-equal? (caesar-encode "efg" 3 #t) "bcd" "Decode three chars")
        (check-equal? (caesar-encode "abc" -3 #t) "def" "Decode negative three chars")
        (check-equal? (caesar-encode "xyz" -3 #t) "abc" "Decode negative three chars around")
        (check-equal? (caesar-encode "abc" 3 #t) "xyz" "Decode positive three chars around")
        (check-equal? (caesar-encode "xyz" -2 #t) "zab" "Decode negative two chars around")
        (check-equal? (caesar-encode "ABC" -2 #f) "YZA" "Encode negative two chars around uppercase")
        (check-equal? (caesar-encode "XYZ" -2 #t) "ZAB" "Decode negative two chars around uppercase")
        (check-equal? (caesar-encode "The 3 Red $% Tigers" 5 #f) "Ymj 3 Wji $% Ynljwx" "Encode mixed characters")
        (check-equal? (caesar-encode "Ymj 3 Wji $% Ynljwx" 5 #t) "The 3 Red $% Tigers" "Decode mixed characters")
    ))


; Start the execution of the test suite
(displayln "Testing: hailstone")
(run-tests test-hailstone)
(displayln "Testing: hailstone-list")
(run-tests test-hailstone-list)
(displayln "Testing: shift-char")
(run-tests test-shift-char)
(displayln "Testing: caesar-encode")
(run-tests test-caesar-encode)
