%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
%%
/*********************token**********************/
\f   {console.log('<Form Feed>'+'<'+yytext+'>');}
\n   {console.log('<New Line>'+'<'+yytext+'>');}
\r   {console.log('<Carriage Return>'+'<'+yytext+'>');}
\t|[\s][\s][\s][\s]   {console.log('<Horizontal Tabulator>'+'<'+yytext+'>');return 'TABULADOR';}
\v   {console.log('<Vertical Tabulator>'+'<'+yytext+'>');}
\s   {console.log('<ESPACIO>'+'<'+yytext+'>');}
\\   {console.log('<Backslash>'+'<'+yytext+'>');}
//COMENTARIOS
{AD}{AD}.*        {console.log('<COMENTARIO>'+'<'+yytext+'>');}//comentario simple
//PUNTUACIONES
[.]            {console.log('<.>'+'<'+yytext+'>');return 'PUNTO';}
//SIMBOLOS
//simbolos de igual 
"="  {console.log('<"=">'+'<'+yytext+'>');return 'IGUAL';}//asignaciones
// relacionales
">="    {console.log('<>=>'+'<'+yytext+'>');return 'MAYOR_IGUAL';}
"<="    {console.log('<<=>'+'<'+yytext+'>');return 'MENOR_IGUAL';}
"=="    {console.log('<"==">'+'<'+yytext+'>');return 'IGUAL_IGUAL';}
{AD}"=" {console.log('<{AD}"=">'+'<'+yytext+'>');return 'AD_IGUAL';}
">"     {console.log('<">">'+'<'+yytext+'>');return 'MAYOR';}
"<"     {console.log('<"<">'+'<'+yytext+'>');return 'MENOR';}
"~"     {console.log('<"~">'+'<'+yytext+'>');return 'EQUIVALENCIA';}
//logicos
"&&"    {console.log('<"&&">'+'<'+yytext+'>');return 'AND';}
"!&"    {console.log('<"!&">'+'<'+yytext+'>');return 'AD_AND';}
[|][|]  {console.log('<[|][|]>'+'<'+yytext+'>');return 'OR';}
{AD}    {console.log('<{AD}>'+'<'+yytext+'>');return 'AD';}
"true"    {console.log('<true>'+'<'+yytext+'>');return 'TRUE';}
"false"    {console.log('<false>'+'<'+yytext+'>');return 'FALSE';}
/* ""    {console.log('<>'+'<'+yytext+'>');return '';} */
//aritmetico
"-" {console.log('<"-">'+'<'+yytext+'>');return 'MEN';}
"^" {console.log('<"^">'+'<'+yytext+'>');return 'POW';}
"*" {console.log('<"*">'+'<'+yytext+'>');return 'POR';}
"/" {console.log('<"/">'+'<'+yytext+'>');return 'DIV';}
"%" {console.log('<"%">'+'<'+yytext+'>');return 'MOD';}
"+" {console.log('<"+">'+'<'+yytext+'>');return 'MAS';}
//puntuacion
[,]  {console.log('<[,]>'+'<'+yytext+'>');return 'COMA';}
":"  {console.log('<DOUBLE_PUNTO>'+'<'+yytext+'>');return 'DOUBLE_PUNTO';}
//agrupacion
[(]     {console.log('<[(]>'+'<'+yytext+'>');return 'P_APERTURA';}
")"     {console.log('<[)]>'+'<'+yytext+'>');return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        {console.log('<"importar">'+'<'+yytext+'>');return 'IMPORTAR';}
"Incerteza"        {console.log('<"incerteza">'+'<'+yytext+'>');return 'INCERTEZA';}
"clr"        {console.log('<"clr">'+'<'+yytext+'>');return 'CLR';}
//VARIABLE
"Double"  {console.log('<"Double">'+'<'+yytext+'>');return 'DOUBLE';}
"Boolean" {console.log('<"Boolean">'+'<'+yytext+'>');return 'BOOLEAN';}
"String"  {console.log('<"String">'+'<'+yytext+'>');return 'STRING';}
"Int"     {console.log('<"Int">'+'<'+yytext+'>');return 'INT';}
"Char"    {console.log('<"Char">'+'<'+yytext+'>');return 'CHAR';}
//solo para metodos
"Void"    {console.log('<"Void">'+'<'+yytext+'>');return 'VOID';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<[0-9]+("."[0-9]+)?\b>'+'<'+yytext+'>'+'<'+yytext+'>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9][a-zA-Z0-9]+      {console.log('<ID>'+'<'+yytext+'>');return 'ID';}
// DE ULTIMO SIEMPRE EL ID
["].*      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<["].>'); return 'STRING'; }
//INORAR
. {console.log('<"ERROR">'+'<'+yytext+'>');}
<<EOF>>				return 'EOF';
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
//comienzo del programa
inicio
    : documentacion inicio  EOF
    ;
documentacion 
    :import instrucciones
    ;
/******************ESTE ES EL HEAD********************/
import  
    :encabezado import
    |
    ;
encabezado 
    :IMPORTAR ID PUNTO CLR
    |INCERTEZA NUMERO 
    ;
/******************INSTRUCCIONES********************/
instrucciones
    :declaraciones //declaracion de una variable
    |usar
    ;
/******************USAR DATOS O VARIABLE********************/
usar
    :ID factorizacion_usar
    ;
factorizacion_usar
    :PUNTO
    |IGUAL llamado_metodos
    |P_APERTURA vasillo_datos P_CIERRE
    |
    ;
llamado_metodos
    :datos
    |ID P_APERTURA vasillo_datos P_CIERRE
    ;
vasillo_datos
    :secuencia_datos
    |
    ;
secuencia_datos
    :secuencia_datos COMA datos
    |datos
    ;
/******************DECLARACION DE VARIABLE********************/
declaraciones
    :tipos_variables ID variable_metodo
    |VOID ID metodo
    ;
variable  
    :COMA ID variable
    |asignarcion
    ;
variable_metodo
    :variable
    |metodo
    ;
tipos_variables
    :DOUBLE
    |BOOLEAN
    |STRING
    |INT
    |CHAR
    ;
/******************VARIABLE LOCALES********************/
variable_local
    :tipos_variables ID variable
    ;
///////////////////////////////////////////////////////////////////
/******************DECLARACION DE METODOS********************/
metodo
    :P_APERTURA parametros P_CIERRE DOUBLE_PUNTO indicaciones
    ;
parametros 
    :parametros COMA ID
    |tipos_variables ID
    |
    ;
indicaciones
    :indicaciones numeracion_tabulacion sentencias_uso_variable 
    |numeracion_tabulacion sentencias_uso_variable 
    ;
numeracion_tabulacion
    :numeracion_tabulacion TABULADOR
    |TABULADOR
    ;
/******************INDICACIONES DENTRO DE UN METODO********************/
sentencias_uso_variable
    :usar
    |sentencias
    |variable_local
    ;
sentencias
    :SI
    |PARA
    |MIENTRA
    ; 
/******************ASIGNACION DE VARIABLE********************/
asignarcion
    :/*nada*/
    |IGUAL datos
    ;
/******************OPERACIONES********************/
datos
    :datos MEN datos
    |datos POW datos
    |datos POR datos
    |datos DIV datos
    |datos MOD datos
    |datos MAS datos
    |datos AND datos
    |datos AD_AND datos
    |datos OR datos
    |datos AD datos
    |datos MAYOR_IGUAL datos
    |datos MENOR_IGUAL datos
    |datos IGUAL_IGUAL datos
    |datos AD_IGUAL datos
    |datos MAYOR datos
    |datos MENOR datos
    |P_APERTURA datos P_CIERRE
/******************DATOS USAR********************/
    |NUMERO
    |STRING
    |ID
    |TRUE
    |FALSE
    ;
