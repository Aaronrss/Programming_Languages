#|
    Fourth Racket homework
    Using lists

    Aaron Rosas
    22/09/2021
|#

;Indicate the language we need to interpret this file
#lang Racket
;Allow debugging the funcitio
(require racket/trace)

; Declare the functions that you have in this file
(provide hailstone hailstone-list shift-char caesar-encode)

;Use 'trace-define' to show each call the the function

;1.- hailstone: The function takes an initial integer as argument,
;and will generate a list of numbers,
;starting at the number provided and finishing at 1.
;The numbers in between are obtained and added to the list as follows:
;    If the number is even, divide it by 2
;    If the number is odd, multiply it by 3 and add 1


(define (hailstone num)
    ;TAIL RECURSION VARIATION DEFINITION OF LOOP AND VARIABLES (LET CONSTANT)
    (let loop
        ;VAR DECLARATION
        ([num num] [result empty])
        ;COND FOR SOME CASES
        (cond
            ;FIRST CASE NUM EQUAL TO 0 RETURN LIST RESULT
           [(zero? num) result]
           ;SECOND CASE NUM EQUAL TO ONE RETURN APPEND OF RESULT AND LIST NUM
           [(eq? num 1) (append result (list num))]
           ;THIRD CASE REMAINDER OF NUM IS 0
           [(zero? (remainder num 2))
            ;DO RECUSION, DIVIDING BY 2 THE NUM AND APPENDING TO LIST RESULT
            (loop (/ num 2) (append result (list num)))]
            ;ELSE CASE RECURSION 3(NUM)+1 AND APPEND TO LIST RESULT
           [else (loop (+ (* 3 num) 1) (append result (list num)))])))

;2.- hailstone-list: The function takes two integers, one lower limit,
;and an upper limit. It will generate a new list with the results of the
;hailstone function from the lower to the upper limits.

(define (hailstone-list low upp)
    ;TAIL RECURSION VARIATION DEFINITION OF LOOP AND VARIABLES (LET CONSTANT)
    (let loop
        ;VAR DECLARATION
        ([low low] [upp upp] [result empty])
        ;COND FOR SOME CASES
        (cond
            ;FIRST CASE IF LOW AND UPP IS ZERO
            [(and (zero? low) (zero? upp))
                ;DO CONVERT TO A LIST AND CALL HAILSTONE APPENDING TO RESULT
                (append result (list (hailstone upp)))]
            ; SECOND CASE IF LOW AND UPP ARE EQUAL,
                ;CALL HAILSTONE CONVERTING INTO A LIST AND APPEND IT TO RESULT
            [(eq? low upp) (append result (list (hailstone upp)))]
            ; ELSE CASE RECURSION ADDING 1 TO LOW, PASSING UPP AND
            ; CALL HAILSTONE WITH LOW CONVERTING IT TO A LIST AND APPENDING IT
            ; TO RESULT
            [else (loop (add1 low) upp
                        (append result (list (hailstone low))))])))

;3.- shift-char: Takes a character and an integer. If the character is a letter,
;either lowercase or uppercase, it will change the character for the one at the
;distance indicated by the integer. Other characters different from letters
;will be left as they are. The integer can be positive, negative or zero.
;It should wrap around the letters in the English alphabet.
;The existing functions char->integer and integer->char can help here.
;This function does not need to use lists, but will be necessary for the
;next function.

