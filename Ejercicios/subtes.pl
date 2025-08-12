linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).

%linea(Nombre,[Estaciones])
% combinacion([Estaciones])

combinacion([lima, avMayo]).
combinacion([once, miserere]).
combinacion([pellegrini, diagNorte, nueveJulio]).
combinacion([independenciaC, independenciaE]).
combinacion([jujuy, humberto1ro]).
combinacion([santaFe, pueyrredonD]).
combinacion([corrientes, pueyrredonB]).


% 1 estaEn/2
estaEn(Estacion,Linea):-
    linea(Linea,Estaciones),
    member(Estacion,Estaciones).

% 2 distancia/3

distancia(Estacion1,Estacion2, Absolute):-
    linea(_,Estaciones),
    nth0(Indice1,Estaciones,Estacion1),
    nth0(Indice2,Estaciones,Estacion2),
    Distancia is Indice1 - Indice2,
    Absolute is abs(Distancia).
    

/*
    Para utilizar abs/1 tenemos que utilizar una operacion aritmetica
*/
    
% 3 mismaAltura

mismaAltura(Estacion1,Estacion2):-
    linea(_,Estaciones1),
    linea(_,Estaciones2),
    nth0(Indice1,Estaciones1,Estacion1),
    nth0(Indice2,Estaciones2,Estacion2),
    Indice1 = Indice2.
    
% 4 viajeFacil/2
viajeFacil(UnaEstacion,OtraEstacion):-
    mismaLinea(UnaEstacion,OtraEstacion).

viajeFacil(UnaEstacion,OtraEstacion):-
    haceCombinacion(UnaEstacion,OtraEstacion).

haceCombinacion(UnaEstacion,OtraEstacion):-
    combinacion([C1,C2]),
    mismaLinea(UnaEstacion,C2),
    mismaLinea(OtraEstacion,C1).

haceCombinacion(UnaEstacion,OtraEstacion):-
    combinacion([C1,C2]),
    mismaLinea(UnaEstacion,C1),
    mismaLinea(OtraEstacion,C2).

mismaLinea(UnaEstacion,OtraEstacion):-
    linea(_,Estaciones),
    member(UnaEstacion,Estaciones),
    member(OtraEstacion,Estaciones).
