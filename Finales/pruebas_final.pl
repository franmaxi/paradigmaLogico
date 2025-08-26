% anotado(ana,paradigmas,25).
% anotado(ana,fisicaII,9).
% anotado(beto,paradigmas,25).
% anotado(camilo,paradigmas,25).

% fecha(paradigmas,11).
% fecha(paradigmas,18).
% fecha(paradigmas,25).
% fecha(fisicaII, 9).
% fecha(fisicaII,16).
% fecha(fisicaII,23).

% ultimaFecha(Materia,Fecha):- 
%     findall(Dia, fecha(Materia, Dia), Fechas),
%     max_list(Fechas, Fecha).


% ultimaFecha1(Materia, Fecha) :-
%     fecha(Materia,Fecha),
%     not((fecha(Materia, OtraFecha), OtraFecha > Fecha)).


% autorEspecifico(Autor):-
%     esAutorDe(Autor,Obra),
%     genero(Obra,Genero),
%     not((esAutorDe(Autor,OtraObra),genero(OtraObra,OtroGenero),Genero \= OtroGenero)).

% esAutorDe(tolkien,elSeniorDeLosAnillos).
% esAutorDe(tolkien,elHobbit).
% esAutorDe(rowling,harryPotterYLaCamaraSecreta).
% esAutorDe(rowling,unaVacanteImprevista).
% esAutorDe(miguelCervantes,donQuijote).
% esAutorDe(borges,elAleph).

% genero(elSeniorDeLosAnillos,fantasia).
% genero(elHobbit,fantasia).
% genero(harryPotterYLaCamaraSecreta,fantasia).
% genero(unaVacanteImprevista,novela).
% genero(donQuijote,novela).
% genero(elAleph,novela).


% autorEspecifico1(Autor):-
%     esAutorDe(Autor,_),
%     forall(genero(Obra,_),esAutorDe(Autor,Obra)).
    



% /*
%     Final 14 12 2024



% */


% %inscripcionGeneral(Atleta,FechaCompetencia).
% %participo(Atleta,Competencia,Fecha).
% %competenciaRequerida(CompetenciaPrevia,CompetenciaPosterior).
% %añosCalendarioTranscurridos(Fecha1,Fecha2,Diferencia).

% puedeInscribirse(Atleta,Competencia,Fecha):-
%     inscripcionGeneral(Atleta,FechaCompetencia),
%     not(participo(Atleta,Competencia,_)),
%     tercerCondicion(Atleta,Competencia,Fecha,FechaCompetencia).

% % puedeInscribirse(Atleta,Competencia,Fecha):-
% %     inscripcionGeneral(Atleta,FechaCompetencia),
% %     not(participo(Atleta,Competencia,_)),
% %     tercerCondicion(Atleta,Competencia,Fecha,FechaCompetencia).
% %     %aniosCalendarioTranscurridos(FechaInscripcion,Fecha,0).



% % puedeInscribirse(Atleta,Competencia,_):-
% %     inscripcionGeneral(Atleta,FechaCompetencia),
% %     not(participo(Atleta,Competencia,_)),
% %     competenciaRequerida(CompetenciaPrevia,Competencia),
% %     participo(Atleta,CompetenciaPrevia,_).

% tercerCondicion(_,_,Fecha,FechaCompetencia):-
%     aniosCalendarioTranscurridos(FechaCompetencia,Fecha,0).

%  tercerCondicion(Atleta,Competencia,_,_):-
%     forall(competenciaRequerida(CompetenciaPrevia,Competencia),participo(Atleta,CompetenciaPrevia,_)).


% videojuego(mataGordas2,nintendo,[accion,mundoAbierto],2025).
% videojuego(mataGordas3,dalia,[accion,aventura],2017).

% %jugador(Nombre,Preferencia)
% jugador(juan,empresa(nintendo)).
% jugador(juan,genero(plataformas)).
% jugador(maria,anio(2015)).
% jugador(pedro,empresa(rockstarGames)).
% jugador(pedro,genero(mundoAbierto)).

