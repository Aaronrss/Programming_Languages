/*
HW 08 Prolog lists

Aaron Rosas
2021-11-13
*/

/*
1.- in_list
Take two arguments, a list and an element, and determine if the element can be
found inside the list.
*/
in_list([Head|Tail], Char) :-
    Head = Char;
    in_list(Tail, Char).

/*
2.- element_at
Take as argument an index and a list, and return the element at index n of the
list. Indices start at 0. If the index is negative, then you should start
counting from the right side, where the last element in the list has index -1.
*/
element_at(0,[Head|_Tail],Head).
element_at(Index,[_Head|Tail],Element) :-
    Index > 0,
    Index1 is Index - 1,
    element_at(Index1,Tail,Element).
element_at(Index,[_Head|Tail],Element) :-
    Index < 0,
    reverse(List, ListR),
    Index1 is Index + 1,
    element_at(Index1, Tail, Element).
  
/*
3.- range
Take as arguments a starting and ending number, as well as an increment and a
list. The list will be a collection of numbers from start to finish, with the
increment specified.  The top limit is not inclusive. If it is not possible to
get from start to finish with the increment provided, return an empty list.
*/
% Base case, returns an empty list
/* range(Start, End, _Step, []) :-
    Start = End;
    Start >= End,
    Step > 0. */

range(Start, End, _Step, []) :-
    Start >= End.
% Recursive case. Start is the first element in this list
range(Start, End, Step, [Start | Temp]) :-
    Start < End,
    S1 is Start + Step,
    % The recursive call produces a sublist
    range(S1, End, Step, Temp).

/*
4.- remove_doubles
Take as argument a list, and generate a list without contiguous elements that
are duplicated.
*/
remove_doubles([],[]).
remove_doubles([L],[L]).
remove_doubles([Head,Head|Tail],Result) :-
    remove_doubles([Head | Tail], Result).
remove_doubles([HeadA,HeadB|Tail], [HeadA|TailR]) :-
    HeadA \= HeadB,
    remove_doubles([HeadB|Tail], TailR).

/*
5.- fibonacci
Take as argument a positive integer, and generate a list containing the numbers
in the Fibonacci sequence, starting at index 0 with the value 0. 
*/

fibonacci(0,[0]).
fibonacci(1,[0,1]).
fibonacci(N,R) :-
    N > 1,
    fibonacci(N,R,1,[0,1]).
fibonacci(N,R,N,R).
fibonacci(N,R,N0,[Fs|A,B]) :-
    N > N0,
    N1 is N0 + 1,
    C is A + B,
    fibonacci(N, R, N1, [Fs|A,B,C]))

/* fibonacci(N,R) :-
    N > 1,
    N1 is N - 1,
    fibonacci(N1,R1),
    N2 is N - 2,
    fibonacci(N2,R2),
    R is R1 + R2. */