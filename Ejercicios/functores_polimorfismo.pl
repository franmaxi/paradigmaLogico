%vende(Titulo,Autor,Genero,Editorial,Precio) aridad 5
vende(elResplandor,stephenKing,terror,debolsillo,2300).
vende(cronicasDelAngelGris,alejandroDolina,ficcion,booket,1600).
vende(harryPotter3,jkRowling,ficcion,salamandra,2500).
vende(mort,terryPratchett,aventura,plazaJanes,1300).
%vende(Titulo,Autor,Genero,CantidadDeDiscos,CantidadDeTemas,Precio) aridad 6
vende(difeferenteClass,pulp,pop,2,24,1450).
vende(bloodOnTheTracks,bobDylan,folk,1,12,2500).
%Esto es problematico debido a que no se pueden hacer consultas genericas de ambas cosas
vende(peli(it,terror,wallace),1660).
vende(Articulo,Precio). %Articulo = libro,cd,pelicula,etc...

vende(libro(elResplandor,stephenKing,terror,debolsillo),2300).
vende(cd(difeferenteClass,pulp,pop,2,24),1450).

autor(libro(_,Autor,_,_),Autor):-vende(libro(_,Autor,_,_),_).
autor(cd(_,Autor,_,_),Autor):-vende(cd(_,Autor,_,_),_).


% tematico (Autor):-
%     autor(_,Autor),
%     forall(vende(Articulo,_),autor(Articulo,Autor)).