% preferidoDelComite(Videojuego):-
%     videojuego(Videojuego,_,_,_),
%     forall(jugador(Jugador,_), existePreferenciaQueGusta(Jugador,Videojuego)).


% evaluoPositivamente(empresa(Empresa),Videojuego):- videojuego(Videojuego,Empresa,_,_).
% evaluoPositivamente(genero(Genero),Videojuego):- 
%     videojuego(Videojuego,_,Generos,_),
%     member(Genero,Generos).

% evaluoPositivamente(anio(Anio),Videojuego):-
%     videojuego(Videojuego,_,_,Lanzamiento),
%     Lanzamiento > Anio.

% existePreferenciaQueGusta(Jugador,Videojuego):-
%     jugador(Jugador,Preferencia),
%     evaluoPositivamente(Preferencia,Videojuego).

% ovejaNegra(Videojuego):-
%     videojuego(Videojuego,_,_,_),
%     jugador(Jugador,_),
%     not(existePreferenciaQueGusta(Jugador,Videojuego)).


% precio(lata(atun, 100, nereida), 70).
% precio(lata(atun, 200, nereida), 120).
% precio(lacteo(laSerenisima, leche), 15).
% precio(lacteo(sancor, leche), 22).
% cliente(Cliente):-compro(Cliente, _).
% compro(martina, lata(atun, 100, nereida)).
% compro(martina, lacteo(sancor, leche)).
% compro(aye, lacteo(sancor, leche)).


% comproMarca(Cliente,Marca):-
%     compro(Cliente,Producto),
%     verMarcaProducto(Producto,Marca).

% verMarcaProducto(lata(_,_,Marca),Marca).
% verMarcaProducto(lacteo(Marca,_),Marca).

% marcaPopu(Marca):-
%     comproMarca(_,Marca),
%     %cliente(Cliente),
%     forall(cliente(Cliente),comproMarca(Cliente,Marca)).




% marcaPopu1(Marca):-forall(cliente(Cliente),comproMarca(Cliente, Marca)).
% marcaPopu2(Marca):-cliente(Cliente),forall(cliente(Cliente),comproMarca(Cliente, Marca)).

% %genero(Canción, Género).
% genero(el38, rock).
% % genero(sisters, reggae).
% genero(muchoPorHacer, rock).
% genero(tusojos, reggae).
% genero(bastara, reggae).

% %toca (Tema, Banda).
% toca(el38, divididos).
% toca(sisters, divididos).
% toca(muchoPorHacer, riff).
% toca(tusojos, losCafres).
% toca(bastara, losCafres).

% rockera(Banda):-
%     findall(Tema,(toca(Tema,Banda),genero(Tema,Genero),Genero \= rock),Temas),
%     length(Temas, 0).

% /*
%     rockera(riff).
%     true
%     rockera(divididos).
%     false
%     rockera(42).
%     false -> Da True
%     rockera(Banda)
%     false

%     No funciona correctamente la consulta existencial debido a que la variable "Banda" es usada
%     por primera vez en un predicado no inversible, por lo tanto rockera no puede generar el universo
%     de Bandas. Ademas rockera(42) da True ya que la longitud de sus canciones es igual a cero, (por mas que no sea una banda)


% */

% rockera1(Banda):-
%     toca(Tema,Banda),
%     not((toca(OtroTema,Banda),genero(OtroTema,Genero),Genero\= rock )).
% estaEn(Peli, Personaje)
% estaEn(buscandoNemo, nemo).
% estaEn(buscandoNemo, dory).
% estaEn(quienEnganio, rogerRabbit).
% estaEn(quienEnganio, doom).
% estaEn(quienEnganio, eddie).
% estaEn(naufrago, chuck).

% % esAnimado(Personaje)
% esAnimado(nemo).
% esAnimado(dory).
% esAnimado(rogerRabbit).
% esAnimado(doom). %Ups, spoiler

% aptaParaAmargos(Peli):-
%     findall(Pers, (estaEn(Peli, Pers), esAnimado(Pers)), Ps),
%     length(Ps, C), C = 0.

