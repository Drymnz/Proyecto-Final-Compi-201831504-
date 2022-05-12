%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
COMMILA  \'
TRIPLE_COMILLA {COMMILA}{COMMILA}{COMMILA}
AMPERSAND   [&]
NID [|]
%%
/*********************token**********************/
\f   					{console.log('<Form Feed>');}
\n   					{/* console.log('<New Line>'); */}
\r   					{/* console.log('<Carriage Return>'); */}
\t|[\s][\s][\s][\s]   	{console.log('<Horizontal Tabulator>');			return 'TABULADOR';}
\v   					{console.log('<Vertical Tabulator>');}
\s   					{console.log('<ESPACIO>');}
//COMENTARIOS
{AD}{AD}.*        		                            {console.log('<COMENTARIO>');}//comentario simple
{TRIPLE_COMILLA}[^\'\'\']*{TRIPLE_COMILLA}          {console.log('<COMENTARIO_MULTILINEA>');}//comentario simple
//PUNTUACIONES
[.]            			{console.log('PUNTO');							return 'PUNTO';}
[,]  					{console.log('<COMA>');			return 'COMA';}
":"  					{console.log('<DOUBLE_PUNTO>');	return 'DOUBLE_PUNTO';}
";"  					{console.log('<PUNTO_COMA>');	return 'PUNTO_COMA';}
//SIMBOLOS
//simbolos de igual 
"="  					{console.log('<"=">');			return 'IGUAL';}//asignaciones
// relacionales return false o true
">="    				{console.log('<>=>');			return 'MAYOR_IGUAL';}
"<="    				{console.log('<<=>');			return 'MENOR_IGUAL';}
"=="    				{console.log('<"==">');			return 'IGUAL_IGUAL';}
{AD}"=" 				{console.log('<{AD}"=">');		return 'AD_IGUAL';}
">"     				{console.log('<">">');			return 'MAYOR';}
"<"     				{console.log('<"<">');			return 'MENOR';}
"~"     				{console.log('<"~">');			return 'EQUIVALENCIA';}
//logicos	return false o true
{AMPERSAND}{AMPERSAND}    				{console.log('<"&&">');			    return 'AND';}
{NID}{AMPERSAND}    				    {console.log('<"|&">');             return 'AD_AND';}
{NID}{NID}  				            {console.log('<[|][|]>');           return 'OR';}
{AD}    				                {console.log('<!>');                return 'AD';}
"true"    				                {console.log('<true>');             return 'TRUE';}
"false"    				                {console.log('<false>');            return 'FALSE';}
/* ""    {console.log('<>');return '';} */
// PARA 
"++" return 'PLUS_PLUS'
"--" return 'LESS_LESS'
//aritmetico
"-" 					{console.log('<"-">');return 'MEN';}
"^" 					{console.log('<"^">');return 'POW';}
"*" 					{console.log('<"*">');return 'POR';}
"/" 					{console.log('<"/">');return 'DIV';}
"%" 					{console.log('<"%">');return 'MOD';}
"+" 					{console.log('<"+">');return 'MAS';}
//agrupacion
[(]     				{console.log('<[(]>');return 'P_APERTURA';}
")"     				{console.log('<[)]>');return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        		{console.log('<"importar">');    return 'IMPORTAR';}
"Incerteza"        		{console.log('<"incerteza">');   return 'INCERTEZA';}
"clr"        			{console.log('<"clr">');         return 'CLR';}
//VARIABLE
"Double"  				{console.log('<"Double">');  return 'DOUBLE';}
"Boolean" 				{console.log('<"Boolean">'); return 'BOOLEAN';}
"String"  				{console.log('<"String">');  return 'STRING';}
"Int"     				{console.log('<"Int">');     return 'INT';}
"Char"    				{console.log('<"Char">');    return 'CHAR';}
//solo para metodos
"Void"    				{console.log('<"Void">');    return 'VOID';}
//SENTENCIA
"Si"                    {console.log('<"SI">');              return 'SI';}
"Sino"                  {console.log('<"SINO">');            return 'SINO';}
"Para"                  {console.log('<"PARA">');            return 'PARA';}
"Mientras"              {console.log('<"MIENTRA">');         return 'MIENTRA';}
"Retorno"               {console.log('<"RETURN">');          return 'RETORNO';}
"Detener"               {console.log('<"BREACK">');          return 'BREACK';}
"Continuar"             {console.log('<"CONTINUAR">');       return 'CONTINUAR';}

//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<NUMERO>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9]([a-zA-Z0-9]+)? {console.log('<ID>');return 'ID';}
// DE ULTIMO SIEMPRE EL ID
\"[^\"]*\"      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<STRING>'); return 'STRING'; }
//INORAR
. {console.log('<"ERROR">');}
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
    |ID
    ;
/****************************INICIO DE VARIABLES GLOBALES O METODO**************************************************INSTRUCCIONES********************/
instrucciones
    :/*NADA*/
    |variable_global_metodo_reasignacion instrucciones//variable_global_metodo global
    ;
variable_global_metodo_reasignacion
    :tipos_variables ID variable_metodo	//aqui creo variables
    |VOID ID metodos_archivo	//aqui creo metodos
    |reasignacion_varable	//aqui reutilizo una vriable
    ;
variable_metodo
    :metodos_archivo // es un metodo
    |variable_global //es variable global
    ;
tipos_variables//tipos de variables o metodos menos void 
    :DOUBLE
    |BOOLEAN
    |STRING
    |INT
    |CHAR
    ;
/****************************************METODOS********************/
metodos_archivo
    :P_APERTURA parametros_metodo P_CIERRE DOUBLE_PUNTO instrucciones_locales
    ;
parametros_metodo	// si posee parametros de entra el metodo
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
/************instrucciones locales NOTA:SOLO UNA TABULACION ya que es un metodo*/
instrucciones_locales
    :tabulaciones habito_local instrucciones_locales
    |
    ;
/************************************************************REALIZACION DE HABITOS LOCALES DE UN METODO*******************************/   
habito_local
    :variable_local		//declaracion de una variable local
    |usar_varaible_local  		//uso de variables o metodos
    |sentencias_control 	//sentencias de control
    |RETORNO datos		//si el metodo require returnar algo
    |BREACK             //DETENER 
    |CONTINUAR          //CONTINUAR
    ;
/******************************************************usar variable o metodo*/
usar_varaible_local
    :ID factorizacion_usar_varaible_local
    ;
factorizacion_usar_varaible_local
    :usar_varaible_factorizacion_literal
    |asignaciones_variable
    ;
usar_varaible
    :ID usar_varaible_factorizacion
    ;
usar_varaible_factorizacion
    :usar_varaible_factorizacion_literal
    |/*importante ya que tamien el datos usa esto de usar_variable*/
    ;
usar_varaible_factorizacion_literal
    :P_APERTURA secuencia_datos P_CIERRE
    |PUNTO usar_varaible
    ;
/******************VARIABLE LOCAL********************/
variable_local
    :tipos_variables ID variable_global// aquie estara la declaracion de las variables
    ;
/******************VARIABLE GLOBAL********************/
secuencia_datos
    :datos secuencia_datos_factorizado
    |
    ;
secuencia_datos_factorizado
    :COMA datos secuencia_datos_factorizado
    |
    ;
variable_global
    :varias_declaraciones asignaciones_variable
    ;
varias_declaraciones
    :COMA ID varias_declaraciones
    |/*termina ahi*/
    ;
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
    |usar_varaible //VARAIBLE
    ;
/******************SENTENCIAS DE CONTROL********************/
sentencias_control
    :SI P_APERTURA datos P_CIERRE DOUBLE_PUNTO  
    |PARA P_APERTURA condiciones_for P_CIERRE DOUBLE_PUNTO 
    |MIENTRA P_APERTURA datos P_CIERRE DOUBLE_PUNTO 
    |SINO DOUBLE_PUNTO
    ;
/****************************************sentencia para*/
condiciones_for
    :variable_local PUNTO_COMA  datos PUNTO_COMA decremento_incremento
    ;
decremento_incremento
    :PLUS_PLUS
    |LESS_LESS
    ;
/***************************************************************tabulaciones*/
tabulaciones
    :tabulaciones TABULADOR
    |TABULADOR
    ;
