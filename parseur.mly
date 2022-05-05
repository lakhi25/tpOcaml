/*%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN EOL
%type <unit> main expression terme facteur
%start main
%%
main:
    expression EOL {}
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
%token <int> NOMBRE
%token PLUS MOINS FOIS MODULO GPAREN DPAREN PT_VIRG EOL

%left PLUS MOINS
%left FOIS MODULO
%nonassoc UMOINS
/**non terminaux*/
%type <int> main expression
%start main
%%
main:
    expression PT_VIRG EOL {$1}
;
expression:
      expression PLUS expression {$1+$3}
    | expression MOINS expression {$1-$3}
    | expression FOIS expression {$1*$3}
    /*| expression MODULO expression {$1%$3}*/
    | GPAREN expression DPAREN {$2}
    | MOINS expression %prec UMOINS {-$2}
    | NOMBRE {$1}
;
/*est ce que on garde juste expression ou il faut ajouter pour facterr ??*/