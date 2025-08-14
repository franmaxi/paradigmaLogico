viaja(lola, avion(latam, 180, internacional)).
viaja(lola, bicicleta(urbana)).
viaja(fran, tren(retiroRosario, 90)).
viaja(fran, avion(aerolineas, 90, domestico)).
viaja(fran, tren(cabaLujan, 70)).
viaja(lucia, avion(united, 300, internacional)).
viaja(melina,tren(ramosCiudadela,100)).
viaja(melina,tren(sarmiento,100)).


noEsSustentable(Persona):-
  findall(A, (viaja(Persona, avion(A,_,internacional))), Aviones),
  findall(T, viaja(Persona, tren(T,_)), Trenes),
  findall(V, viaja(Persona, V), Todos),
  length(Aviones, CAviones),
  length(Trenes, CTrenes),
  length(Todos, CTodos),
  CTodos is CAviones + CTrenes.

    
/*
    Si preguntamos por noEsSustentable(lola).
    1er findall: Crea una lista con las aerolineas que utilizo esta persona y que sean de vuelos internacionales
    2er findall: Crea una lista con los tramos de los trenes que recorrio esta persona.
    3er findall: Crea una lista con todos los medios de transporte que utlizo esta persona
    Luego calcula la longitud de las 3 listas
    y pregunta si CTodos (Todos los medios de transporte) es igual a la suma entre viajes de avion y de tren.


    No es sustentable si utiliza aviones internacionales o trenes

    No utiliza polimorfismo porque aunque sea de distinto tipos estamos haciendo una lista y despues sacarle la longitud, 
    no lo estamos implementado.
*/

noEsSustentable2(Persona):-
  forall(viaja(Persona,Transporte), Transporte = tren(_,_)).

noEsSustentable2(Persona):-
  forall(viaja(Persona,Transporte), Transporte = avion(_,_,internacional)).



viajeNoSustentable(tren(_,_)).
viajeNoSustentable(avion(_,_,internacional)).

noEsSustentable3(Persona):-
  viaja(Persona,_),
  forall(viaja(Persona,Transporte), viajeNoSustentable(Transporte)).

  /*
    En esta solucion estamos utilizando polimorfismo, estamos implementando functores y utilizando la implementacion 
    de Transporte.
  
  */