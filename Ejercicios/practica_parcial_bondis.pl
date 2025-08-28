recorrido(17,gba(sur),mitre).
recorrido(24,gba(sur),belgrano).
recorrido(247,gba(sur),onsari).
recorrido(60,gba(norte),maipu).
recorrido(152,gba(norte),olivos).


recorrido(17,caba,santaFe).
recorrido(152,caba,santaFe).
recorrido(10,caba,santaFe).
recorrido(160,caba,medrano).
recorrido(24,caba,corrientes).

% 1
puedenCombinarse(Linea1,Linea2):-
    recorrido(Linea1,Zona,Calle),
    recorrido(Linea2,Zona,Calle),
    Linea1 \= Linea2.
% 2

juridisccion(Linea,nacional,_):- cruzaLaGeneralPaz(Linea).
juridisccion(Linea,provincial,Provincia):- 
    not(cruzaLaGeneralPaz(Linea)),
    provincia(Linea,Provincia).

cruzaLaGeneralPaz(Linea):-
    recorrido(Linea,caba,_),
    recorrido(Linea,gba(_),_).

provincia(Linea,buenosAires):- recorrido(Linea,gba(_),_).
provincia(Linea,caba):- recorrido(Linea,caba,_).

% 3

% cantidadDeLineas(Zona,Calle,Cantidad):-
%     recorrido(_,Zona,Calle),
%     findall(L, recorrido(L,Zona,Calle), Lista),
%     length(Lista, Cantidad).

% calleMasTransitada(Zona,Calle):-
%     cantidadDeLineas(Zona,Calle,Cantidad).


% 4
calleTrasbordada(Zona,Calle):-
    pasan3Lineas(Zona,Calle),
    forall(recorrido(Linea,Zona,Calle),juridisccion(Linea,nacional,_)).

pasan3Lineas(Zona,Calle):-
    recorrido(Linea1,Zona,Calle),
    recorrido(Linea2,Zona,Calle),
    recorrido(Linea3,Zona,Calle),
    Linea1 \= Linea2,
    Linea2 \= Linea3,
    Linea1 \= Linea3.

    
% Precio fijo    
beneficioSube(juanita,estudiantil).
% Zona laboral, Linea que se toma la persona, Costo
beneficioSube(pepito,casosParticulares(gba(oeste))).
beneficioSube(marta,casosParticulares(gba(sur))).
beneficioSube(marta,casosParticulares(caba)).
% Descuento del 50%
beneficioSube(marta,jubilado).

valorBoleto(500,nacional,_,_).
valorBoleto(350,provincial,caba,_).
valorBoleto(Costo,provincial,buenosAires,Linea):- 
    cantidadCallesLinea(Linea,CantidadCalles),
    zonasDiferentes(Linea,Plus),
    Costo is 25 * CantidadCalles + Plus.

zonasDiferentes(Linea,50):-
    recorrido(Linea,gba(Zona1),_),
    recorrido(Linea,gba(Zona2),_),
    Zona1 \= Zona2.

zonasDiferentes(_,0).

cantidadCallesLinea(Linea,Cantidad):-
    recorrido(Linea,_,_),
    findall(C,recorrido(Linea,_,C),Lista),
    length(Lista,Cantidad).

costoPorViajarCon(Persona,Linea,CostoBase):-
    juridisccion(Linea,Juridisccion,Provincia),
    valorBoleto(CostoBase,Juridisccion,Provincia,Linea),
    not(beneficioSube(Persona,_)).

costoPorViajarCon(Persona,Linea,CostoBase):-
    juridisccion(Linea,Juridisccion,Provincia),
    valorBoleto(CostoBase,Juridisccion,Provincia,Linea),
    not(esValido(ndasdsadsaddsad,asd,asd,as)).

costoPorViajarCon(Persona,Linea,CostoMinimo):-
    aplicarBeneficio(Persona,_,_,_),
    juridisccion(Linea,Juridisccion,Provincia),
    valorBoleto(CostoBase,Juridisccion,Provincia,Linea),
    findall(Costo,(
        aplicarBeneficio(Persona,Linea,CostoBase,Costo)),
    ListaCostos),
    min_member(CostoMinimo, ListaCostos).


aplicarBeneficio(Persona,_,_,50):-
    beneficioSube(Persona,estudiantil).

aplicarBeneficio(Persona,Linea,_,0):-
    beneficioSube(Persona,casosParticulares(Zona)),
    recorrido(Linea,Zona,_).

aplicarBeneficio(Persona,_,CostoBase,CostoMitad):-
    beneficioSube(Persona,jubilado),
    CostoMitad is CostoBase / 2.




% aplicarBeneficio(Persona , _, CostoBase, CostoBase):-
%     not(beneficioSube(Persona,_)).
% aplicarBeneficio(_ , _, CostoBase, CostoBase).


    
    