% seDivierte(Personaje):-
%     findall(Animado,
%         (estaEn(Peli1, Personaje),
%          estaEn(Peli2, Animado),
%          Peli1 = Peli2,
%          esAnimado(Animado)),
%         Compas),
%     length(Compas, C), C >= 1.

% /**
%  1- Una pelicula es apta para amargos cuando una pelicula no contiene personajes animados
%     Un personaje se divierte, cuando forma parte de una pelicula donde al menos haya un personaje que si es animado
%     aptaParaAmargos(naufrago).
%     true
%     aptaParaAmargos(nemo).
%     false
%     seDivierte(nemo).
%     true (participa con dory)
%     seDivierte(chuck).
%     false

%     aptaParaAmargos(Pelicula).
%     false

%     seDiverite(Personaje).
%     true

%     Sucede esto debido a que el predicado no es inversible, por ende no tiene un para generar una respuesta.


%     En seDivierte estamos teniendo un problema de pattern mattching ya que estamos creando dos variables diferentes que tienen
%     que ser iguales, lo cual no tiene sentido porque podriamos usar directamente la misma variable para hacer la consulta.

%     Mientras tanto las dos tienen problemas de declaratividad, ya que estamos creando listas y utilizando predicados de orden superior
%     cuando no es necesario. 

%     Ademas de que el predicado aptaParaAmargos no funciona correctamente, ya que le pondiramos preguntar por pepe 
%     y diria que es true.(Esto se cumple debido a la linea donde C = 0, como pepe no existe, entonoces siempre va a ser cero la longitud).
%  **/

% aptaParaAmargos1(Pelicula):-
%     estaEn(Pelicula,_),
%     not((estaEn(Pelicula,Personaje),esAnimado(Personaje))).

% seDivierte1(Personaje):-
%     estaEn(Pelicula,Personaje),
%     estaEn(Pelicula,OtroPersonaje),
%     OtroPersonaje \= Personaje,
%     esAnimado(OtroPersonaje).

/*
    Se puede anotar a un final cuando aprobo la cursada , no aprobo el final de esa materia y aprobo
    todo los finales de las correlativas, a menos que haya pasado menos de un año lectivo
    desde que aprobo la cursada, en cuyo caso las correlatividades de final no aplican
*/


% puedeAnotarseAFinal(Alumno, Materia, Fecha):-
%     aproboCursada(Alumno, Materia, FechaFirma),
%     not(aproboFinal(Alumno, Materia, _)),
%     añosLectivosTranscurridos(FechaFirma, Fecha, 0).

% puedeAnotarseAFinal(Alumno, Materia, _):-
%     aproboCursada(Alumno, Materia, _),
%     not(aproboFinal(Alumno, Materia, _)),
%     correlativa(Correlativa, Materia),
%     aproboFinal(Alumno, Correlativa, _).

% aproboCursada(Alumno,Materia,FechaCursada). Inverisble
% aproboFinal(Alumno,Materia,FechaCursada). Inversible
% correlativa(MateriaPrevia,MateriaDespues). Es inversible
% añosLectivosTranscurridos(FechaFirma,FechaActual,Diferencia). Es inverisble para el tercer parametro

/*
    Esta mal la logica debido a que esta fijando que al menos haya aprobado un final de la correlativa,
    por ejemplo si tenemos una materia que para es correlativa de 3 materias, si al menos aprobo un final de esas
    3 estaria cumpliendo, pero para anotarse al final tiene que haber aprobado los 3 finales.

    Es inverisble para el parametro Fecha.



*/

% puedeAnotarseAFinal1(Alumno,Materia,Fecha):-
%     requerimientosMinimos(Alumno,Materia,FechaFirma),
%     añosLectivosTranscurridos(FechaFirma, Fecha, Diferencia),
%     Diferencia =< 1.

% puedeAnotarseAFinal(Alumno, Materia, _):-
%     requerimientosMinimos(Alumno,Materia,_),
%     forall(correlativas(Correlativa,Materia), aproboFinal(Alumno,Correlativa,_)).