(define (shift-char ch num)
    ;TAIL RECURSION VARIATION DEFINITION OF LOOP AND VARIABLES (LET CONSTANT)
    (let loop
        ;VAR DECLARATION
        ([ch ch] [num num])
        ;COND FOR SOME CASES
        (cond
            ;FIRST CASE OUTTER COND
            ;IF CH IS BETWEEN 64 AND 91  DO...
            [(and (>= (char->integer ch) 65) (<= (char->integer ch) 90))
                ;THIS INNER COND 1
                (cond
                    ;FIRST CASE INNER COND 1
                    ; CONVERT CH TO INT, IF THE SUM OF NUM AND CH IS 90 DO...
                    [(> (+ num (char->integer ch)) 90)
                        ;RECURSION, CONVERT 65 INTO CHAR, CONVERT CH INTO INT
                        ;SUM NUM WITH CH AND SUBSTRACT 91 
                        (loop (integer->char 65)
                            (- (+ num (char->integer ch)) 91))]
                    ;SECOND CASE INNER COND 1
                    ;CONVERT CH TO INT, IF THE SUM OF NUM AND CH IS LESS THAN 65
                    [(< (+ num (char->integer ch)) 65)
                        ;RECURSION, CONVERT 65 INTO CHAR,
                        (loop (integer->char 65)
                            ;CONVERT CH INTO INT, SUM NUM AND CH, AND SUBSTRACT
                            ;THE RESULT TO 65 AND THEN SUBSTRACT THE NEW RESULT
                            ;TO 26
                            (- 26 (- 65 (+ num (char->integer ch)))))]
                    ;ELSE CASE, CH TO INT, SUM NUM AND CH, CH TO CHAR
                    [else (integer->char (+ num (char->integer ch)))])]
            ;SECOND CASE OUTTER COND
            ;IF CH IS BETWEEN 96 AND 123 DO...
            [(and (>= (char->integer ch) 97) (<= (char->integer ch) 122))
                ;INNER COND 2
                (cond
                    ;FIRST CASE INNER COND 2
                    ;CH TO INT, SUM NUM AND CH, IF THAT IS GREATER THAN 122
                    [(> (+ num (char->integer ch)) 122)
                        ;RECURSION, 97 TO CHAR
                        (loop (integer->char 97)
                            ;, CH TO INT, SUM NUM AND CH, SUBSTRACT 123 TO
                            ;THE SUM
                            (- (+ num (char->integer ch)) 123))]
                    ;SECOND CASE INNER COND 2
                    ;CH TO INT, SUM NUM AND CH, IF THAT IS LESS THAN 97 DO...
                    [(< (+ num (char->integer ch)) 97)
                        ;RECURSION 97 TO CH
                        (loop (integer->char 97)
                            ;CH TO INT, SUM NUM AND CH, SUBSTRACT THE SUMATION
                            ; TO 97 AND SUBSTRACT THE SUBSTRACITON TO 26
                            (- 26 (- 97 (+ num (char->integer ch)))))]
                    ;ELSE CASE, CH TO INT, SUM NUM AND CH, CONVERT SUM TO CHAR
                    [else (integer->char (+ num (char->integer ch)))])]
            ;ELSE CASE OUTTER COND RETURN CH
            [else ch])))


;4.- caesar-encode: Takes a string,  an integer and a boolean.
;If the boolean value is false, the function will encode the string by shifting
;each of its letter characters the distance indicated by the integer.
;If the boolean is false, the function will decode the string,
;by using the negative of the integer.
;Characters that are not letters should not be changed.
;The functions string->list and list->string can help.


(define (caesar-encode string num boolean)
;TAIL RECURSION VARIATION DEFINITION OF LOOP AND VARIABLES (LET CONSTANT)
    (let loop
        ;VAR DECLARATION
        ([string string] [num num] [boolean boolean] [result empty])
    ;OUTTER COND FOR SOME CASES
    (cond
        ;FIRST CASE CHANGE BOOL
        [(not boolean)
            ;INNER COND FOR SOME CASES
            (cond
                ;FIRST CASE IF THE LENGTH OF THE STRING IS EQUAL TO 1 DO...
                [(= (string-length string) 1)
                    ;CONVERT LIST TO STRING AND APPEND 
                    (list->string (append result
                        ;STTRING TO LIST, CALL SHIFT-CHAR WITH THE FIRST CHAR
                        ; AND THE NUM AND CONVERT IT TO A LIST
                        (list (shift-char (car (string->list string)) num))))]
                ;SECOND CASE IF STRING IS GREATER THAN 1 DO...
                [(> (string-length string) 1)
                    ;RECURSION POPING THE FIRST CHAR FROM STRING
                    (loop (substring string 1) num boolean
                        ;STRING TO LIST TAKING FIRST CHAR CALLING SHIFT-CHAR
                        ;WITH THAT AND NUM, CONVERT TO A LIST AND APPENDING TO
                        ;RESULT
                        (append result
                            (list (shift-char
                                (car (string->list string)) num))))])]
        ;SECOND CASE IF SOME BOOLEAN
        [boolean
            ;INNER COND FOR SOME CASES
            (cond
                ;FIRST CASE INNER COND IF LENGTH OF THE STRING IS 1 DO...
                [(= (string-length string) 1)
                    ;LIST TO STRING WITH THE APPEND OF RESULT AND THE LIST
                    (list->string (append result
                        ;STRING TO LIST, TAKE FIRST CHAR, CALL SHIFT-CHAR WITH
                        ; THAT AND THE MULTIPLICATION OF NUM AND -1
                        ;CONVERT ALL INTO A LIST
                        (list (shift-char (car (string->list string))
                            (* num -1)))))]
                ;SECOND CASE INNER COND IF STRING LENGTH IS GREATER THAN 1 DO...
                [(> (string-length string) 1)
                    ;RECURSION WITH THE STRING WITHOUT THE FIRST CHAR, NUM, BOOL
                    (loop (substring string 1) num boolean
                        ;STRING TO LIST, TAKE THE FIRST CHAR, MULTIPLY NUM AND
                        ; -1, CALL SHIFT-CHAR, CONVERT ALL INTO A LIST, APPEND
                        ;THAT WITH RESULT
                        (append result (list (shift-char
                            (car (string->list string)) (* num -1)))))])])))
