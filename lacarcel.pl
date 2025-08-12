guardia(Nombre).
prisionero(Nombre,Crimen).

% 1 controla/2 es inversible?
/*
    No es inversible ya que la variable Guardia llega sin ligar y se usa por 
    primera vez dentro de un not. Podemos solucinar esto ligando la variable 
    previamente, de esta manera
*/

controla(piper,alex).
controla(bennedett,dayanara).

controla(Guardia,Otro):- 
    guardia(Guardia),
    prisionero(Otro,_),
    not(controla(Otro,Guardia)).

% 2 conflictoDeIntereses/2
/*Relaciona a dos personas distintas si no se controlan mutuamente
    y existe algun tercero al cual ambos controlan
*/
conflictoDeIntereses(Persona,OtraPersona):-
    controla(Persona,Controlado),
    controla(OtraPersona,Controlado),
    not(controla(Persona,OtraPersona)),
    not(controla(OtraPersona,Persona)),
    Persona \= OtraPersona.

% 3 peligroso/1
/* Se cumple para un preso que solo cometio crimenes graves
    - Un robo nunca es grave
    - Un homicidio siempre es grave
    - Un delito de narcotrafico es grave cuando al menos 5 drogas a la vez, o incluye metanfetaminas 
*/
grave(homicidio(_)).

grave(narcotrafico(Drogas)):-
    member(metanfetaminas,Drogas).

grave(narcotrafico(Drogas)):-
    length(Drogas, Cantidad),
    Cantidad >= 5.

peligroso(Prisionero):-
    prisionero(Prisionero,_),
    forall(prisionero(Prisionero,Crimen),grave(Crimen)).

% 4 ladronDeGuanteBlanco/1
/* Aplica a un prisionero si solo cometio robos y todos fueron por mas de $100.000
*/
monto(robo(Monto),Monto).

ladronDeGuanteBlanco(Prisionero):-
    prisionero(Prisionero,_),
    forall(prisionero(Prisionero,Crimen), (monto(Crimen,Monto), Monto > 100000)).
% 5 condena/2
/* Relaciona a un prisionero con la cantidad total de años de condena que debe cumplir.
    - La cantidad de dinero robado dividio 10.000.
    - 7 años por cada homicio cometido, mas de 2 años extra si la victima era un guardia.
    - 2 años por cada droga que haya traficado

*/
pena(robo(Monto),Pena):- 
    Pena is Monto / 10000.
pena(homicidio(Persona),7) :- 
    guardia(Persona).
pena(homicidio(Persona),5):-
    not(guardia(Persona)).
pena(narcotrafico(Drogas),Pena):-
    length(Drogas,Cantidad),
    Pena is Cantidad * 2.

condena(Prisionero,Condena):-
    prisionero(Prisionero,_),
    findall(Pena,(prisionero(Prisionero,Crimen),pena(Crimen,Pena)),Penas),
    sumlist(Penas, Condena).

% 6 capo/1
/*
    Se dice que un preso es el capo de todos los capos cuando nadie lo controla,
    pero todas las personas de la carcela (guardias o prisioneros) son controlados
    por el, o por alguien a quien el controla( directa o indirectamente)

*/
persona(Persona):-
    prisionero(Persona,_).
persona(Persona):-
    guardia(Persona).

controlaDirectaOIndirectamente(Persona,OtraPersona):-
    controla(Persona,OtraPersona).

controlaDirectaOIndirectamente(Persona,OtraPersona):-
    controla(Persona,Tercero),
    controlaDirectaOIndirectamente(Tercero,OtraPersona).
    
capo(Capo):-
    controla(_,Capo),
    not(controla(_,Capo)),
    forall((persona(Persona),Capo \= Persona),controlaDirectaOIndirectamente(Capo,Persona)).    
    
