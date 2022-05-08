/* fibonacci(N,R) :-
    N > 1,
    N1 is N - 1,
    fibonacci(N1,R1),
    N2 is N - 2,
    fibonacci(N2,R2),
    R is R1 + R2. */

fib_seq(0,[0]).                   % <- base case 1
fib_seq(1,[0,1]).                 % <- base case 2
fib_seq(N,Seq) :-
   N > 1,
   fib_seq_(N,SeqR,1,[1,0]),      % <- actual relation (all other cases)
   reverse(SeqR,Seq).             % <- reverse/2 from library(lists)

fib_seq_(N,Seq,N,Seq).
fib_seq_(N,Seq,N0,[B,A|Fs]) :-
   N > N0,
   N1 is N0+1,
   C is A+B,
   fib_seq_(N,Seq,N1,[C,B,A|Fs]). % <- tail recursion