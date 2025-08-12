vuelo("ARG845", 30, [escala(rosario,0), tramo(2), escala(buenosAires,0)]).
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
    findall(T, (member(tramo(T),Destinos);member(escala(_,T),Destinos)),Tiempos),
    sum_list(Tiempos, TiempoVuelo).

tiempoEspera(Vuelo,TiempoEspera):-
    vuelo(Vuelo,_,Destinos),
    findall(T, (member(escala(_,T),Destinos)),Tiempos),
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


    

    