%festival (NombreDelFestival,Bandas,Lugar).
%Relaciona el nombre de un festival con la lista de los nombres de bandas
% que tocan en el y en lugar donde se realiza
festival(lolapalozza,[gunsAndRoses, theStrokes,littoNebbia],hipodromoSanIsidro).

%lugar(nombre,capacidad,precioBase).
/*Relaciona un lugar con su capacidad y el precio base que se cobran las entradas ahi*/
lugar(hipodromoSanIsidro,85000,3000).

%banda(nombre,nacionalidad,popularidad)
/* Relaciona una banda con su nacionalidad y su popùlaridad*/
banda(gunsAndRoses,eeuu,69420).
%entradaVendida(NombreDelFestival,TipoDeEntrada).
/*
    Indica la venta de una entrada de cierto tipo para el festival indicado
    - campo
    - plateaNumerada(fila).
    - plateaGeneral(zona).
*/
entradaVendida(lolapalozza,campo).
entradaVendida(lolapalozza,plateaNumerada(1)).
entradaVendida(lolapalozza,plateaGeneral(zona2)).

%plusZona(Lugar,Zona,Recargo)
/*
    Relacion de una zona de un lugar con el recargo que le aplica al precio
    de las plateas generales
*/
plusZona(hipodromoSanIsidro,zona1,1500).

/* itinerante/1
    Se cumple para los festivales que ocurren en mas de un lugar, pero con el mismo nombre y las mismas bandas
    en el mismo orden
*/

itinerante(Festival):-
    festival(Festival,Bandas,Lugar),
    festival(Festival,Bandas,OtroLugar),
    Lugar \= OtroLugar.

 /* careta/1
    Decimos que un festival es careta si no tiene campo o si es el personalFest
 */
careta(personalFest).
careta(Festival):-
    festival(Festival,_,_),
    not(entradaVendida(Festival,campo)).

/* nacAndPop /1
    Un festival es nac&pop si no es careta y todas las bandas que tocan
    en el son de nacionalidad argentina y tienen popularidad mayor a 1000
*/

nacAndPop(Festival):-
    festival(Festival,Bandas,_),
    forall(member(Banda,Bandas), (banda(Banda,argentina,Popularidad), Popularidad > 1000)),
    not(careta(Festival)).

/* sobrevendido /1
    Se cumple para los festivales que vendieron mas entradas
    que la capacidad del lugar donde se realizan
*/

sobrevendido(Festival):-
    festival(Festival,_,Lugar),
    lugar(Lugar,Capacidad,_),
    findall(Entrada,entradaVendida(Festival,_),EntradasVendidas),
    length(EntradasVendidas,TotalVendido),
    Capacidad < TotalVendido.

/* recaudacionTotal /2
    Relaciona un festival con el total recaudado con la venta de entradas,
    Cada tipo de entrada se vende a un precio diferente
    - Precio campo es el precio base del lugar donde se realiza
    - La platea general es el precio base mas algun plus que se aplica a la zona
    - La platea numeradas salen el triple del precio base para las filas de atras
        (>10) y 6 veces el precio base para las primeras 10 filas
*/
precio(campo,Lugar,Precio):-
    lugar(Lugar,_,Precio).

precio(plateaGeneral(Zona),Lugar,Precio):-
    lugar(Lugar,_,PrecioBase),
    plusZona(Lugar,Zona,PrecioZona),
    Precio is PrecioBase + PrecioZona.

precio(plateaNumerada(Fila),Lugar,Precio):-
    lugar(Lugar,_,PrecioBase),
    Fila > 10 ,
    Precio is PrecioBase * 3.

precio(plateaNumerada(Fila),Lugar,Precio):-
    festival(Festival,Lugar,_),
    lugar(Lugar,_,PrecioBase),
    Fila =< 10 ,
    Precio is PrecioBase * 6.

recaudacionTotal(Festival,TotalRecaudado):-
    festival(Festival,_,Lugar),
    findall(Precio,(entradaVendida(Festival,Entrada), precio(Entrada,Lugar,Precio)), Precios),
    sumlist(Precios,TotalRecaudado).

/* delMismoPalo /2
    Relaciona dos bandas si tocaron juntas en algun recital o si una de ellas
    toco con una banda del mismo palo que la otra pero mas popular.
*/
tocaronJuntas(UnaBanda,OtraBanda):-
    festival(_,Bandas,_),
    member(UnaBanda,Bandas),
    member(OtraBanda,Bandas),
    UnaBanda \= OtraBanda.

delMismoPalo(UnaBanda,OtraBanda):-
    tocaronJuntas(UnaBanda,OtraBanda).

delMismoPalo(UnaBanda,OtraBanda):-
    tocaronJuntas(UnaBanda,TercerBanda),
    banda(TercerBanda,_,PopularidadTercerBanda),
    banda(OtraBanda,_,PopularidadOtraBanda),
    PopularidadTercerBanda > PopularidadOtraBanda,
    delMismoPalo(TercerBanda,OtraBanda).
