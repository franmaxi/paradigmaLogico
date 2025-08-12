/*  Operaciones sobre listas

.length/2
Relaciona una lista y la cantidad de elementos que tiene en ella.
    length([hola,como,estas],3).
    true



.member/2
Verifica si el elemento pertenece a una lista
    member(Elemento,Lista).
    member(pepe,[pepe,papa,pera]).
    true

.append/3
Relaciona dos listas con su lista concateneda

    append(Lista1,Lista2,ListaFinal).

    append([pedro],[padre],ListaFinal). Es inversible
    ListaFinal = [pedro,padre]

.nth/3
Relaciona un elemento con su condicion que ocupa en una lista, podemos obtener el elemento que esta en 
su posicion o el indice.
Podemos saber el elemento que esta en una lista y conocer su indice o viceversa

    nth0(Indice,Lista,Elemento).

.last/2
Relaciona una lista con su ultimo elemento
    last(Lista,LastElemento)



.reverse/2

Verifica si los elementos de una lista estan al reves
    reverse(Lista,ListaInvertida).


.sumlist/2
Suma los elementos de una lista

sum_list(Lista,Sumatoria).
.list_to_set/2
Relaciona una lista con los elementos repetidos con un CONJUNTO sin repetidos

list_to_set([2,3,3,4],Conjunto).
Conjunto = [2,3,4]

max_member/2
Relaciona una lista con el mayor de la misma


forall/2
Verifica que una condicion se cumpla para todas las variables posibles


incluido(A,B):-
    forall(member(X,A), member(X,B)).

disjunto(A,B):-
    forall(member(X,A), not(member(X,B))).


forall = not not


findall/3
Relaciona un individuo o variable, con una consulta y con el conjunto de los individuos que satisfacen la consulta

findall(N, N > 20, masGrandes)
*/