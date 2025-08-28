jockey(valdiviseso,155,52).
jockey(leguisamo,161,49).
jockey(lezcano,149,50).
jockey(baratucci,153,55).
jockey(falero,157,52).

caballo(botafogo,peso(52,menor)).
caballo(botafogo,jockey(baratucci)).
caballo(oldMan,letras(7,mayor)).
caballo(energica,peso(52,mayor)).
caballo(matBoy,altura(170,mayor)).
caballo(yatasto,jockey(ninguno)).

stud(elTute,valdivieso).
stud(elTute,falero).
stud(lasHormigas,lezcano).
stud(elCharabon,leguisamo).
stud(elCharabon,baratucci).

ganoPremio(botafogo,granPremioNacional).
ganoPremio(botafogo,granPremioRepublica).
ganoPremio(oldMan,granPremioRepublica).
ganoPremio(oldMan,campeonatoPalermoDeOro).
ganoPremio(mayBoy,granPremioCriadores).


prefiereAMasDeUn(Caballo):-
    caballo(Caballo,_),
    findall(J,loPrefiere(Caballo,J),Lista),
    length(Lista, Longitud),
    Longitud > 1.

not(loPrefiere(energica,baratucci)).

loPrefiere(Caballo,Jockey):- 
    caballo(Caballo,Preferencia),
    jockey(Jockey,AlturaJockey,PesoJockey),
    cumplePreferencia(Preferencia,AlturaJockey,PesoJockey,Jockey).

cumplePreferencia(altura(AlturaPreferida,mayor),AlturaJockey,_,_):- AlturaPreferida < AlturaJockey.
cumplePreferencia(altura(AlturaPreferida,menor),AlturaJockey,_,_):- AlturaPreferida > AlturaJockey.
cumplePreferencia(peso(PesoPreferido,mayor),_,PesoJockey,_):- PesoPreferido =< PesoJockey .
cumplePreferencia(peso(PesoPreferido,menor),_,PesoJockey,_):- PesoPreferido > PesoJockey.
cumplePreferencia(jockey(Jockey),_,_,Jockey).
cumplePreferencia(letras(LongitudRequerida, mayor),_,_,Jockey):- 
    atom_length(Jockey,Longitud), 
    Longitud > LongitudRequerida.







