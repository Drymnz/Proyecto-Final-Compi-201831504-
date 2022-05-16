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

class Variable {
  constructor(id, valor, tipos) {
    this.id = id;
    this.valor = valor;
    this.tipos = tipos;
  }
  setValor(valor) {
    this.valor = valor;
  }
  print() {
    console.log(
      "id<" + this.id + ">valor<" + this.valor + ">tipos<" + this.tipos + ">"
    );
  }
}
class TablaHabito {
  constructor() {
    this.incerteza = 0.5;
    this.listadoStatico = new Array();
    this.listadoLocal = new Array();
  }
  /* 
  @ dato espero un dato objeto tipo variable
  */
  pushListadoStatico(dato) {
    if (this.listadoStatico == undefined || this.listadoStatico==[]) {
      if (!verificacionIDiguales(dato)) {
        this.listadoStatico.push(dato);
      }
    }else{
      this.listadoStatico.push(dato);
    }
  }
  /* 
  @ dato espero un dato objeto tipo variable
  */
  verificacionIDiguales(dato){
    let datoreturnar = (busquedaListadoStatico(dato)!=undefined);
    return datoreturnar;
  }
  /* 
  @ dato espero un dato objeto tipo variable
  */
  busquedaListadoStatico(dato) {
    let datoreturnar = undefined;
    this.listadoStatico.forEach((object) => {
      if (String(object.id) === String(dato.id)) {
        object.print();
        datoreturnar = object;
        return object;
      }
    });
    return datoreturnar;
  }
  /* 
  @ dato espero un dato objeto tipo number
  */
  setInsertesa(dato) {
    this.incerteza = dato;
  }
  /* verificacion de todos lo ingresado */
  verificacoinListadoEstatico(){
    for (let index = this.listadoStatico.length-1; index > -1; index--) {
      let num = index-1;
      console.log('*****************************************************************');
      this.listadoStatico[index].print();
      if(num>-1){
        this.listadoStatico[num].print();
        if (this.listadoStatico[index].tipos == this.listadoStatico[num].tipos && this.listadoStatico[index].valor==undefined) {
          this.listadoStatico[num].print();
          this.listadoStatico[index].setValor(this.listadoStatico[num].valor);
        }
      }
      console.log('*****************************************************************');
    }
  }
}
const TIPOS_VARIALE = {
  Double: "Double",
  Boolean: "Boolean",
  String: "String",
  Int: "Int",
  Char: "Char",
};
const TIPOS_OPERACION = {
  POW: "POW",
  POR: "POR",
  DIV: "DIV",
  MOD: "MOD",
  MAS: "MAS",
  MEN: "MEN",
  AND: "AND",
  AD_AND: "AD_AND",
  OR: "OR",
  AD: "AD",
  MAYOR_IGUAL: "MAYOR_IGUAL",
  MENOR_IGUAL: "MENOR_IGUAL",
  IGUAL_IGUAL: "IGUAL_IGUAL",
  AD_IGUAL: "AD_IGUAL",
  MAYOR: "MAYOR",
  MENOR: "MENOR",
  EQUIVALENCIA: "EQUIVALENCIA",
};

