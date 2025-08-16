% Cancion, Compositores,  Reproducciones
cancion(bailanSinCesar, [pabloIlabaca, rodrigoSalinas], 10600177).
cancion(yoOpino, [alvaroDiaz, carlosEspinoza, rodrigoSalinas], 5209110).
cancion(equilibrioEspiritual, [danielCastro, alvaroDiaz, pabloIlabaca, pedroPeirano, rodrigoSalinas], 12052254).
cancion(tangananicaTanganana, [danielCastro, pabloIlabaca, pedroPeirano], 5516191).
cancion(dienteBlanco, [danielCastro, pabloIlabaca, pedroPeirano], 5872927). 
cancion(lala, [pabloIlabaca, pedroPeirano], 5100530).
cancion(meCortaronMalElPelo, [danielCastro, alvaroDiaz, pabloIlabaca, rodrigoSalinas], 3428854).


% Mes, Puesto, Cancion
rankingTop3(febrero, 1, lala).
rankingTop3(febrero, 2, tangananicaTanganana).
rankingTop3(febrero, 3, meCortaronMalElPelo).

rankingTop3(marzo, 1, meCortaronMalElPelo).
rankingTop3(marzo, 2, tangananicaTanganana).
rankingTop3(marzo, 3, lala).

rankingTop3(abril, 1, tangananicaTanganana).
rankingTop3(abril, 2, dienteBlanco).
rankingTop3(abril, 3, equilibrioEspiritual).

rankingTop3(mayo, 1, meCortaronMalElPelo).
rankingTop3(mayo, 2, dienteBlanco).
rankingTop3(mayo, 3, equilibrioEspiritual).

rankingTop3(junio, 1, dienteBlanco).
rankingTop3(junio, 2, tangananicaTanganana).
rankingTop3(junio, 3, lala).


% 1
mes(Mes):-
    rankingTop3(Mes,_,_).

esUnHit(Cancion):-
    cancion(Cancion,_,_),
    forall(mes(Mes),rankingTop3(Mes,_,Cancion)).

% 2 

noEsReconocidaPorLosCriticos(Cancion):-
    tieneMuchasReproducciones(Cancion),
    not(estuvoEnElRanking(Cancion)).

tieneMuchasReproducciones(Cancion):-
    cancion(Cancion,_,Reproducciones),
    Reproducciones > 7000000.

estuvoEnElRanking(Cancion):-
    rankingTop3(_,_,Cancion).

% 3

sonColaboradores(UnCompositor,OtroCompositor):-
    cancion(_,Compositores,_),
    member(UnCompositor,Compositores),
    member(OtroCompositor,Compositores),
    UnCompositor \= OtroCompositor.

% 4
%periodista(Nombre,AniosExperiencia,Titulo)
%reportero(Nombre,AniosExperiencia,CantidadNotas)
%conductor(Nombre,AniosExperiencia)
%camara(AniosExperiencia,CantidadProductos)
trabajo(tulio,conductor(5)).
trabajo(juanin,conductor(0)).
trabajo(bodoque,periodista(2,licenciatura)).
trabajo(marioHugo,periodista(10,posgrado)).
trabajo(bodoque,reportero(5,300)).
trabajo(pepito,camara(10,30)).

% 5
porcentajeTitulo(posgrado,35).
porcentajeTitulo(licenciatura,20).

sueldoConductor(Nombre,Sueldo):-
    trabajo(Nombre,conductor(Experiencia)),
    Sueldo is 10000 * Experiencia.

sueldoReportero(Nombre,Sueldo):-
    trabajo(Nombre,reportero(Experiencia,Notas)),
    Sueldo is 10100 * Experiencia + Notas * 100.

sueldoPeriodista(Nombre,Sueldo):-
    trabajo(Nombre,periodista(Experiencia,Titulo)),
    SueldoSinPlus is 5000 * Experiencia,
    porcentajeTitulo(Titulo,Porcentaje),
    plusPeriodista(SueldoSinPlus,Porcentaje,Sueldo).

plusPeriodista(Sueldo,Porcentaje,SueldoAumentado):-
    Factor is 1 + Porcentaje/100,
    SueldoAumentado is Sueldo * Factor .

sueldo(Nombre,Sueldo):- sueldoPeriodista(Nombre,Sueldo).
sueldo(Nombre,Sueldo):- sueldoConductor(Nombre,Sueldo).
sueldo(Nombre,Sueldo):- sueldoReportero(Nombre,Sueldo).

sueldoTotal(Nombre,SueldoTotal):-
    findall(S,sueldo(Nombre,S),ListaSueldos),
    sum_list(ListaSueldos, SueldoTotal).
    


% sueldo(Nombre,Sueldo):-
%     sueldoCamara(Nombre,Sueldo).

% sueldoCamara(Nombre,Sueldo):-
%     trabajo(Nombre,camara(Experiencia,Proyectos)),
%     plusCamara(Proyectos,Plus),
%     sueldoCC(Base),
%     Sueldo is Base * Experiencia + Plus.

% plusCamara(Proyectos,Plus):-
%     Plus is 1000* Proyectos.

% sueldoCC(20000).