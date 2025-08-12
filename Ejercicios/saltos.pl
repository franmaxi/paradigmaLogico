puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

% Hasta 5 saltos por competidor

% 1
puntajeEnElSalto(Nombre,Indice,Resultado):-
    puntajes(Nombre,Saltos),
    Total is Indice - 1, 
    nth0(Total, Saltos, Resultado).

/* 
    Lo que hace nt0 es dado un Indice y una lista retorna el elemento que se encuentra en el indice indicado de la lista
*/

% 2

estaDescalificado(Nombre):-
    puntajes(Nombre,Saltos),
    length(Saltos,CantidadDeSaltos),
    CantidadDeSaltos > 5.

% 3
tieneDosSaltosPerfectos(Nombre):-
    puntajes(Nombre,Saltos),
    findall(S, (member(S,Saltos), S > 8), SaltosPerfectos),
    length(SaltosPerfectos,Longitud),
    Longitud >= 2.

clasificaALaFinal(Nombre):-
    tieneDosSaltosPerfectos(Nombre).

clasificaALaFinal(Nombre):-
    puntajes(Nombre,Saltos),
    sumlist(Saltos, Sumatoria),
    Sumatoria >= 28.
    
/*
    El findall(Elemento,Condicion/Condiciones,ListaGeneradaDeElementos)
    
*/