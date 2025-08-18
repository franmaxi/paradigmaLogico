usuario(ana,youtube,3000000).
usuario(ana,instagram,2700000).
usuario(ana,tiktok,1000000).
usuario(ana,twitch,2).

usuario(beto,twitch,120000).
usuario(beto,youtube,6000000).
usuario(beto,instagram,1100000).

usuario(cami,tiktok,2000).

usuario(dani,youtube,100000).
usuario(evelyn,instagram,1).

influencer(Usuario):-
    usuario(Usuario,_,_),
    findall(Seguidores,usuario(Usuario,_,Seguidores),Lista),
    sum_list(Lista,TotalSeguidores),
    TotalSeguidores > 10000.

omnipresente(Usuario):-
    influencer(Usuario),
    forall(usuario(_,Red,_),usuario(Usuario,Red,_)).
    
exclusivo(Usuario):-
    influencer(Usuario),
    usuario(Usuario,Red,_),
    not((usuario(Usuario,OtraRed,_),Red \= OtraRed)).

contenido(ana,tiktok,video([beto,evelyn],1)).
contenido(ana,tiktok,video([ana],1)).
contenido(ana,instagram,foto([ana])).

contenido(beto,instagram,foto([])).

contenido(cami,twitch,stream(leagueOfLegends)).
contenido(cami,youtube,video([cami],5)).
contenido(cami,youtube,video([cami],2)).

contenido(evelyn,instagram,foto([evelyn,cami])).

tematicaJuego(leagueOfLegends).
tematicaJuego(minecraft).
tematicaJuego(aoe).

adictiva(Red):-
    contenido(_,Red,_),
    forall(contenido(_,Red,Contenido),esAdictivo(Contenido)).

esAdictivo(video(_,Minutos)):- Minutos =< 3.
esAdictivo(stream(Tematica)):- tematicaJuego(Tematica).
esAdictivo(foto(Participantes)):- length(Participantes, Cantidad), Cantidad < 4.

colaboran(Usuario,OtroUsuario):-
    usuario(Usuario,_,_),
    usuario(OtroUsuario,_,_),
    Usuario \= OtroUsuario,
    contenido(Usuario,_,video(Usuarios,_)),
    member(OtroUsuario,Usuarios).

colaboran(Usuario,OtroUsuario):-
    usuario(Usuario,_,_),
    usuario(OtroUsuario,_,_),
    Usuario \= OtroUsuario,
    contenido(Usuario,_,foto(Usuarios)),
    member(OtroUsuario,Usuarios).

colaboracion(Usuario,OtroUsuario):-colaboran(Usuario,OtroUsuario).
colaboracion(Usuario,OtroUsuario):-colaboran(OtroUsuario,Usuario).