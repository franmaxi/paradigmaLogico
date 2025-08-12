
vende(Articulo,Precio).

%autor (Articulo,Precio)
autor(libro(_,Autor,_,_),Autor):-vende(libro(_,Autor,_,_),_).
autor(cd(_,Autor,_,_),Autor):-vende(cd(_,Autor,_,_),_).
director(peli(_,Director,_,_),Director):-vende(peli(_,Director,_,_),_).
%Se cumple para un articulo si es el libro de mayor precios
%libroMasCaro(Libro), tiene aridad 1
% No es polimorfico, solo es para libros y no para articulos
libroMasCaro(libro(Titulo,Autor,Genero,Editorial)):-
    vende(libro(Titulo,Autor,Genero,Editorial),Precio),
    forall(vende(libro(_,_,_,_),OtroPrecio),OtroPrecio =< Precio).
%Polimorfico, trabajamos con Articulos y no con libros
curiosidad(Articulo):-
    vende(Articulo,_),
    autor(Articulo,Autor),
    not((vende(OtroArticulo,_), autor(OtroArticulo,Autor), Articulo \= OtroArticulo)).

%titulo(Articulo,Titulo)
titulo(libro(Titulo,_,_,_),Titulo):-vende(libro(Titulo,_,_,_),_).
titulo(cd(Titulo,_,_,_),Titulo):-vende(cd(Titulo,_,_,_),_).
titulo(peli(Titulo,_,_,_),Titulo):-(peli(Titulo,_,_,_),_).
sePrestaConfusion(Titulo) :-
    titulo(UnArticulo,Titulo),
    titulo(OtroArticulo,Titulo),
    UnArticulo \= OtroArticulo.

%mixto(Autor)
mixto(Autor):- 
    autor(libro(_,_,_,_),Autor), 
    autor(cd(_,_,_,_),Autor). 
