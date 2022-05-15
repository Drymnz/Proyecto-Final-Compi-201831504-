%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
COMMILA  \'
TRIPLE_COMILLA {COMMILA}{COMMILA}{COMMILA}
AMPERSAND   [&]
NID [|]
%%
/*********************token**********************/
\f   					{/* console.log('<Form Feed>'+yytext); */}
\n   					{/* console.log('<New Line>'+yytext); */}
\r   					{/* console.log('<Carriage Return>'+yytext); */}
\t|[\s][\s][\s][\s]   	{console.log('<Horizontal Tabulator>'+yytext);			return 'TABULADOR';}
\v   					{/* console.log('<Vertical Tabulator>'+yytext); */}
\s   					{console.log('<ESPACIO>'+yytext);}
//COMENTARIOS
{AD}{AD}.*        		                            {/* console.log('<COMENTARIO>'+yytext); */}//comentario simple
{TRIPLE_COMILLA}[^\'\'\']*{TRIPLE_COMILLA}          {/* console.log('<COMENTARIO_MULTILINEA>'+yytext); */}//comentario simple
//PUNTUACIONES
[.]            			{console.log('PUNTO'+yytext);							return 'PUNTO';}
[,]  					{console.log('<COMA>'+yytext);			return 'COMA';}
":"  					{console.log('<DOUBLE_PUNTO>'+yytext);	return 'DOUBLE_PUNTO';}
";"  					{console.log('<PUNTO_COMA>'+yytext);	return 'PUNTO_COMA';}
//SIMBOLOS
//simbolos de igual 
"="  					{console.log('<"=">'+yytext);			return 'IGUAL';}//asignaciones
// relacionales return false o true
">="    				{console.log('<>=>'+yytext);			return 'MAYOR_IGUAL';}
"<="    				{console.log('<<=>'+yytext);			return 'MENOR_IGUAL';}
"=="    				{console.log('<"==">'+yytext);			return 'IGUAL_IGUAL';}
{AD}"=" 				{console.log('<{AD}"=">'+yytext);		return 'AD_IGUAL';}
">"     				{console.log('<">">'+yytext);			return 'MAYOR';}
"<"     				{console.log('<"<">'+yytext);			return 'MENOR';}
"~"     				{console.log('<"~">'+yytext);			return 'EQUIVALENCIA';}
//logicos	return false o true
{AMPERSAND}{AMPERSAND}    				{console.log('<"&&">'+yytext);			    return 'AND';}
{NID}{AMPERSAND}    				    {console.log('<"|&">'+yytext);             return 'AD_AND';}
{NID}{NID}  				            {console.log('<[|][|]>'+yytext);           return 'OR';}
{AD}    				                {console.log('<!>'+yytext);                return 'AD';}
"true"    				                {console.log('<true>'+yytext);             return 'TRUE';}
"false"    				                {console.log('<false>'+yytext);            return 'FALSE';}
/* ""    {console.log('<>'+yytext);return '';} */
// PARA 
"++" return 'PLUS_PLUS'
"--" return 'LESS_LESS'
//aritmetico
"-" 					{console.log('<"-">'+yytext);return 'MEN';}
"^" 					{console.log('<"^">'+yytext);return 'POW';}
"*" 					{console.log('<"*">'+yytext);return 'POR';}
"/" 					{console.log('<"/">'+yytext);return 'DIV';}
"%" 					{console.log('<"%">'+yytext);return 'MOD';}
"+" 					{console.log('<"+">'+yytext);return 'MAS';}
//agrupacion
[(]     				{console.log('<[(]>'+yytext);return 'P_APERTURA';}
")"     				{console.log('<[)]>'+yytext);return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        		{console.log('<"importar">'+yytext);    return 'IMPORTAR';}
"Incerteza"        		{console.log('<"incerteza">'+yytext);   return 'INCERTEZA';}
"clr"        			{console.log('<"clr">'+yytext);         return 'CLR';}
//VARIABLE
"Double"  				{console.log('<"Double">'+yytext);  return 'DOUBLE';}
"Boolean" 				{console.log('<"Boolean">'+yytext); return 'BOOLEAN';}
"String"  				{console.log('<"String">'+yytext);  return 'STRING';}
"Int"     				{console.log('<"Int">'+yytext);     return 'INT';}
"Char"    				{console.log('<"Char">'+yytext);    return 'CHAR';}
//solo para metodos
"Void"    				{console.log('<"Void">'+yytext);    return 'VOID';}
//SENTENCIA
"Si"                    {console.log('<"SI">'+yytext);              return 'SI';}
"Sino"                  {console.log('<"SINO">'+yytext);            return 'SINO';}
"Para"                  {console.log('<"PARA">'+yytext);            return 'PARA';}
"Mientras"              {console.log('<"MIENTRA">'+yytext);         return 'MIENTRA';}
"Retorno"               {console.log('<"RETURN">'+yytext);          return 'RETORNO';}
"Detener"               {console.log('<"BREACK">'+yytext);          return 'BREACK';}
"Continuar"             {console.log('<"CONTINUAR">'+yytext);       return 'CONTINUAR';}
{COMMILA}.{COMMILA}      {console.log('<"CHAR">'+yytext);       return 'DATO_CHAR';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<NUMERO>'+yytext);return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9]([a-zA-Z0-9]+)? {console.log('<ID>'+yytext);return 'ID';}
// DE ULTIMO SIEMPRE EL ID
\"[^\"]*\"      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<STRING>'+yytext); return 'STRING'; }
//INORAR
. {console.log('<"ERROR">'+yytext);}
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
 class Reporte {
  constructor() {
    this.texto_salida = "";
    this.texto_errores = "";
  }
  appetTexto_salida(testo) {
    if (this.acctivar) {
      this.texto_salida += testo;
    }
  }
  appetTexto_errores(testo) {
    this.texto_errores += testo;
  }
}
const TIPOS_VARIALE = {
  Double: "Double",
  Boolean: "Boolean",
  String: "String",
  Int: "Int",
  Char: "Char",
};
class Variable {
  constructor(id, valor, tipos) {
    this.id = id;
    this.valor = valor;
    this.tipos = tipos;
  }
  setValor(valor) {
    this.valor = valor;
  }
}
class TablaHabito {
  constructor() {
    this.incerteza = 0.5;
    this.listadoStatico = new Array();
    this.listadoLocal = new Array();
  }
  pushListadoStatico(dato) {
    this.listadoStatico.push(dato);
  }
  busquedaListado(array, dato) {
    if (array!=undefined) {
      array.forEach((element) => {
        if (element === dato) {
          return false;
        }
      });
    }
   
    return true;
  }
  busquedaDatoListadoStatico(dato) {
    if (dato != undefined) {
      dato.forEach((element) => {
        if (element.id === dato) {
          return element;
        }
      });
    }
    return undefined;
  }
  busquedaListadoDato(array, dato) {
    if (array != undefined) {
      array.forEach((element) => {
        if (element === dato) {
          return dato;
        }
      });
    }
    return undefined;
  }
  setInsertesa(dato){
    this.incerteza = dato;
  }
}
let reprotes = new Reporte();
let tabla = new TablaHabito();
let boolean_variable = false;
let boolean_metodo = false;
let tipo_actual = undefined;


%}
%%
/******************inicio de la sintactico********************/
inicio
    : documentacion EOF  {
    $$ = new TablaHabito();
    Object.assign($$,tabla)
    /* reiniciar esto */
    reprotes = new Reporte();
    tabla = new TablaHabito();
    boolean_variable = false;
    boolean_metodo = false;
    tipo_actual = undefined;
    return $$;
    }
    ;
documentacion 
    :import  documentacion 
    |instrucciones documentacion 
    |
    ;
/******************Encabezado , importacines********************/
import  
    :importar_incerteza 
    ;
importar_incerteza 
    :IMPORTAR ID PUNTO CLR 
    |INCERTEZA operacion_aritmetica  {tabla.setInsertesa($2);} 
    ;
/******************************************************operacion_aritmetica*/
operacion_aritmetica
    :operacion_aritmetica POW operacion_aritmetica  /*POTENCIA*/       {$$ = Math.pow($1, $3);}
    |operacion_aritmetica POR operacion_aritmetica  /*MULTIPLICACION*/ {$$ = $1*$3;}
    |operacion_aritmetica DIV operacion_aritmetica  /*DIVISION*/       {$$ = $1/$3;}
    |operacion_aritmetica MOD operacion_aritmetica  /*MODULO*/       {$$ = $1/100;}  
    |operacion_aritmetica MAS operacion_aritmetica  /*SUMA*/        {$$ = $1+$3;}     
    |operacion_aritmetica MEN operacion_aritmetica  /*RESTA*/       {$$ = $1-$3;}       
    |P_APERTURA operacion_aritmetica P_CIERRE   {$$=$2;}
    |NUMERO    {$$ = Number(yytext);} 
    |ID        {$$ = yytext;} 
    ;
/****************************INICIO DE VARIABLES GLOBALES O METODO**************************************************INSTRUCCIONES********************/
instrucciones
    :variable_global_metodo_reasignacion /* variable_global_metodo global */
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