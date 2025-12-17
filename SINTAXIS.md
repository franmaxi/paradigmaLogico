# **Sintaxis Final**
# **Repositorio de Finales**
    https://josemariasola.wordpress.com/ssl/finals/
## **Gramatica Formales**
  (No terminales,Terminales,Producciones,Axioma)
  
  (Q,SIGMA,TRANSICIONES,AXIOMA)
## **Gramaticas Regulares**
- No pueden tener a derecha dos elementos no terminales
- Sus producciones pueden tener a derecha epsilon
- El lenguaje generado es cerrado respecto de la operacion concatenacion consigo mismo
- El lenguaje generado puede ser descripto por una regex
- Todos los LF pueden ser generados por GR
## **BNF**
Es un conjunto de reglas que definen la sintaxis utilizando GICs (Gramáticas Independientes del Contexto). 
En una BNF podemos encontrar lo siguiente:
- Precedencia: Cuanto más alejado del axioma se encuentre el operador, mayor prioridad tiene. Si dos operadores están en el mismo nivel de prioridad, ambos tienen la misma.
- Asociatividad: Podemos tener asociatividad a izquierda o a derecha, esto depende para qué "lado" tiene su recursividad.
- Restricciones: En algunos casos la BNF describe situaciones que son sintácticamente incorrectas. Para salvar esto, la BNF puede tener ciertas restricciones.

**Que una expresión sea derivable no implica que sea sintácticamente correcto, pero sintácticamente correcto implica que la expresión es derivable.**

#### **Ejemplo de asociatividad a izquierda** 
![alt text](image.png)
#### **Ejemplo de asociatividad a derecha** 
![alt text](image-1.png)

## **Lenguajes Regulares**
## **Categorias Léxicas**
Constituyen LRs, algunos infinitos y otros finitos. Son utilizados durante el analisis lexico. Cada categoria lexica es un LR y se denominan lexemas
## **Categorias Sintácticas**
## **Identificadores**
**ERX:** [a-zA-Z_][a-zA-Z0-9_]*
## **Constantes Octales**
**ERX:** 0[0-7]*
## **Constantes Hexadecimales**
**ERX:** 0[xX][0-9a-fA-F]+
## **Constantes Decimales**
**ERX:** [1-9][0-9]*,
## **Análisis Léxico**
Se busca reconocer cada lexema, filtrándolos por categorías léxicas, una vez filtrados se denominan tokens. Son implementados mediante AFDs que reconocen LRs.

## **Análisis Sintáctico**
Se busca reconocer cada estructura y ubicarla en su categoría sintáctica correspondiente. Son implementados mediante AFPs, que nos indican si la estructura es derivable.

## **Análisis Semántico**
Se validan las estructuras que son sintácticamente correctas tengan sentido en el contexto en el que se encuentran en el programa. Se implementa mediante una __TS__ que reconoce lenguajes sensibles al contexto (LSCs).

## **Errores Léxicos**
Ocurre cuando una secuencia de caracteres no pertenece a ningún LR de C (categorías léxicas o tokens).

## **Errores Sintácticos**
Ocurre cuando existe alguna estructura que no sea derivable de la BNF de LICs o bien no cumple con las restricciones de la BNF.

## **Errores Semánticos**
- Doble declaración
- No declaración
- La cantidad de parámetros de una función es inferior a los que realmente necesita
- Control de tipos

## **Operadores vs Caracteres de Puntuación**
## **Algoritmo de Thompson**
## **Algoritmo Clausura**
## **Algoritmo de Clases**
## **Tipos de Analisis**
### **Analisis Sintactico Descendente(LL1)**
Produce una derivacion por izquierda que comienza en el axioma y finaliza en los terminales
### **Analisis Sintactico Ascendente(LR1)**
Produce una derivacion por derecha, lo hace a la inversa, la ultima produccion aplicada en la derivacion a derecha es la primera en ser descubierta.
## **Gramaticas Ambiguas**
Sucede cuando una GIC permite dos o mas derivaciones a izquierda o derecha para obtener la misma cadena de terminales. Se deben evitar para la implementacion computacional.
## **Tabla de Simbolos**
Conjunto de estructuras de datos que se utiliza como minimo para contener todos los identificadores del programa fuente que se esta compilando, junto con los atributos de cada identificador. La **TS** interactua con las tres fases del analisis.
Las validaciones semanticas utilizan las rutinas semanticas que complementan la GIC mediante el uso de la TS para realizar validaciones.
## **FLEX**
Nos permite generar un archivo de código C que al compilarse y enlazarse se convierte en un programa ejecutable capaz de realizar un **análisis léxico** sobre una entrada en función de las reglas que se especifiquen mediante ERX (Expresiones regulares extendidas). El archivo está compuesto por:
- Definiciones
- Reglas
- Código de usuario
  
Si al agregar un carácter a una secuencia de caracteres la cadena no entra por ninguna regla, FLEX hace ungetc() y vacía el buffer para empezar a reconocer la siguiente cadena.
El orden en el cual son presentadas las reglas **IMPORTA**.

## **BISON**
Es una herramienta que nos permite construir un analizador sintactico. La misma se vale de las funciones yyparse() e yylex() para poder ejecutar el analisis


# **Apuntes finales resueltos**

    typedef <tipoDeDato> <renombreTipoDato>
    2[a] = *(a+2) = a[2]
    v[i] , <v> vs <&v>. <v> es equivalente a v[0], encambio &v es la direccion de memoria del array. v+1 equivale a v[1] y &v + 1 equivale a la direccion de memoria más alla del array.
    e = e+1 == ++e
    Los 3 analizadores (lexicos, sintacticos y semanticos se encargan de detectar errores en tiempo de compilacion)
    Los AFN reconocen exactamente la misma clase de lenguajes de los AFD
    La asociatividad en C esta declarada por la GIC

## **Expresiones**
Una expresion es considerada como tal cuando el analizador lexico encuentra un <;>

## **Funcion main**
    void main (char *argv[],int argc)
    void main (void)
    void main ()
    void main (char**argv,int argc)
Puede recibir dos o ningun parametro
## **Jerarquia de Chomsky**
![alt text](image-2.png)
## **Lenguajes formales**
Se pasan ambos ER a AFN-e con Thompson
Luego se pasan a AFD con subConjuntos
Se calcula la interseccion entre los dos AFD
Se convierte el AFD en ER mediante el metodo de sistema de ecuaciones
Para que un LF sea un sublenguaje de C, la palabra minima del LF tiene que estar contenida.
## **Make**
El proposito de make es automatizar la compilacion y construccion de programas, evitando recompilar archivos, ademas gestiona la dependencia entre ellos.
## **Etapas de compilacion**
1. Preprocesamiento
2. Compilacion
3. Ensamblador
4. Enlazado
