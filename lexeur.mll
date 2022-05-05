{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
    [' ' '\t'  ] { token lexbuf }
    | ['\n'] { EOL }
    | ';' {PT_VIRG}
    | ['0'-'9' ]+(['.'] ['0'-'9']*)? { NOMBRE }
    (*|( ['.''0'-'9']'*')? { NOMBRE }*)
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' { MODULO }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | eof { raise Eof }
    | _ { raise TokenInconu }
