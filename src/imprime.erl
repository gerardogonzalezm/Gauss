-module(imprime).
-export([print/2]).

print([],_)->
	[];

print([H|T],N)->
	[nuevo(H,N,[])|print(T,N)].

nuevo([H|_T],0,Acc)->
	[Acc | H];

nuevo([H|T],N,Acc)->
	Out = Acc ++ [H],
	nuevo(T,N-1,Out).
