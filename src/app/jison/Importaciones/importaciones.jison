%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
CARACTER  [a-zA-Z0-9][a-zA-Z0-9]+
PUNTO   [.]
%%
/*********************token**********************/
//COMENTARIOS
{AD}{AD}.*        {console.log('<'+yytext+'>');}//comentario simple
//PUNTUACIONES
{PUNTO}            {console.log('<'+yytext+'>');return 'PUNTO';}
//HEAD FROM PROYECT
"importar"        {console.log('<'+yytext+'>');return 'IMPORTAR';}
"incerteza"        {console.log('<'+yytext+'>');return 'INCERTEZA';}
"clr"        {console.log('<'+yytext+'>');return 'CLR';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<'+yytext+'>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
// DE ULTIMO SIEMPRE EL ID
{CARACTER}       {console.log('<'+yytext+'>');return 'ID';}
//INORAR
\s+         {console.log('<'+yytext+'>');}//se come los saltos de linea
/lex
%start inicio
%%
//comienzo del programa
inicio
    : inicio encabezado
    | 
    ;
/******************ESTE ES EL HEAD********************/
encabezado 
    :IMPORTAR ID PUNTO CLR
    |INCERTEZA NUMERO 
    ;