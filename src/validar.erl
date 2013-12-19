-module(validar).
-export([funcion/1]).

funcion(A)->
    C = funcion(A,0),
    count(A,C+1,0,[]).

count([],N1,N2,T)->
	true;
 count([H|T],N1,N2,_T2)->
  	validar_count(H,N1,N2,T).

validar_count([],N,N,T)->
	count(T,N,0,T);
    
validar_count([],N1,N2,T)->
    false;

validar_count([H|T],N1,N2,T2)->
    validar_count(T,N1,N2+1,T2).

funcion([],N)->
    N;
funcion([H|T],N)->
        funcion(T,N+1).

