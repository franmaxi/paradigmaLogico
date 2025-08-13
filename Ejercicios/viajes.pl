vuelo("ARG845", 30, [escala(rosario,4), tramo(1), escala(buenosAires,10)]).
vuelo("MH101", 95, [escala(kualaLumpur,0), tramo(9), escala(capeTown,2),
tramo(15), escala(buenosAires,0)]).
vuelo("DLH470", 60, [escala(berlin,0), tramo(9), escala(washington,2), tramo(2), escala(nuevaYork,0)]).
vuelo("AAL1803", 250, [escala(nuevaYork,0), tramo(1), escala(washington,2),
tramo(3), escala(ottawa,3), tramo(15), escala(londres,4), tramo(1),
escala(paris,0)]).
vuelo("BLE849", 175, [escala(paris,0), tramo(2), escala(berlin,1), tramo(3),
escala(kiev,2), tramo(2), escala(moscu,4), tramo(5), escala(seul,2), tramo(3), escala(tokyo,0)]).
vuelo("NPO556", 150, [escala(kiev,0), tramo(1), escala(moscu,3), tramo(5),
escala(nuevaDelhi,6), tramo(2), escala(hongKong,4), tramo(2), escala(shanghai,5), tramo(3), escala(tokyo,0)]).
vuelo("DSM3450", 75, [escala(santiagoDeChile,0), tramo(1), escala(buenosAires,2), tramo(7), escala(washington,4), tramo(15), escala(berlin,3), tramo(15), escala(tokyo,0)]).

% vuelo(CodigoVuelo,PesoToneladas,[ListaDestinos])
% Destino =
% escala y tramo
% no puede terminar en tramo.
% Los viajes son de ida y de vuelta por la misma ruta

% 1
tiempoVuelo(Vuelo,TiempoVuelo):-
    vuelo(Vuelo,_,Destinos),
    findall(T, member(tramo(T),Destinos),Tiempos),
    sum_list(Tiempos, TiempoVuelo).

tiempoEspera(Vuelo,TiempoEspera):-
    vuelo(Vuelo,_,Destinos),
    findall(T, member(escala(_,T),Destinos),Tiempos),
    sum_list(Tiempos, TiempoEspera).
    
tiempoTotal(Vuelo,TiempoTotal):-
    tiempoVuelo(Vuelo,TiempoVuelo),
    tiempoEspera(Vuelo,TiempoEspera),
    TiempoTotal is TiempoVuelo + TiempoEspera.

% 2
% escalaAburrida(Vuelo,Escalas):-
%     vuelo(Vuelo,_,Destinos),
%     findall(Nombre,
%         (member(escala(Nombre,T),Destinos),
%             T > 3
%         ) 
%     ,Escalas).
escalaAburrida(Vuelo,Escala):-
    vuelo(Vuelo,_,Destinos),
    member(escala(Escala,Tiempo),Destinos),
    Tiempo > 3.

% 3
ciudadesAburridas(Vuelo,Ciudades):-
    findall(C,escalaAburrida(Vuelo,C),Ciudades).

% 4
vueloLargo(Vuelo):-
    tiempoVuelo(Vuelo,TiempoVuelo),
    TiempoVuelo > 10.

% 5
bandaDeTres(Vuelo1,Vuelo2,Vuelo3):-
    conectado(Vuelo1,Vuelo2),
    conectado(Vuelo2,Vuelo3).

conectado(Vuelo1,Vuelo2):-
    vuelo(Vuelo1,_,Destinos1),
    vuelo(Vuelo2,_,Destinos2),
    member(escala(Ciudad,_),Destinos1),
    member(escala(Ciudad,_),Destinos2).

% 6
distanciaEntreEscalas(Ciudad1,Ciudad2,Absolute):-
    vuelo(_,_,Destinos),
    findall(Escala,member(escala(Escala,_),Destinos),Escalas),
    nth0(Indice1, Escalas, Ciudad1),
    nth0(Indice2, Escalas, Ciudad2),
    Indice1 \= Indice2,
    CantidadEscalas is Indice1 - Indice2,
    Absolute is abs(CantidadEscalas).

% 7
vueloLento(Vuelo):-
    vuelo(Vuelo,_,Destinos),
    not(vueloLargo(Vuelo)),
    forall(member(escala(Escala,_),Destinos),escalaAburrida(Vuelo,Escala)).
    