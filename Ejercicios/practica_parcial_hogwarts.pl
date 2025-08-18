%mago(Nombre,StatusSangre,CasaOdiada,Caracteristicas)
mago(harry,mestiza,slytherin,[corajudo,amistoso,orgulloso,inteligente]).
mago(draco,pura,hufflepuff,[orgulloso,inteligente]).
mago(hermione,impura,ninguna,[orgulloso,responsable,inteligente,corajudo]).


entrada(gryffindor,corajudo).
entrada(slytherin,orgulloso).
entrada(slytherin,inteligente).
entrada(ravenclaw,inteligente).
entrada(ravenclaw,responsable).
entrada(hufflepuff,amistoso).

puedeEntrar(Mago,gryffindor):-
    entrada(gryffindor,_),
    mago(Mago,Sangre,_,Caracteristicas),
    tieneCaracteristicas(gryffindor,Caracteristicas),
    Sangre \= impura.

puedeEntrar(Mago,Casa):-
    entrada(Casa,_),
    Casa \= gryffindor,
    mago(Mago,_,_,Caracteristicas),
    tieneCaracteristicas(Casa,Caracteristicas).

tieneCaracteristicas(Casa,Caracteristicas):-
    forall(entrada(Casa,Caracteristica),member(Caracteristica,Caracteristicas)).

tieneCaracterApropiado(Mago,Casa):-
    entrada(Casa,_),
    mago(Mago,_,_,Caracteristicas),
    tieneCaracteristicas(Casa,Caracteristicas).


quedoSeleccionado(hermione,gryffindor).

quedoSeleccionado(Mago,Casa):-
    mago(Mago,_,_,_),
    entrada(Casa,_),
    tieneCaracterApropiado(Mago,Casa),
    puedeEntrar(Mago,Casa),
    not(odiaLaCasa(Mago,Casa)).

odiaLaCasa(Mago,Casa):-
    mago(Mago,_,CasaOdiada,_),
    CasaOdiada = Casa.

cadenaDeAmistades([]).
cadenaDeAmistades([_]).

cadenaDeAmistades([UnMago,OtroMago|Magos]):-
    esAmistoso(UnMago),
    esAmistoso(OtroMago),
    compartenCasa(UnMago,OtroMago),
    cadenaDeAmistades([OtroMago|Magos]).

esAmistoso(Mago):-
    mago(Mago,_,_,Caracteristicas),
    member(amistoso,Caracteristicas).

compartenCasa(UnMago,OtroMago):-
    puedeEntrar(UnMago,Casa),
    puedeEntrar(OtroMago,Casa).

/*-------------------------------------------------------------------------------*/

accion(harry,buena(actividad(vencerAVoldemort,60))).
accion(hermione,buena(actividad(salvarAmigos,50))).
accion(ron,buena(actividad(ganarPartidaEnAjedrez,50))).
accion(hermione,buena(pregunta(comoLevitarLaPluma,25,flitwick))).
accion(hermione,buena(pregunta(dondeEstaBezoear,20,snape))).



accion(hermione,mala(lugarprohibido(biblioteca,10))).
accion(hermione,mala(lugarprohibido(tercerPiso,75))).
accion(harry,mala(lugarprohibido(tercerPiso,75))).
accion(harry,mala(lugarprohibido(bosque,50))).
accion(harry,mala(lugarprohibido(andarDeNoche,50))).


esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).

esBuenAlumno(Mago):-
    not(accion(Mago,mala(_))).

esRecurrente(Accion):-
    accion(Mago1,buena(Accion,_)),
    accion(Mago2,buena(Accion,_)),
    Mago1 \= Mago2.

esRecurrente(Lugar):-
    accion(Mago1,mala(lugarprohibido(Lugar,_))),
    accion(Mago2,mala(lugarprohibido(Lugar,_))),
    Mago1 \= Mago2.

puntajeTotalCasa(Casa,PuntajeTotal):-
    sumarPuntos(Casa,TotalBueno),
    restarPuntos(Casa,TotalMalo),
    PuntajeTotal is TotalBueno - TotalMalo. 

sumarPuntos(Casa,TotalBueno):-
    findall(Puntaje,(
    esDe(Mago,Casa),
    accion(Mago,buena(Accion)),
    puntajeAccionBuena(Accion,Puntaje)
    ),
    ListaDePuntos),
    sum_list(ListaDePuntos,TotalBueno).

restarPuntos(Casa,TotalMalo):-
    findall(Puntaje,(
    esDe(Mago,Casa),
    accion(Mago,mala(lugarprohibido(_,Puntaje)))
    ),
    ListaDePuntos),
    sum_list(ListaDePuntos,TotalMalo).

casaGanadora(CasaGanadora):-
    findall(C,esDe(_,C),CasasDuplicadas),
    list_to_set(CasasDuplicadas,Casas),
    findall(casa(C,Puntaje),(member(C,Casas),puntajeTotalCasa(C,Puntaje)),Lista),
    max_member(casa(CasaGanadora,_),Lista).

puntajeAccionBuena(actividad(_,Puntaje),Puntaje).
puntajeAccionBuena(pregunta(_,Dificultad,snape),Puntaje):- Puntaje is Dificultad / 2.
puntajeAccionBuena(pregunta(_,Dificultad,_),Puntaje):- Puntaje is Dificultad.
   