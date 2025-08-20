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

%genero(Canción, Género).
genero(el38, rock).
% genero(sisters, reggae).
genero(muchoPorHacer, rock).
genero(tusojos, reggae).
genero(bastara, reggae).

%toca (Tema, Banda).
toca(el38, divididos).
toca(sisters, divididos).
toca(muchoPorHacer, riff).
toca(tusojos, losCafres).
toca(bastara, losCafres).

rockera(Banda):-
    findall(Tema,(toca(Tema,Banda),genero(Tema,Genero),Genero \= rock),Temas),
    length(Temas, 0).

/*
    rockera(riff).
    true
    rockera(divididos).
    false
    rockera(42).
    false -> Da True
    rockera(Banda)
    false

    No funciona correctamente la consulta existencial debido a que la variable "Banda" es usada
    por primera vez en un predicado no inversible, por lo tanto rockera no puede generar el universo
    de Bandas. Ademas rockera(42) da True ya que la longitud de sus canciones es igual a cero, (por mas que no sea una banda)


*/

rockera1(Banda):-
    toca(Tema,Banda),
    not((toca(OtroTema,Banda),genero(OtroTema,Genero),Genero\= rock )).
