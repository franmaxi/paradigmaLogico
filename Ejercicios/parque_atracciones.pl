persona(nina,22,1.60).
persona(marcos,8,1.32).
persona(osvaldo,13,1.29).

atraccion(trenFantasma,edad(12)).
atraccion(montaniaRusa,altura(1.30)).
atraccion(maquinaTiquetera,sinRequisito).

atraccion(laOlaAzul,altura(1.50)).
atraccion(corrienteSerpenteante,sinRequisito).
atraccion(maremoto,edad(5)).
atraccion(pocoyo,edad(23)).

% 1
puedeSubir(Persona,Atraccion):-
    atraccion(Atraccion,sinRequisito),
    persona(Persona,_,_).

puedeSubir(Persona,Atraccion):-
    atraccion(Atraccion,Requisito),
    persona(Persona,_,_),
    cumpleRequisito(Persona,Requisito).

cumpleRequisito(Persona,edad(EdadMinima)):-
    persona(Persona,Edad,_),
    Edad  >= EdadMinima.

cumpleRequisito(Persona,altura(AlturaMinima)):-
    persona(Persona,_,Altura),
    Altura >= AlturaMinima.

% 2
esParaElle(Persona,Parque):-
    persona(Persona,_,_),
    parque(Parque,_),
    forall(parque(Parque,Atraccion),puedeSubir(Persona,Atraccion)).

parque(deLaCosta,trenFantasma).
parque(deLaCosta,montaniaRusa).
parque(deLaCosta,maquinaTiquetera).

parque(acuatico,laOlaAzul).
parque(acuatico,corrienteSerpenteante).
parque(acuatico,maremoto).

% 3 
malaIdea(Grupo,Parque):-
    not((parque(Parque,Atraccion),
        forall(member(Persona,Grupo),puedeSubir(Persona,Atraccion)) 
        )).


programa(acuatico,[laOlaAzul,maremoto,pocoyo,corrienteSerpenteante]).

programaLogico(Programa):-
    programa(Programa,Atracciones),
    sinRepetidos(Atracciones),    
    forall(member(Atraccion,Atracciones), parque(Programa,Atraccion)).

sinRepetidos(Atracciones):-
    length(Atracciones, TotalConRepetidos),
    list_to_set(Atracciones, SinRepetidos),
    length(SinRepetidos, TotalSinRepetidos),
    TotalSinRepetidos is TotalConRepetidos.


hastaAca(_,[ ],[]).
hastaAca(Persona,[Atraccion|Resto],[Atraccion|SubResto]):-
    puedeSubir(Persona,Atraccion),
    hastaAca(Persona,Resto,SubResto).

hastaAca(Persona, [Atraccion|_], []) :-
    persona(Persona,_,_),
    not(puedeSubir(Persona, Atraccion)).

juegoComun(maquinaTiquetera,200).
juegoComun(trenFantasma,1000).
juegoComun(rioLento,300).

juegoPremium(montaniaRusa).
juegoPremium(piscinaDeOlas).
juegoPremium(toboganGigante).

pasaporte(nina,basico(2000)).
pasaporte(osvaldo,basico(500)).
pasaporte(pedro,premium).
pasaporte(marcos,flex(3000,montaniaRusa)).
pasaporte(juan,premium).
pasaporte(nico,basico(1500)).

puedoSubirConPasaporte(Persona,Atraccion):-
    puedeSubir(Persona,Atraccion),
    pasaporte(Persona,Pasaporte),
    habilitado(Pasaporte,Atraccion).

habilitado(premium,_).

habilitado(basico(Puntos),Atraccion):-
    juegoComun(Atraccion,Valor),
    Puntos >= Valor.

habilitado(flex(_,Atraccion),Atraccion):-
    juegoPremium(Atraccion).

habilitado(flex(Puntos,_),Atraccion):-
    habilitado(basico(Puntos),Atraccion).
    
    
    