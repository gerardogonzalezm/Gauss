-module(gauss2).
-export([metodo/1]).
-import(validar).
-import(imprime).

metodo(L)-> 
 Ok= validar:funcion(L),	
 conver_uno(L,0,0,L,Ok).

conver_uno(_,_,_,_,false)->
	io:format("Matriz invalida  ~n");

conver_uno([],_,_,L,_OK)->
	C=elements(L,0),
	imprime:print(L,C);

conver_uno([H|T],C,C,L,Ok)->
    LineaPivote= pivote(H,new_pivote(H,C),C),
    New=remplace(L,LineaPivote,C,0),
    LineaNew=conver_cero(LineaPivote,New,C),
    conver_uno(LineaNew,C+1,0,LineaNew,valida(T,C));

conver_uno([_H|T],C1,C2,L,OK)->
     conver_uno(T,C1,C2+1,L,OK).

valida([],_)->
    true;

valida([H|_T],C)->
    validaPivote(new_pivote(H,C)).

validaPivote(N) when N =:= 0  ->
    false;
validaPivote(_N)->
    true.

    remplace([],_Ln,_P,_C)->
    [] ;
remplace([_H|T],Ln,P,P) ->
        [Ln|remplace(T,Ln,P,P+1)];

remplace([H|T],Ln,P,C) ->
            [H|remplace(T,Ln,P,C+1)].

pivote(L,P,_C) ->
    [ X/P || X<- L].

new_pivote([H|_T],0)->
	H;
new_pivote([_H|T],C)->
	new_pivote(T,C-1).

obtener_valor([H|_T],C,C)->
   H;
obtener_valor([_H|T],B,C) ->
    obtener_valor(T,B,C+1).

conver_cero(Lp,Lb,C) ->
    conver_cero(Lp,Lb,Lb,0,C).

conver_cero(_L,[],Lb,_,_) ->
    Lb;

conver_cero(L,[L|T],Lb,C1,C2)->
    conver_cero(L,T,Lb,C1+1,C2);

conver_cero(L,[H|T],Lb,C1,C2) ->
    V= compare(obtener_valor(H,C2,0)),
    New=new_Row(L,V),
    New2=create_NewRow(New,H),
    Acc=remplace(Lb,New2,C1,0),
    conver_cero(L,T,Acc,C1+1,C2).

new_Row(L,Fe) ->
    [X * Fe || X<-L].

create_NewRow([],[]) ->
    [];
create_NewRow([H1|T1],[H2|T2]) ->
    [H1+H2|create_NewRow(T1,T2)].

compare(F) when F<0 ->
   -(F);
compare(F) ->
    -F.
elements([],N)->
	N;
elements([H|T],N)->
	elements(T,N+1).

