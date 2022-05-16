%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
COMMILA  \'
TRIPLE_COMILLA {COMMILA}{COMMILA}{COMMILA}
AMPERSAND   [&]
NID [|]
%%
/*********************token**********************/
\f   					{/* file.appetTexto_salida(' '); */}
\n   					{/* console.log(', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); */file.appetTexto_salida('\n');}
\r   					{/* file.appetTexto_salida(' ') */;}
\t|[\s][\s][\s][\s]   	{file.appetTexto_salida('\t');			return 'TABULADOR';}
\v   					{/* file.appetTexto_salida(' '); */}
\s   					{file.appetTexto_salida(' ');}
//COMENTARIOS
{AD}{AD}.*        		                            {file.appetTexto_salida(yytext);}//comentario simple
{TRIPLE_COMILLA}[^\'\'\']*{TRIPLE_COMILLA}          {file.appetTexto_salida(yytext);}//comentario simple
//PUNTUACIONES
[.]            			{file.appetTexto_salida(yytext);	return 'PUNTO';}
[,]  					{file.appetTexto_salida(yytext);	return 'COMA';}
":"  					{file.appetTexto_salida(yytext);	return 'DOUBLE_PUNTO';}
";"  					{file.appetTexto_salida(yytext);	return 'PUNTO_COMA';}
//SIMBOLOS
//simbolos de igual 
"="  					{file.appetTexto_salida(yytext);	return 'IGUAL';}//asignaciones
// relacionales return false o true
">="    				{file.appetTexto_salida(yytext);	return 'MAYOR_IGUAL';}
"<="    				{file.appetTexto_salida(yytext);	return 'MENOR_IGUAL';}
"=="    				{file.appetTexto_salida(yytext);	return 'IGUAL_IGUAL';}
{AD}"=" 				{file.appetTexto_salida(yytext);	return 'AD_IGUAL';}
">"     				{file.appetTexto_salida(yytext);	return 'MAYOR';}
"<"     				{file.appetTexto_salida(yytext);	return 'MENOR';}
"~"     				{file.appetTexto_salida(yytext);    return 'EQUIVALENCIA';}
//logicos	return false o true
{AMPERSAND}{AMPERSAND}    				{file.appetTexto_salida(yytext);	return 'AND';}
{NID}{AMPERSAND}    				    {file.appetTexto_salida(yytext);    return 'AD_AND';}
{NID}{NID}  				            {file.appetTexto_salida(yytext);    return 'OR';}
{AD}    				                {file.appetTexto_salida(yytext);    return 'AD';}
"true"    				                {file.appetTexto_salida(yytext);    return 'TRUE';}
"false"    				                {file.appetTexto_salida(yytext);    return 'FALSE';}
/* ""    {.appetTexto_salida(yytext);return '';} */
// PARA 
"++" {file.appetTexto_salida(yytext);return 'PLUS_PLUS';}
"--" {file.appetTexto_salida(yytext);return 'LESS_LESS';}
//aritmetico
"-" 					{file.appetTexto_salida(yytext);return 'MEN';}
"^" 					{file.appetTexto_salida(yytext);return 'POW';}
"*" 					{file.appetTexto_salida(yytext);return 'POR';}
"/" 					{file.appetTexto_salida(yytext);return 'DIV';}
"%" 					{file.appetTexto_salida(yytext);return 'MOD';}
"+" 					{file.appetTexto_salida(yytext);return 'MAS';}
//agrupacion
[(]     				{file.appetTexto_salida(yytext);return 'P_APERTURA';}
")"     				{file.appetTexto_salida(yytext);return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        		{return 'IMPORTAR';}
"Incerteza"        		{return 'INCERTEZA';}
"clr"        			{return 'CLR';}
//VARIABLE
"Double"  				{file.acctivar = true;texto_agregar=''; if(primera){let numero = Number(yylloc.first_line)-2; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yytext);      return 'DOUBLE';}
"Boolean" 				{file.acctivar = true;texto_agregar=''; if(primera){let numero = Number(yylloc.first_line)-2; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yytext);      return 'BOOLEAN';}
"String"  				{file.acctivar = true;texto_agregar=''; if(primera){let numero = Number(yylloc.first_line)-2; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yytext);      return 'STRING';}
"Int"     				{file.acctivar = true;texto_agregar=''; if(primera){let numero = Number(yylloc.first_line)-2; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yytext);      return 'INT';}
"Char"    				{file.acctivar = true;texto_agregar=''; if(primera){let numero = Number(yylloc.first_line)-2; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yytext);      return 'CHAR';}
//solo para metodos
"Void"    				{file.acctivar = true;file.appetTexto_salida(yytext);return 'VOID';}
//SENTENCIA
"Si"                    {file.appetTexto_salida(yytext);    return 'SI';}
"Sino"                  {file.appetTexto_salida(yytext);    return 'SINO';}
"Para"                  {file.appetTexto_salida(yytext);    return 'PARA';}
"Mientras"              {file.appetTexto_salida(yytext);    return 'MIENTRA';}
"Retorno"               {file.appetTexto_salida(yytext);    return 'RETORNO';}
"Detener"               {file.appetTexto_salida(yytext);    return 'BREACK';}
"Continuar"             {file.appetTexto_salida(yytext);    return 'CONTINUAR';}
{COMMILA}.{COMMILA}     {file.appetTexto_salida(yytext);    return 'DATO_CHAR';}
//GENERICOS
[0-9]+("."[0-9]+)?\b        {file.appetTexto_salida(yytext);    return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9]([a-zA-Z0-9]+)?  {file.appetTexto_salida(yytext);    return 'ID';}
// DE ULTIMO SIEMPRE EL ID
\"[^\"]*\"      { file.appetTexto_salida(yytext); return 'STRING'; }
//INORAR
. {file.appetTexto_salida(yytext);}
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

%{
 class Intreprete {
  constructor() {
    this.texto_salida = "";
    this.texto_errores = "";
    this.array_importaciiones = new Array();
    this.acctivar = false;
  }
  appetTexto_salida(testo) {
    if (this.acctivar) {
      this.texto_salida += testo;
    }
  }
  appetTexto_errores(testo) {
    this.texto_errores += testo;
  }
  pushArray_Importaciiones(text){
    this.array_importaciiones.push(text);
  }
  getText_Salida(){
    return this.texto_salida;
  }
}
let primera = true;
let file = new Intreprete();
let insertesa = '';
let texto_agregar = '';
%}
%%
/******************inicio de la sintactico********************/
inicio
    : documentacion EOF  {
    $$ = new Intreprete();
    file.texto_salida = insertesa +'\n'+ file.texto_salida+'\n';
    Object.assign($$,file)
    file = new Intreprete();//reiniciar esto
    return $$;
    }
    ;
documentacion 
    :import instrucciones  
    ;
/******************Encabezado , importacines********************/
import  
    :importar_incerteza import 
    |
    ;
importar_incerteza 
    :IMPORTAR ID PUNTO CLR {file.pushArray_Importaciiones($2);}
    |INCERTEZA operacion_aritmetica {insertesa= 'Incerteza ' + $2;}   
    ;
/******************************************************operacion_aritmetica*/
operacion_aritmetica
    :operacion_aritmetica POW operacion_aritmetica  /*POTENCIA*/      {$$=$1+'^'+$3;}   
    |operacion_aritmetica POR operacion_aritmetica  /*MULTIPLICACION*/{$$=$1+'*'+$3;}   
    |operacion_aritmetica DIV operacion_aritmetica  /*DIVISION*/ {$$=$1+'/'+$3;}        
    |operacion_aritmetica MOD operacion_aritmetica  /*MODULO*/   {$$=$1+'%'+$3;}        
    |operacion_aritmetica MAS operacion_aritmetica  /*SUMA*/     {$$=$1+'-'+$3;}        
    |operacion_aritmetica MEN operacion_aritmetica  /*RESTA*/    {$$=$1+'+'+$3;}      
    |P_APERTURA operacion_aritmetica P_CIERRE {$$='('+$2+')';}
    |NUMERO  {$$=$1;}   
    |ID      {$$=$1;}   
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
///////////////////////////////////////////////////////////TIPOS DE DATOS
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
    |valores_chart
    ;
valores_chart
    :DATO_CHAR
    ;
boolean
    :TRUE
    |FALSE
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
