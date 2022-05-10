%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
%%
/*********************token**********************/
\f   					{console.log('<Form Feed>');}
\n   					{console.log('<New Line>');}
\r   					{console.log('<Carriage Return>');}
\t|[\s][\s][\s][\s]   	{console.log('<Horizontal Tabulator>');			return 'TABULADOR';}
\v   					{console.log('<Vertical Tabulator>');}
\s   					{console.log('<ESPACIO>');}
//COMENTARIOS
{AD}{AD}.*        		{console.log('<COMENTARIO>');}//comentario simple
//PUNTUACIONES
[.]            			{console.log('<.>');							return 'PUNTO';}
[,]  					{console.log('<[,]>'+'<'+yytext+'>');			return 'COMA';}
":"  					{console.log('<DOUBLE_PUNTO>'+'<'+yytext+'>');	return 'DOUBLE_PUNTO';}
//SIMBOLOS
//simbolos de igual 
"="  					{console.log('<"=">'+'<'+yytext+'>');			return 'IGUAL';}//asignaciones
// relacionales return false o true
">="    				{console.log('<>=>'+'<'+yytext+'>');			return 'MAYOR_IGUAL';}
"<="    				{console.log('<<=>'+'<'+yytext+'>');			return 'MENOR_IGUAL';}
"=="    				{console.log('<"==">'+'<'+yytext+'>');			return 'IGUAL_IGUAL';}
{AD}"=" 				{console.log('<{AD}"=">'+'<'+yytext+'>');		return 'AD_IGUAL';}
">"     				{console.log('<">">'+'<'+yytext+'>');			return 'MAYOR';}
"<"     				{console.log('<"<">'+'<'+yytext+'>');			return 'MENOR';}
"~"     				{console.log('<"~">'+'<'+yytext+'>');			return 'EQUIVALENCIA';}
//logicos	return false o true
"&&"    				{console.log('<"&&">'+'<'+yytext+'>');			return 'AND';}
"!&"    				{console.log('<"!&">'+'<'+yytext+'>');          return 'AD_AND';}
[|][|]  				{console.log('<[|][|]>'+'<'+yytext+'>');        return 'OR';}
{AD}    				{console.log('<{AD}>'+'<'+yytext+'>');          return 'AD';}
"true"    				{console.log('<true>'+'<'+yytext+'>');          return 'TRUE';}
"false"    				{console.log('<false>'+'<'+yytext+'>');         return 'FALSE';}
/* ""    {console.log('<>'+'<'+yytext+'>');return '';} */
//aritmetico
"-" 					{console.log('<"-">'+'<'+yytext+'>');return 'MEN';}
"^" 					{console.log('<"^">'+'<'+yytext+'>');return 'POW';}
"*" 					{console.log('<"*">'+'<'+yytext+'>');return 'POR';}
"/" 					{console.log('<"/">'+'<'+yytext+'>');return 'DIV';}
"%" 					{console.log('<"%">'+'<'+yytext+'>');return 'MOD';}
"+" 					{console.log('<"+">'+'<'+yytext+'>');return 'MAS';}
//agrupacion
[(]     				{console.log('<[(]>'+'<'+yytext+'>');return 'P_APERTURA';}
")"     				{console.log('<[)]>'+'<'+yytext+'>');return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        		{console.log('<"importar">'+'<'+yytext+'>');return 'IMPORTAR';}
"Incerteza"        		{console.log('<"incerteza">'+'<'+yytext+'>');return 'INCERTEZA';}
"clr"        			{console.log('<"clr">'+'<'+yytext+'>');return 'CLR';}
//VARIABLE
"Double"  				{console.log('<"Double">'+'<'+yytext+'>');return 'DOUBLE';}
"Boolean" 				{console.log('<"Boolean">'+'<'+yytext+'>');return 'BOOLEAN';}
"String"  				{console.log('<"String">'+'<'+yytext+'>');return 'STRING';}
"Int"     				{console.log('<"Int">'+'<'+yytext+'>');return 'INT';}
"Char"    				{console.log('<"Char">'+'<'+yytext+'>');return 'CHAR';}
//solo para metodos
"Void"    				{console.log('<"Void">'+'<'+yytext+'>');return 'VOID';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<NUMERO>'+'<'+yytext+'>'+'<'+yytext+'>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9][a-zA-Z0-9]+ {console.log('<ID>'+'<'+yytext+'>');return 'ID';}
// DE ULTIMO SIEMPRE EL ID
["].*      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<STRING>'); return 'STRING'; }
//INORAR
. {console.log('<"ERROR">'+'<'+yytext+'>');}
<<EOF>>	return 'EOF';
/lex
//precedencia
%left 'MAS'
%left 'MEN'
%left 'MOD'
%left 'POR'
%left 'DIV'
%left 'POW'//NO PUEDE SER DERECHA
//          ==          !=             <     >          <=              >=          ~ 
%nonassoc 'IGUAL_IGUAL' 'AD_IGUAL' 'MENOR' 'MAYOR' 'MENOR_IGUAL' 'MAYOR_IGUAL' 'EQUIVALENCIA'
%left 'OR'
%left 'AD_AND'
%left 'AND'
%left 'AD'
%nonassoc 'P_APERTURA' 'P_CIERRE'

%start inicio
%%
/******************inicio de la sintactico********************/
inicio
    : documentacion EOF
    ;
documentacion 
    :import instrucciones
    ;
/******************HEAD , importacines********************/
import  
    :importar_incerteza import
    |
    ;
importar_incerteza 
    :IMPORTAR ID PUNTO CLR
    |INCERTEZA operacion_aritmetica 
    ;
/******************************************************operacion_aritmetica*/
operacion_aritmetica
    :operacion_aritmetica POW operacion_aritmetica  /*POTENCIA*/
    |operacion_aritmetica POR operacion_aritmetica  /*MULTIPLICACION*/
    |operacion_aritmetica DIV operacion_aritmetica  /*DIVISION*/
    |operacion_aritmetica MOD operacion_aritmetica  /*MODULO*/
    |operacion_aritmetica MAS operacion_aritmetica  /*SUMA*/
    |operacion_aritmetica MEN operacion_aritmetica  /*RESTA*/
    |P_APERTURA operacion_aritmetica P_CIERRE
    |NUMERO
    ;
/******************************************************operacion_logica*/
operacion_logica
    :operacion_logica AND operacion_logica      /*&&*/
    |operacion_logica AD_AND operacion_logica   /*!&*/
    |operacion_logica OR operacion_logica       /*||*/
    |AD operacion_logica                         /*!*/
    |P_APERTURA operacion_logica P_CIERRE                    
    |boolean
    ;
boolean
    :TRUE
    |FALSE
    ;
/******************************************************operacion_relacionales*/
operacion_relacionales
    : operacion_relacionales MAYOR_IGUAL operacion_relacionales     /*>=*/
    | operacion_relacionales MENOR_IGUAL operacion_relacionales     /*<=*/
    | operacion_relacionales IGUAL_IGUAL operacion_relacionales     /*==*/
    | operacion_relacionales AD_IGUAL operacion_relacionales        /*!=*/
    | operacion_relacionales MAYOR operacion_relacionales           /*>*/
    | operacion_relacionales MENOR operacion_relacionales           /*<*/
    | operacion_relacionales EQUIVALENCIA operacion_relacionales    /*~*/ 
    ;
/******************INSTRUCCIONES********************/
instrucciones
    :
    |variable_global_metodo_reasignacion instrucciones//variable_global_metodo global
    ;
variable_global_metodo_reasignacion
    :tipos_variables ID variable_metodo
    |VOID ID metodos_archivo
    |reasignacion_varable
    ;
variable_metodo
    :metodos_archivo // es un metodo
    |variable_global //es variable global
    ;
tipos_variables//tipos de variables o metodo menos void
    :DOUBLE
    |BOOLEAN
    |STRING
    |INT
    |CHAR
    ;
/******************METODOS********************/
metodos_archivo
    :P_APERTURA parametros_metodo P_CIERRE DOUBLE_PUNTO
    ;
parametros_metodo
    :
    |parametros
    ;
parametros
    :tipos_variables ID secuencia_parametros
    ;
secuencia_parametros
    :
    |COMA parametros
    ;
/******************VARIABLE GLOBAL********************/
variable_global
    :varias_declaraciones asignaciones_variable
    ;
varias_declaraciones
    :COMA ID varias_declaraciones
    |//termina ahi
    ;
/******************VARIABLE LOCAL********************/
/******************ASIGNACION DE VARIABLES********************/
reasignacion_varable
    :ID asignaciones_variable
    ;
asignaciones_variable
    :IGUAL datos
    ;
datos
    :STRING
    /******************************************************operacion_aritmetica*/
    |datos POW datos  /*POTENCIA*/
    |datos POR datos  /*MULTIPLICACION*/
    |datos DIV datos  /*DIVISION*/
    |datos MOD datos  /*MODULO*/
    |datos MAS datos  /*SUMA*/
    |datos MEN datos  /*RESTA*/
    /******************************************************operacion_logica*/
    |datos AND datos      /*&&*/
    |datos AD_AND datos   /*!&*/
    |datos OR datos       /*||*/
    |datos AD datos       /*!*/
    /******************************************************operacion_relacionales*/
    |datos MAYOR_IGUAL datos     /*>=*/
    |datos MENOR_IGUAL datos     /*<=*/
    |datos IGUAL_IGUAL datos     /*==*/
    |datos AD_IGUAL datos        /*!=*/
    |datos MAYOR datos           /*>*/
    |datos MENOR datos           /*<*/
    |datos EQUIVALENCIA datos    /*~*/ 
    |P_APERTURA  datos P_CIERRE
    |NUMERO
    |boolean
    ;