% requerimientosMinimos(Alumno,Materia,FechaFirma):-
%     aproboCursada(Alumno,Materia,FechaFirma),
%     not(aproboFinal(Alumno,Materia,_)).


% tiene(Persona,Cosa).
% vale(Cosa,Valor).

% todoLoQueTieneEsMasValioso(Persona1,Persona2):-
%     forall((
%         tiene(Persona1,Cosa),tiene(Persona2,OtraCosa),
%         vale(Cosa,ValorCosaValiosa),vale(OtraCosa,OtroValor)
%         ),ValorCosaValiosa > OtroValor).

%     /*
%         No se pueden hacer consultas existenciales debido a que el predicado no es inversible, 
%         si quisieramos realizar esa consulta tendriamos que modifcarlo


%         not(todoLoQueTieneEsMasValioso1(_,pedro)).
%         todoLoQueTieneEsMasValioso1(Persona,pedro).
%     */

%     todoLoQueTieneEsMasValioso1(Persona1,Persona2):-
%     tiene(Persona1,_),tiene(Persona2,_),
%     forall((
%         tiene(Persona1,Cosa),tiene(Persona2,OtraCosa),
%         vale(Cosa,ValorCosaValiosa),vale(OtraCosa,OtroValor)
%         ),ValorCosaValiosa > OtroValor).


% tiene(tito,arboles,5).
% tiene(tito,problemas,2).
% tiene(jorge,autos,8).
% tiene(jorge,motos,2).
% tiene(dalia,kilos,10).
% tiene(dalia,problemas,9).

% predicadoMisterioso(Persona,Cosa,CantidadM):-
%     tiene(Persona,Cosa,CantidadM),
%     forall(tiene(Persona,_,Cantidad),CantidadM >= Cantidad).

% /*
%     predicadoMisterioso(tito,Cosa,MayorCantidad).
%     predicadoMisterioso(Persona,_,MayorCantidad).
% */
% mayorCantidadDeUnaCosa(Persona,Cosa,MayorCantidad):-
%     tiene(Persona,Cosa,MayorCantidad),
%     forall(tiene(Persona,_,Cantidad),MayorCantidad >= Cantidad).


% subioA(prudencio, montaniaRusa(hulk)).
% subioA(prudencio, autosChocadores).
% subioA(hermenegildo, montaniaRusa(rockit)).
% subioA(hermenegildo, simulador(minions)).
% subioA(hermenegildo, autosChocadores).
% subioA(rigoberta, simulador(ikran)).
% subioA(brunilda, simulador(simpsons)).

% disfruto(prudencio, montaniaRusa(hulk)).
% disfruto(prudencio, autosChocadores).
% disfruto(hermenegildo, simulador(minions)).
% disfruto(rigoberta, simulador(ikran)).

% laPasoBien(Persona) :- 
%     subioA(Persona,_),
%     forall(subioA(Persona, Atraccion), disfruto(Persona, Atraccion)).

% /*
%     El objetivo del predicado es saber si una persona disfruto en todos los juegos que subio.
%     Deberia ser cierto para prudencio y rigoberta.

%     El predicado no es inverisble

% */

% esValiente(Persona,Atraccion):- subioA(Persona,montaniaRusa(_)).

toma(juan, coca).
toma(juan, vino(malbec, 3)).
toma(daiana, cerveza(golden, 18, 0)).
toma(gisela, cerveza(ipa, 52, 7)).
toma(edu, cerveza(stout, 28, 6)).

tieneProblemas(Persona):-
    findall(C, (toma(Persona, cerveza(C, _, A)), A > 0), Cs),
    findall(V, toma(Persona, vino(V, _)), Vs),
    findall(T, toma(Persona, T), Ts),
    length(Cs, CCs),
    length(Vs, CVs),
    length(Ts, CTs),
    CTs is CCs + CVs.


tieneProblemas1(Persona):-
    toma(Persona,_),
    not((toma(Persona,Bebida),noTieneAlcohol(Bebida))).

noTieneAlcohol(coca).
noTieneAlcohol(cerveza(_,_,0)).

/*
    tieneProblemas(P).
    false
    
    Falso
    Falso
    Falso

*/

