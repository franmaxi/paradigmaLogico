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
% 1
puedeEntrar(Mago,slytherin):-
    mago(Mago,_,impura,_),
    not(mago(Mago,impura,_,_)).

puedeEntrar(_,gryffindor).
puedeEntrar(_,ravenclaw).
puedeEntrar(_,hufflepuff).
% 2

tieneCaracterApropiado(Mago,Casa):-
    mago(Mago,_,_,Caracteristicas),
    entrada(Casa,_),
    forall(entrada(Casa,Caracteristica), member(Caracteristica,Caracteristicas)).
    
%3 

puedeIngresarA(Mago,Casa):-
    tieneCaracterApropiado(Mago,Casa),
    puedeEntrar(Mago,Casa),
    not(odiaLaCasa(Mago,Casa)).

odiaLaCasa(Mago,Casa):-
    mago(Mago,_,Casa,_).

% 4
cadenaDeAmistades([]).
cadenaDeAmistades([_]).
cadenaDeAmistades([M1,M2|Resto]):-
    tiene(M1,Caracteristica),
    tiene(M2,Caracteristica),
    puedeIngresarA(M1,Casa),
    puedeIngresarA(M2,Casa),
    cadenaDeAmistades([M2|Resto]).

tiene(Mago,Caracteristica):-
    mago(Mago,_,_,Caracteristicas),
    member(Caracteristica,Caracteristicas).
