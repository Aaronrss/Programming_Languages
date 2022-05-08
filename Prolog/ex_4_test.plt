/*
Unit tests for list relations

Gilberto Echeverria
10/11/2020
*/

% Indicate the name for the tests
:- begin_tests(list_functions).
% Import the knowledge base
:- include(ex_4_lists).

%%% Length of a list %%%

% Test for regular recursion
test(tec_length_empty_list) :-
    tec_length([], 0).
test(tec_length_single_element) :-
    tec_length([1], 1).
test(tec_length_two_elements) :-
    tec_length([1, 2], 2).
test(tec_length_three_elements) :-
    tec_length([1, 2, 3], 3).

% Test for tail recursion
test(tail_length_empty_list) :-
    tail_length([], 0).
test(tail_length_single_element) :-
    tail_length([1], 1).
test(tail_length_two_elements) :-
    tail_length([1, 2], 2).
test(tail_length_three_elements) :-
    tail_length([1, 2, 3], 3).

%%% Addition of elements in a list %%%

% Regular recursion
test(tec_sum_list_empty_list) :-
    tec_sum_list([], 0).
test(tec_sum_list_single_element) :-
    tec_sum_list([1], 1).
test(tec_sum_list_two_elements) :-
    tec_sum_list([1, 2], 3).
test(tec_sum_list_three_elements) :-
    tec_sum_list([1, 2, 3], 6).

% Tail recursion
test(tail_sum_list_empty_list) :-
    tail_sum_list([], 0).
test(tail_sum_list_single_element) :-
    tail_sum_list([1], 1).
test(tail_sum_list_two_elements) :-
    tail_sum_list([1, 2], 3).
test(tail_sum_list_three_elements) :-
    tail_sum_list([1, 2, 3], 6).

%%% Last element in a list %%%
test(last_empty_list, [fail]) :-
    tec_last([], _).
test(last_single_element) :-
    tec_last([4], 4).
test(last_two_elements) :-
    tec_last([6, 4], 4).
test(last_three_elements) :-
    tec_last([6, 8, 4], 4).

%%% Reverse a list %%%
test(reverse_empty_list) :-
    tec_reverse([], []).
test(reverse_single_element_list) :-
    tec_reverse([a], [a]).
test(reverse_two_element_list) :-
    tec_reverse([a, b], [b, a]).
test(reverse_multiple_element_list) :-
    tec_reverse([a, b, c, d, e], [e, d, c, b, a]).

%%% Append two lists %%%
test(append_two_empty_lists) :-
    tec_append([], [], []).
test(append_list_to_empty_list) :-
    tec_append([a, b, c], [], [a, b, c]).
test(append_empty_list_to_list) :-
    tec_append([], [x, y, z], [x, y, z]).
test(append_two_lists) :-
    tec_append([a, b, c], [x, y, z], [a, b, c, x, y, z]).

:- end_tests(list_functions).
