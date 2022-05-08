/*
Unit tests for factorial functions

Gilberto Echeverria
10/11/2020
*/

% Indicate the name for the tests
:- begin_tests(factorial_functions).
% Import the knowledge base
:- include(ex_3_factorial).

% Test for regular recursion
test(factorial_2) :-
    factorial(2, 2).
test(factorial_3) :-
    factorial(3, 6).
test(factorial_4) :-
    factorial(4, 24).
test(factorial_5) :-
    factorial(5, 120).

% Test for tail recursion
test(tail_factorial_2) :-
    factorial(2, 1, 2).
test(tail_factorial_3) :-
    factorial(3, 1, 6).
test(tail_factorial_4) :-
    factorial(4, 1, 24).
test(tail_factorial_5) :-
    factorial(5, 1, 120).

% Test for tail recursion entry
test(tail_factorial_2) :-
    tfact(2, 2).
test(tail_factorial_3) :-
    tfact(3, 6).
test(tail_factorial_4) :-
    tfact(4, 24).
test(tail_factorial_5) :-
    tfact(5, 120).

:- end_tests(factorial_functions).
