marca(cindor, laSerenisima).
marca(latuna, nereida).
marca(serenito, laSerenisima).

compro(martina, latuna).
compro(martina, cindor).
compro(aye, cindor).
compro(aye, serenito).

cliente(Cliente):-compro(Cliente, _).

obsesivo(Cliente) :- 
  cliente(Cliente),
  forall(compro(Cliente,Producto),marca(Producto,Marca) ).
/*
  Aca estamos ligando la variable Cliente lo cual considero correcto, pero no estamos generando un universo correctamente
  pues adentro de forall es la primera vez que utilizamos la variable Marca, por ende prolog va a tomar como valido
  cualquier Cliente que compro un producto y no le estaria importando la marca.
*/
obsesivo2(Cliente) :- 
  marca(_, Marca),
  forall( compro(Cliente, Producto), marca(Producto, Marca) ).
/*
  No es inversible 
*/
obsesivo3(Cliente) :- 
  marca(Producto, _), 
  forall( compro(Cliente, Producto), marca(Producto, Marca) ).
/*
  Los 3 productos fueron comprados
*/

obsesivo4(Cliente):-
  compro(Cliente,Producto),
  marca(Producto,Marca),
  not((compro(Cliente,OtroProducto),not(marca(OtroProducto,Marca)))).
  