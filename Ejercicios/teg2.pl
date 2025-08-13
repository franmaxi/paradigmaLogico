/* distintos paises */
paisContinente(argentina, americaDelSur).
paisContinente(bolivia, americaDelSur).
paisContinente(brasil, americaDelSur).
paisContinente(chile, americaDelSur).
paisContinente(ecuador, americaDelSur).
paisContinente(alemania, europa).
paisContinente(espana, europa).
paisContinente(francia, europa).
paisContinente(inglaterra, europa).
paisContinente(aral, asia).
paisContinente(china, asia).
paisContinente(gobi, asia).
paisContinente(india, asia).
paisContinente(iran, asia).

/*países importantes*/
paisImportante(argentina).
paisImportante(kamchatka).
paisImportante(alemania).

/*países limítrofes*/
limitrofes([argentina,brasil]).
limitrofes([bolivia,brasil]).
limitrofes([bolivia,argentina]).
limitrofes([argentina,chile]).
limitrofes([espana,francia]).
limitrofes([alemania,francia]).
limitrofes([nepal,india]).
limitrofes([china,india]).
limitrofes([nepal,china]).
limitrofes([afganistan,china]).
limitrofes([iran,afganistan]).

/*distribución en el tablero */
ocupa(argentina, azul, 4).
ocupa(bolivia, rojo, 1).
ocupa(brasil, verde, 4).
ocupa(chile, negro, 3).
ocupa(ecuador, rojo, 2).
ocupa(alemania, azul, 3).
ocupa(espana, azul, 1).
ocupa(francia, azul, 1).
ocupa(inglaterra, azul, 2). 
ocupa(aral, negro, 2).
ocupa(china, verde, 1).
ocupa(gobi, verde, 2).
ocupa(india, rojo, 3).
ocupa(iran, verde, 1).

/*continentes*/
continente(americaDelSur).
continente(europa).
continente(asia).

/*objetivos*/
objetivo(rojo, ocuparContinente(asia)).
objetivo(azul, ocuparPaises([argentina, bolivia, francia, inglaterra, china])).
objetivo(verde, destruirJugador(rojo)).
objetivo(negro, ocuparContinente(europa)).

% 1
estaEnContinente(Jugador,Continente):-
    ocupa(Pais,Jugador,_),
    paisContinente(Pais,Continente).

% 2
cantidadPaises(Jugador,Cantidad):-
    ocupa(_,Jugador,_),
    findall(P,ocupa(P,Jugador,_),Paises),
    length(Paises,Cantidad).
% 3
jugador(Jugador):-
    ocupa(_,Jugador,_).

 ocuparContinente(Jugador,Continente):-
    continente(Continente),
    jugador(Jugador),
    forall(paisContinente(Pais,Continente),ocupa(Pais,Jugador,_)).

% 4