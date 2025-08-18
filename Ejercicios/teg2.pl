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
ocupa(bolivia, azul, 1).
ocupa(brasil, verde, 4).
ocupa(chile, negro, 3).
ocupa(ecuador, rojo, 2).
ocupa(alemania, azul, 3).
ocupa(espana, azul, 1).
ocupa(francia, azul, 1).
ocupa(inglaterra, azul, 2). 
ocupa(aral, negro, 2).
ocupa(china, azul, 1).
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
objetivo(verde, ocuparContinente(americaDelSur)).
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

 ocupaContinente(Jugador,Continente):-
    continente(Continente),
    jugador(Jugador),
    forall(paisContinente(Pais,Continente),ocupa(Pais,Jugador,_)).

% 4
% leFaltaMucho(Jugador,Continente):-
%     jugador(Jugador),
%     continente(Continente),
%     cantidadPaisesPorContinente(Continente,CantidadTotalPaises),
%     cantidadPaisesPorJugador(Jugador,Continente,CantidadPaises),
%     CantidaTotalPaises - CantidadPaises >= 2.

% 5 
sonLimitrofes(UnPais,OtroPais):-
    limitrofes(Limitrofes),
    member(UnPais,Limitrofes),
    member(OtroPais,Limitrofes).

% 9
capoCannoniere(Jugador):-
    findall((Cantidad,Jugador),cantidadPaises(Jugador,Cantidad),Lista),
    max_member((_,Jugador), Lista).
% 10
ganadooor(Jugador):-
    objetivo(Jugador,Objetivo),
    cumplioObjetivo(Jugador,Objetivo).


cumplioObjetivo(azul,ocuparPaises(Lista)):- forall(member(Pais,Lista),ocupa(Pais,azul,_)).

cumplioObjetivo(Jugador,ocuparContinente(Continente)):-
    relacionContinenteJugador(Jugador,Continente),
    ocupaContinente(Jugador,Continente).

relacionContinenteJugador(rojo,asia).
relacionContinenteJugador(negro,europa).
relacionContinenteJugador(verde,americaDelSur).
    
    