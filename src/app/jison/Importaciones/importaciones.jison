%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
CARACTER  [a-zA-Z0-9][a-zA-Z0-9]+
PUNTO   [.]
%%
/*********************token**********************/
[\s][\s][\s][\s]|[\t]   {console.log('espacio<'+yytext+'>');}
//COMENTARIOS
{AD}{AD}.*        {console.log('<'+yytext+'>');}//comentario simple
//PUNTUACIONES
{PUNTO}            {console.log('<'+yytext+'>');return 'PUNTO';}
//SENTENCIA
"Si"        {console.log('<'+yytext+'>');return 'SI';}
"Sino"      {console.log('<'+yytext+'>');return 'SINO';}
"Para"      {console.log('<'+yytext+'>');return 'PARA';}
"Mientras"  {console.log('<'+yytext+'>');return 'MIENTRA';}
"Retorno"   {console.log('<'+yytext+'>');return 'RETURN';}
"Detener"   {console.log('<'+yytext+'>');return 'BREACK';}
"Continuar" {console.log('<'+yytext+'>');return 'CONTINUAR';}
//SIMBOLOS
//simbolos de igual 
"="  {console.log('<'+yytext+'>');return 'IGUAL';}//asignaciones
// relacionales
">="    {console.log('<'+yytext+'>');return 'MAYOR_IGUAL';}
"<="    {console.log('<'+yytext+'>');return 'MENOR_IGUAL';}
"=="    {console.log('<'+yytext+'>');return 'IGUAL_IGUAL';}
{AD}"=" {console.log('<'+yytext+'>');return 'AD_IGUAL';}
">"     {console.log('<'+yytext+'>');return 'MAYOR';}
"<"     {console.log('<'+yytext+'>');return 'MENOR';}
"~"     {console.log('<'+yytext+'>');return 'EQUIVALENCIA';}
//logicos
"&&"    {console.log('<'+yytext+'>');return 'AND';}
"!&"    {console.log('<'+yytext+'>');return 'AD_AND';}
[|][|]  {console.log('<'+yytext+'>');return 'OR';}
{AD}    {console.log('<'+yytext+'>');return 'AD';}
//aritmetico
"-" {console.log('<'+yytext+'>');return 'MEN';}
"^" {console.log('<'+yytext+'>');return 'POW';}
"*" {console.log('<'+yytext+'>');return 'POR';}
"/" {console.log('<'+yytext+'>');return 'DIV';}
"%" {console.log('<'+yytext+'>');return 'MOD';}
"+" {console.log('<'+yytext+'>');return 'MAS';}
//puntuacion
[,]  {console.log('<'+yytext+'>');return 'COMA';}
//agrupacion
[(]     {console.log('<'+yytext+'>');return 'P_APERTURA';}
[)]     {console.log('<'+yytext+'>');return 'C_APERTURA';}
//HEAD FROM PROYECT
"importar"        {console.log('<'+yytext+'>');return 'IMPORTAR';}
"incerteza"        {console.log('<'+yytext+'>');return 'INCERTEZA';}
"clr"        {console.log('<'+yytext+'>');return 'CLR';}
//VARIABLE
"Double"  {console.log('<'+yytext+'>');return 'DOUBLE';}
"Boolean" {console.log('<'+yytext+'>');return 'BOOLEAN';}
"String"  {console.log('<'+yytext+'>');return 'STRING';}
"Int"     {console.log('<'+yytext+'>');return 'INT';}
"Char"    {console.log('<'+yytext+'>');return 'CHAR';}
//solo para metodos
"Void"    {console.log('<'+yytext+'>');return 'VOID';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<'+yytext+'>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
// DE ULTIMO SIEMPRE EL ID
{CARACTER}       {console.log('<'+yytext+'>');return 'ID';}
["].*      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<'+yytext+'>'); return 'STRING'; }
//INORAR
\s+         {console.log('<'+yytext+'>');}//se come los saltos de linea
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
    : documentacion inicio  
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
    ;
llamado_metodos
    :datos
    |ID P_APERTURA vasillo_datos C_APERTURA
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
    :sentencias_uso_variable 
    ;
numeracion_tabulacion
    :numeracion_tabulacion TABULACION
    |TABULACION
    ;
/******************INDICACIONES DENTRO DE UN METODO********************/
sentencias_uso_variable
    :usar
    |sentencias
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
    |P_APERTURA datos C_APERTURA
    /******************DATOS USAR********************/
    |NUMERO
    |STRING
    ;
