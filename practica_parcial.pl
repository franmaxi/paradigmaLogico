musico(luis, guitarra).
musico(luis, bajo).
musico(ana, voz).  
musico(ana, teclado).
musico(juan, bateria).
musico(maria, voz).
musico(maria, guitarra).
instrumentosRequeridosParaBandaDe(rock, [guitarra, bateria, bajo, voz]).
instrumentosRequeridosParaBandaDe(jazz, [teclado, saxo, contrabajo, bateria]).


/*El predicado bandaPosible/2, pretender verificar que dado un conjunto de músicos y un género musical,
 se puede conformar con una banda de ese genéro, ya que los músicos cubren todos los instrumentos requeridos. 
 Se considera que un músico puede tocar más de un instrumento, por lo que la banda podría tener menos integrantes que instrumentos requeridos. */

bandaPosible(Musicos, Genero):-  
    instrumentosRequeridosParaBandaDe(Genero, InstrumentosRequeridos),  
    findall(Instrumento,
    instrumentoDeAlgunMusico(Musicos, Instrumento), 
    InstrumentosDisponibles),  
    cubreTodos(InstrumentosRequeridos, InstrumentosDisponibles).  

instrumentoDeAlgunMusico(Musicos, Instrumento):-  
    member(Musico, Musicos), 
    musico(Musico, Instrumento). 

cubreTodos(InstrumentosRequeridos, InstrumentosDisponibles):-  
    forall(member(Instrumento, InstrumentosRequeridos), 
    member(Instrumento, InstrumentosDisponibles)).


bandaPosible2(G, B):-  
   	instrumentosRequeridosParaBandaDe(B, I),  
 	forall(instrumentoDeAlgunMusico(G, II),member(II,I)).

/*
    - Si bandaPosible2 es correcta y funciona perfectamente, 
    - En terminos de expresividad: Es menos expresivda pues las variables utilizadas no "significan" nada, no podemos saber a que se refiere
    - En terminos de declaratividad : Es igual que declarativa que la original, ambas usan un forall y utilizan el predicado instrumentosRequeridosParaBandaDe
    - En terminos de inversibilidad : Ambas no son inversible, pues G o Musicos llega sin ligar y se las utiliza por primera vez dentro de un forall.
    - Ejemplos 
    bandaPosible([luis,maria,juan],rock).
    True
    bandaPosible2([luis,maria,juan],rock).
    True
    bandaPosible([luis,maria,juan],jazz).
    False
    bandaPosible2([luis,maria,juan],jazz).
    False
    */