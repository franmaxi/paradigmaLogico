 tarea(basico,buscar(libro,jartum)).
 tarea(basico,buscar(arbol,patras)).
 tarea(basico,buscar(roca,telaviv)).
 tarea(intermedio,buscar(arbol,sofia)).
 tarea(intermedio,buscar(arbol,bucarest)).
 tarea(avanzado,buscar(perro,bari)).
 tarea(avanzado,buscar(flor,belgrado)).
%buscar(algo,ciudad)
%tarea(nivel,buscar())
%nivelActual(nombre,nivel)
 nivelActual(pepe,basico).
 nivelActual(lucy,intermedio).
 nivelActual(juancho,avanzado).
%idioma(ciudad,idioma)
idioma(alejandria,arabe).
 idioma(jartum,arabe).
 idioma(patras,griego).
 idioma(telaviv,hebreo).
 idioma(sofia,bulgaro).
 idioma(bari,italiano).
 idioma(bucarest,rumano).
 idioma(belgrado,serbio).
%habla(nombre,idioma)
 habla(pepe,bulgaro).
 habla(pepe,griego).
 habla(pepe,italiano).
 habla(juancho,arabe).
 habla(juancho,griego).
 habla(juancho,hebreo).
 habla(lucy,griego).
%capital(nombre,capital)
 capital(pepe,1200).
 capital(lucy,3000).
 capital(juancho,500).

% 1
destinoPosible(Persona,Ciudad):-
    nivelActual(Persona,Nivel),
    tarea(Nivel,buscar(_,Ciudad)).

idiomaUtil(Nivel,Idioma):-
    nivelActual(Persona,Nivel),
    destinoPosible(Persona,Ciudad),
    idioma(Ciudad,Idioma).

% 2
excelenteCompaniero(UnParticipante,OtroParticipante):-
    nivelActual(UnParticipante,UnNivel),
    forall(idiomaUtil(UnNivel,Idioma),habla(OtroParticipante,Idioma)).

% 3
cosasVivas([arbol,perro,flor]).

interesante(Nivel):-
    cosasVivas(Lista),
    forall(tarea(Nivel,buscar(Cosa,_)),member(Cosa,Lista)).

interesante(Nivel):-
    nivelActual(Persona,Nivel),
    destinoPosible(Persona,Ciudad),
    idioma(Ciudad,italiano).

interesante(Nivel):-
    nivelActual(_,Nivel),
    forall(nivelActual(Persona,Nivel), 
        (
            findall(C,capital(Persona,C),Lista),
            sum_list(Lista, Total),
            Total > 10000
        )
    ).

% 4 
complicado(Persona):-
    nivelActual(Persona,_),
    forall(destinoPosible(Persona,Ciudad), 
    (  
        idioma(Ciudad,Idioma),
        not(habla(Persona,Idioma))
    )
    ).
estaComplicado(basico,500).
estaComplicado(intermedio,1500).
estaComplicado(avanzado,1500).

complicado(Persona):-
    nivelActual(Persona,Nivel),
    estaComplicado(Nivel,Limite),
    capital(Persona,Capital),
    Capital < Limite.



    
    
  
    
    
