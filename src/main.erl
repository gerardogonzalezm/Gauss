-module(main).
-export([funcion/1]).
-import(gauss2).


funcion(L)->
	gauss2:metodo(L).