function convertidor(tipo_actual, dato) {
  switch (tipo_actual) {
    case TIPOS_VARIALE.Double:
    case TIPOS_VARIALE.Int:
      return Number(dato);
    case TIPOS_VARIALE.Boolean:
      return Boolean(dato);
    case TIPOS_VARIALE.String:
      return String(dato);
    case TIPOS_VARIALE.Char:
      return Char(dato);
    default:
      console.log("ERROR");
      return false;
  }
}
function operador(primer_dato, segundo_dato, tipos_operacion, tipo_actual) {
  switch (tipos_operacion) {
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.POW:
      switch (tipo_actual) {
        /* TIPO INT Y DOUBLE */
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Math.pow(primer_dato, segundo_dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.POR:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return primer_dato * segundo_dato;
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.DIV:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return primer_dato / segundo_dato;
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MOD:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return primer_dato % segundo_dato;
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MAS:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(primer_dato) + Number(segundo_dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MEN:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return primer_dato - segundo_dato;
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.AND:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.AD_AND:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.OR:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.AD:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MAYOR_IGUAL:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MENOR:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.IGUAL_IGUAL:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.AD_IGUAL:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MAYOR:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.MENOR:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    case TIPOS_OPERACION.EQUIVALENCIA:
      switch (tipo_actual) {
        case TIPOS_VARIALE.Double:
        case TIPOS_VARIALE.Int:
          return Number(dato);
        default:
          console.log("ERROR");
          return false;
      }
    /* segun el tipo de operacion realizar la forma */
    default:
      console.log("ERROR");
      return false;
  }
}

let reprotes = new Reporte();
let tabla = new TablaHabito();
let tipos_variable_actual = undefined;
let tipos_metodo_actual = undefined;


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
    :tipos_variables ID variable_metodo	/* aqui creo variables */ 
    {
      tabla.pushListadoStatico((new Variable($2,$3,tipos_variable_actual)));
      ((new Variable($2,$3,tipos_variable_actual))).print();
      console.log('------'+tipos_variable_actual+'------ '+$1 +'------'+$2+'------'+$3);
      tabla.verificacoinListadoEstatico();
    }
    |VOID ID metodos_archivo	//aqui creo metodos
    |reasignacion_varable	/* aqui reutilizo una vriable */
    ;
variable_metodo
    :metodos_archivo /* es un metodo */ {$$=0;}
    |variable_global /* es variable global */{$$=$1;}
    ;
///////////////////////////////////////////////////////////TIPOS DE DATOS
tipos_variables//tipos de variables o metodos menos void 
    :DOUBLE   {tipos_variable_actual=TIPOS_VARIALE.Double;  tipos_metodo_actual=tipos_variable_actual; $$=yytext;}
    |BOOLEAN  {tipos_variable_actual=TIPOS_VARIALE.boolean; tipos_metodo_actual=tipos_variable_actual; $$=yytext;}
    |STRING   {tipos_variable_actual=TIPOS_VARIALE.String;  tipos_metodo_actual=tipos_variable_actual; $$=yytext;}
    |INT      {tipos_variable_actual=TIPOS_VARIALE.Int;     tipos_metodo_actual=tipos_variable_actual; $$=yytext;}
    |CHAR     {tipos_variable_actual=TIPOS_VARIALE.Char;    tipos_metodo_actual=tipos_variable_actual; $$=yytext;}
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
    |/*importante ya que tamien el datos usa esto de usar_variable*/ {/* VARIABLE */}
    ;
usar_varaible_factorizacion_literal
    :P_APERTURA secuencia_datos P_CIERRE /* METODO PARAMETROS */{/* LISTADO */}
    |PUNTO usar_varaible /* SE DEBERIA ID.ID REFERENCIA DE UN OBJETO */
    ;
/******************VARIABLE LOCAL********************/
variable_local
    :tipos_variables ID variable_global// aquie estara la declaracion de las variables
    ;
/******************VARIABLE GLOBAL********************/
secuencia_datos
    :datos secuencia_datos_factorizado
    |{$$=undefined;}
    ;
secuencia_datos_factorizado
    :COMA datos secuencia_datos_factorizado
    |
    ;
variable_global
    :varias_declaraciones asignaciones_variable
    {
    if($1!=undefined){
      tabla.pushListadoStatico(new Variable($1,$2,tipos_variable_actual));
      (new Variable($1,$2,tipos_variable_actual)).print();
      console.log('1----------------'+$1+'----------------'+$2);
      $$=undefined;
    }else{
      console.log('2----------------'+$1+'----------------'+$2);
      $$=$2;
    }
    }
    ;
varias_declaraciones
    :COMA ID varias_declaraciones
    {if($3!=undefined)console.log('------'+$2+'------'+tipos_variable_actual+'------'+$3);$$=$2;}
    |{$$=undefined;}/*termina ahi*/
    ;
reasignacion_varable /* REASIGNACION DE VARIABLE GLOBAL */
    :ID asignaciones_variable 
    {
      let ver = tabla.busquedaListadoStatico(new Variable($1,undefined,undefined));
      if(ver !=undefined){
        ver.setValor($2);
        ver.print();
      }
    }
    ;
asignaciones_variable
    :IGUAL datos {$$=$2;}
    |{$$=undefined;}
    ;
datos
    :STRING {$$=convertidor(tipos_variable_actual,$1);}
    /******************************************************operacion_aritmetica*/
    |datos POW datos  /*POTENCIA*/       {$$=operador($1,$3,TIPOS_OPERACION.POW,tipos_variable_actual);}
    |datos POR datos  /*MULTIPLICACION*/ {$$=operador($1,$3,TIPOS_OPERACION.POR,tipos_variable_actual);}
    |datos DIV datos  /*DIVISION*/       {$$=operador($1,$3,TIPOS_OPERACION.DIV,tipos_variable_actual);}
    |datos MOD datos  /*MODULO*/         {$$=operador($1,$3,TIPOS_OPERACION.MOD,tipos_variable_actual);}
    |datos MAS datos  /*SUMA*/           {$$=operador($1,$3,TIPOS_OPERACION.MAS,tipos_variable_actual);}
    |datos MEN datos  /*RESTA*/          {$$=operador($1,$3,TIPOS_OPERACION.MEN,tipos_variable_actual);}
    /******************************************************operacion_logica*/
    |datos AND datos      /*&&*/ {$$=operador($1,$3,TIPOS_OPERACION.AND,tipos_variable_actual);}
    |datos AD_AND datos   /*!&*/ {$$=operador($1,$3,TIPOS_OPERACION.AD_AND,tipos_variable_actual);}
    |datos OR datos       /*||*/ {$$=operador($1,$3,TIPOS_OPERACION.OR,tipos_variable_actual);}
    |datos AD datos       /*!*/  {$$=operador($1,$3,TIPOS_OPERACION.AD,tipos_variable_actual);}
    /******************************************************operacion_relacionales*/
    |datos MAYOR_IGUAL datos     /*>=*/  {$$=operador($1,$3,TIPOS_OPERACION.MAYOR_IGUAL,tipos_variable_actual);}
    |datos MENOR_IGUAL datos     /*<=*/  {$$=operador($1,$3,TIPOS_OPERACION.MENOR_IGUAL,tipos_variable_actual);}
    |datos IGUAL_IGUAL datos     /*==*/  {$$=operador($1,$3,TIPOS_OPERACION.IGUAL_IGUAL,tipos_variable_actual);}
    |datos AD_IGUAL datos        /*!=*/  {$$=operador($1,$3,TIPOS_OPERACION.AD_IGUAL,tipos_variable_actual);}
    |datos MAYOR datos           /*>*/   {$$=operador($1,$3,TIPOS_OPERACION.MAYOR,tipos_variable_actual);}
    |datos MENOR datos           /*<*/   {$$=operador($1,$3,TIPOS_OPERACION.MENOR,tipos_variable_actual);}
    |datos EQUIVALENCIA datos    /*~*/   {$$=operador($1,$3,TIPOS_OPERACION.EQUIVALENCIA,tipos_variable_actual);}
    |P_APERTURA  datos P_CIERRE {$$=$2;}
    |NUMERO {$$=convertidor(tipos_variable_actual,$1);}
    |boolean {$$=convertidor(tipos_variable_actual,$1);}
    |usar_varaible /* VARAIBLE */{$$=$1;}
    |valores_chart {$$=convertidor(tipos_variable_actual,$1);}
    ;
valores_chart
    :DATO_CHAR{$$=yytext;}
    ;
boolean
    :TRUE{$$=yytext;}
    |FALSE{$$=yytext;}
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