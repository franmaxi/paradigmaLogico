anotado(ana,paradigmas,25).
anotado(ana,fisicaII,9).
anotado(beto,paradigmas,25).
anotado(camilo,paradigmas,25).

fecha(paradigmas,11).
fecha(paradigmas,18).
fecha(paradigmas,25).
fecha(fisicaII, 9).
fecha(fisicaII,16).
fecha(fisicaII,23).

ultimaFecha(Materia,Fecha):- 
    findall(Dia, fecha(Materia, Dia), Fechas),
    max_list(Fechas, Fecha).


ultimaFecha1(Materia, Fecha) :-
    fecha(Materia,Fecha),
    not((fecha(Materia, OtraFecha), OtraFecha > Fecha)).


    