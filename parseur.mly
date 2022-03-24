<<<<<<< HEAD
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN /*EOL*/PT_VIRG
=======
/*%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN EOL
>>>>>>> master
%type <unit> main expression terme facteur
%start main
%%
main:
    /*expression EOL*/
    expression PT_VIRG {}
;
expression:
    expression PLUS terme {}
    | expression MOINS terme {}
    | terme {}
;
terme:
    terme FOIS facteur {}
    | facteur {}
;
facteur:
    GPAREN expression DPAREN {}
    | MOINS facteur {}
    | NOMBRE {}
;
*/
/*Exercice-2 Question 2 on ajoute les prioritaire des tokens */

%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN EOL

%left PLUS MOINS
%left FOIS
%nonassoc UMOINS

%type <unit> main expression
%start main
%%
main:
    expression EOL {}
;
expression:
      expression PLUS expression {}
    | expression MOINS expression {}
    | expression FOIS expression {}
    | GPAREN expression DPAREN {}
    | MOINS expression %prec UMOINS {}
    | NOMBRE {}
;
/*est ce que on garde juste expression ou il faut ajouter pour facterr ??*/