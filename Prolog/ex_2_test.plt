/*
Unit tests for next day function

Gilberto Echeverria
06/11/2020
*/

% Indicate the name for the tests
:- begin_tests(next_day).
% Import the knowledge base
:- include(ex_2_next_day).

% Test for leap year
test(is_leap_2000) :-
    is_leap(2000).
test(is_leap_2100, [fail]) :-
    is_leap(2100).
test(is_leap_2019, [fail]) :-
    is_leap(2019).
test(is_leap_1999, [fail]) :-
    is_leap(1999).
test(is_leap_2020) :-
    is_leap(2020).
test(is_leap_2016) :-
    is_leap(2016).

% Test cases
test(next_day_1_1_2020) :-
    next_day(1, 1, 2020, 2, 1, 2020).
test(next_day_31_1_2020) :-
    next_day(31, 1, 2020, 1, 2, 2020).
test(next_day_28_2_2020) :-
    next_day(28, 2, 2020, 29, 2, 2020).
test(next_day_29_2_2020) :-
    next_day(29, 2, 2020, 1, 3, 2020).
test(next_day_28_2_2021) :-
    next_day(28, 2, 2021, 1, 3, 2021).
test(next_day_31_12_2020) :-
    next_day(31, 12, 2020, 1, 1, 2021).

:- end_tests(next_day).
