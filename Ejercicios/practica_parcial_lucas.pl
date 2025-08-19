libro(estudioEnEscarlata, digital(mobi, 532)). 
libro(elSabuesoDeLosBaskerville, papel(354, zeta)). 
libro(fundacion, papel(546, planeta)). 
libro(segundaFundacion, digital(epub, 880)). 
libro(juegoDeTronos, digital(amz, 1046)).

compro(george, estudioEnEscarlata). 
compro(george, fundacion). 
compro(martina, elSabuesoDeLosBaskerville). 
compro(martina, juegoDeTronos).

deudaTotal(Usuario, Deuda):- 
    findall(P, 
        (compro(Usuario, Titulo), 
        libro(Titulo, digital(_, KB)),  
        P is (KB / 1024) * 10), DeudasDigitales), 
    findall(P, 
        (compro(Usuario, Titulo), 
        libro(Titulo, papel(Paginas, _)),  
        P is Paginas * 0.05), DeudasEnPapel), 
    sum_list(DeudasDigitales, TotalDeudasDigitales), 
    sum_list(DeudasEnPapel, TotalDeudasEnPapel), 
    Deuda is TotalDeudasDigitales + TotalDeudasEnPapel.

/*
    Ejemplo de consultas
    deudaTotal(martina,Deuda).
    Deuda = 27,91

    deudaTotal(george,Deuda).
    Deuda = 32,49

    deudaTotal(Usuario,Deuda).
    Deuda = 60,4.
*/

/**
 No estamos aprovenchando el uso de polimorfismo ya que lo tendriamos que calcular " a mano", en el caso de que
 se agregara otro soporte para los libros, tendriamos que hacer un findall para ese caso, por ende no estamos haciendo
 el buen uso del polimorfismo
*/

deudaTotal1(Usuario,Deuda):-
    compro(Usuario,_),
    findall(D, (compro(Usuario,Titulo),libro(Titulo,Soporte),calcularDeuda(Soporte,D)), Deudas),
    sum_list(Deudas, Deuda).

calcularDeuda(digital(_,Peso),D):- D is (Peso /1024 ) *10.
calcularDeuda(papel(Paginas,_),D):- D is Paginas * 0.05.


    
plato(laAngioplastia,mila,180). 
plato(laAngioplastia,bife,230). 
plato(laAngioplastia,molleja,220). 
plato(lasVioletas,bife,450). 
plato(elCuartito,muzza,290).

bodegon(Restaurante):- 
   not((plato(Restaurante,_,Precio),Precio >= 300)). 
bodegon(Restaurante):- 
   tieneMila(Restaurante). 
tieneMila(Restaurante):- 
   findall(Plato, plato(Restaurante,Plato,_), Platos), 
   member(mila,Platos).

/*
    1a- No hay que usar forall para verificar si existe un plato del Restaurante que tenga milanesa,
    utilizamos el predicado plato(Restaurante,mila,_), si esto se cumple y ademas se cumple que ningun plato
    del resturante tiene un precio mayor a 300 pesos, entonoces podemos afirmar que es un bodegon
    1b- El predicado bodegon no es inversible, debido a que recien estamos ligando la variable dentro de un not,
    el cual es un predicado no inversible.
*/

bodegon1(Restaurante):- 
   plato(Restaurante,mila,_),
   not((plato(Restaurante,_,Precio),Precio >= 300)).



enAscenso(Cientifico):- 
    % publico(Cientifico,_),
    not(tienePrestigio(Cientifico)), 
    forall(publico(Cientifico, Publicacion), logroImpacto(Publicacion)). 

tienePrestigio(marie). 
tienePrestigio(albert). 

publico(marie, articulo(estudioPolonio, 1898)). 
publico(marie, laRadiactividad). 
publico(albert, teoriaDeLaRelatividad). 
publico(albert, articulo(efectoFotoelectrico, 1905)).  
publico(albert, ensayo(filosofiaCiencia)).
publico(lise, articulo(fisionNuclear, 1939)). 
publico(lise, ensayo(rayosX)). 
publico(ramonYCajal, articulo(neuronas, 1888)).

logroImpacto(articulo(estudioPolonio, 1898)). 
logroImpacto(laRadiactividad). 
logroImpacto(articulo(efectoFotoelectrico, 1905)). 
logroImpacto(articulo(fisionNuclear, 1939)).

referencias(estudioPolonio,3000). 
referencias(laRadiactividad, 4000). 
referencias(teoriaDeLaRelatividad, 5000). 
referencias(efectoFotoelectrico, 4000). 
referencias(filosofiaCiencia, 3000). 
referencias(fisionNuclear, 2000). 
referencias(rayosX, 1000). 
referencias(neuronas, 2000).



esConocida(Cientifico,Publicacion):-
    publico(Cientifico,Descubrimiento),
    publicacionConocida(Descubrimiento,Publicacion).


publicacionConocida(articulo(Publicacion,_),Publicacion):-
    referencias(Publicacion,Referencia),
    Referencia >= 3000.

publicacionConocida(ensayo(Publicacion),Publicacion):-
    referencias(Publicacion,Referencia),
    Referencia >= 3000.

publicacionConocida(Publicacion,Publicacion):-
    referencias(Publicacion,Referencia),
    Referencia >= 3000.