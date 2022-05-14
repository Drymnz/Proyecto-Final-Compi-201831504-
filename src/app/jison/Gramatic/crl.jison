%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
COMMILA  \'
TRIPLE_COMILLA {COMMILA}{COMMILA}{COMMILA}
AMPERSAND   [&]
NID [|]
%%
/*********************token**********************/
\f   					{/* console.log('<Form Feed>'); */}
\n   					{/* console.log('<New Line>'); */}
\r   					{/* console.log('<Carriage Return>'); */}
\t|[\s][\s][\s][\s]   	{console.log('<Horizontal Tabulator>');			return 'TABULADOR';}
\v   					{/* console.log('<Vertical Tabulator>'); */}
\s   					{console.log('<ESPACIO>');}
//COMENTARIOS
{AD}{AD}.*        		                            {/* console.log('<COMENTARIO>'); */}//comentario simple
{TRIPLE_COMILLA}[^\'\'\']*{TRIPLE_COMILLA}          {/* console.log('<COMENTARIO_MULTILINEA>'); */}//comentario simple
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
{COMMILA}.{COMMILA}      {console.log('<"CHAR">');       return 'DATO_CHAR';}
//GENERICOS
[0-9]+("."[0-9]+)?\b    {console.log('<NUMERO>');return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9]([a-zA-Z0-9]+)? {console.log('<ID>');return 'ID';}
// DE ULTIMO SIEMPRE EL ID
\"[^\"]*\"      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<STRING>'); return 'STRING'; }
//INORAR
. {console.log('<"ERROR">');}
<<EOF>>	return 'EOF';
/lex
%{
    /*
    @datos etiqueta, el valor, fila posicioon , columna posision
    @es el arbol sintactico
    */
    function TREE(etiqueta,valor,fila,columna){
        this.etiqueta=etiqueta;
        this.valor=valor;
        this.fila=fila;
        this.columna=columna;
        this.hijos=[]
        this.agregarHijo=agregarHijo;
        this.obtenerHijo=obtenerHijo;
        function agregarHijo(){
            for(var i =0; i< arguments.length;i++){
                this.hijos.push(arguments[i]);
                if(arguments[i]!==null){
                    arguments[i].padre=this;
                }
            }
        }
        function obtenerHijo(pos){
            if(pos >this.hijos.length - 1)return null;
            return this.hijos[pos];
        }
    }
%}
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
    : documentacion EOF  {$$=new TREE("RAIZ","RAIZ",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    ;
documentacion 
    :import instrucciones  {$$=new TREE("ENCABEZADO","ENCABEZADO",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    ;
/******************Encabezado , importacines********************/
import  
    :importar_incerteza import {$$=new TREE("ENCABEZADO","ENCABEZADO",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$} 
    |
    ;
importar_incerteza 
    :IMPORTAR ID PUNTO CLR  {$$=new TREE("IMPORTACIONES","IMPORTACIONES",this.$first_line,@1.last_column);$$.agregarHijo($2);return $$} 
    |INCERTEZA operacion_aritmetica    {$$=new TREE("INCERTEZA","INCERTEZA",this.$first_line,@1.last_column);$$.agregarHijo($2);return $$}  
    ;
/******************************************************operacion_aritmetica*/
operacion_aritmetica
    :operacion_aritmetica POW operacion_aritmetica  /*POTENCIA*/        {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("POTENCIA",$2,this._$.first_line,@2.last_column),$3);}
    |operacion_aritmetica POR operacion_aritmetica  /*MULTIPLICACION*/  {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MULTIPLICACION",$2,this._$.first_line,@2.last_column),$3);}
    |operacion_aritmetica DIV operacion_aritmetica  /*DIVISION*/        {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("DIVISION",$2,this._$.first_line,@2.last_column),$3);}
    |operacion_aritmetica MOD operacion_aritmetica  /*MODULO*/          {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MODULO",$2,this._$.first_line,@2.last_column),$3);}
    |operacion_aritmetica MAS operacion_aritmetica  /*SUMA*/            {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("SUMA",$2,this._$.first_line,@2.last_column),$3);}
    |operacion_aritmetica MEN operacion_aritmetica  /*RESTA*/           {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("RESTA",$2,this._$.first_line,@2.last_column),$3);}
    |P_APERTURA operacion_aritmetica P_CIERRE {$$=$2}
    |NUMERO     {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("NUMERO",$1,this._$.first_line,@1.last_column));}
    |ID         {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("ID",$1,this._$.first_line,@1.last_column));}
    ;
/****************************INICIO DE VARIABLES GLOBALES O METODO**************************************************INSTRUCCIONES********************/
instrucciones
    :/*NADA*/
    |variable_global_metodo_reasignacion instrucciones/**variable_global_metodo global */{$$= new AST_Node("variable_global_metodo_reasignacion","variable_global_metodo_reasignacion",this._$.first_line,@1.last_column);$$.addChilds($1);}
    ;
variable_global_metodo_reasignacion
    :tipos_variables ID variable_metodo	/* aqui creo variables */ {$$= new AST_Node("variable_global_metodo_reasignacion","tipos_variables",this._$.first_line,@1.last_column);$$.addChilds($2);}
    |VOID ID metodos_archivo	/* aqui creo metodos */ {$$= new AST_Node("metodos_archivo","tipos_variables",this._$.first_line,@1.last_column);$$.addChilds($2);}
    |reasignacion_varable	/* aqui reutilizo una vriable */ {$$= new AST_Node("metodos_archivo","tipos_variables",this._$.first_line,@1.last_column);$$.addChilds($2);}
    ;
variable_metodo
    :metodos_archivo /*  es un metodo */ {$$=$1}
    |variable_global /* es variable global */ {$$=$1}
    ;
///////////////////////////////////////////////////////////TIPOS DE DATOS
tipos_variables/* tipos de variables o metodos menos void */ 
    :DOUBLE {$$=$1}
    |BOOLEAN {$$=$1}
    |STRING {$$=$1}
    |INT {$$=$1}
    |CHAR {$$=$1}
    ;
/****************************************METODOS********************/
metodos_archivo
    :P_APERTURA parametros_metodo P_CIERRE DOUBLE_PUNTO instrucciones_locales {$$=new TREE("METODO","METODO",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    ;
parametros_metodo	/*  si posee parametros de entra el metodo */
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
    :tabulaciones habito_local instrucciones_locales /************tabulaciones*/{$$=new TREE("METODO","INSTRUCCIONES",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    |
    ;
/************************************************************REALIZACION DE HABITOS LOCALES DE UN METODO*******************************/   
habito_local
    :variable_local		/* declaracion de una variable local */{$$=$1}
    |usar_varaible_local  		/* uso de variables o metodos */{$$=$1}
    |sentencias_control 	/* sentencias de control */{$$=$1}
    |RETORNO datos		/* si el metodo require returnar algo */{$$=$1}
    |BREACK             /* DETENER */ {$$=$1}
    |CONTINUAR          /* CONTINUAR */{$$=$1}
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
    :tipos_variables ID variable_global/*  aquie estara la declaracion de las variables */
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
    :STRING {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("STRING",$1,this._$.first_line,@1.last_column));}
    /******************************************************operacion_aritmetica*/
    |datos POW datos  /*POTENCIA*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("POW",$2,this._$.first_line,@2.last_column),$3);}
    |datos POR datos  /*MULTIPLICACION*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("POR",$2,this._$.first_line,@2.last_column),$3);}
    |datos DIV datos  /*DIVISION*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("POR",$2,this._$.first_line,@2.last_column),$3);}
    |datos MOD datos  /*MODULO*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MOD",$2,this._$.first_line,@2.last_column),$3);}
    |datos MAS datos  /*SUMA*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MAS",$2,this._$.first_line,@2.last_column),$3);}
    |datos MEN datos  /*RESTA*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MEN",$2,this._$.first_line,@2.last_column),$3);}
    /******************************************************operacion_logica*/
    |datos AND datos      /*&&*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("AND",$2,this._$.first_line,@2.last_column),$3);}
    |datos AD_AND datos   /*!&*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("AD_AND",$2,this._$.first_line,@2.last_column),$3);}
    |datos OR datos       /*||*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("OR",$2,this._$.first_line,@2.last_column),$3);}
    |datos AD datos       /*!*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("AD",$2,this._$.first_line,@2.last_column),$3);}
    /******************************************************operacion_relacionales*/
    |datos MAYOR_IGUAL datos     /*>=*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MAYOR_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
    |datos MENOR_IGUAL datos     /*<=*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MENOR_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
    |datos IGUAL_IGUAL datos     /*==*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("IGUAL_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
    |datos AD_IGUAL datos        /*!=*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("AD_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
    |datos MAYOR datos           /*>*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MAYOR",$2,this._$.first_line,@2.last_column),$3);}
    |datos MENOR datos           /*<*/{$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("MENOR",$2,this._$.first_line,@2.last_column),$3);}
    |datos EQUIVALENCIA datos    /*~*/ {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@2.last_column);$$.addChilds($1,new TREE("EQUIVALENCIA",$2,this._$.first_line,@2.last_column),$3);}
    |P_APERTURA  datos P_CIERRE {$$=$2}
    |NUMERO  {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("NUMERO",$1,this._$.first_line,@1.last_column));}
    |boolean     {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("boolean",$1,this._$.first_line,@1.last_column));}
    |usar_varaible /* VARAIBLE */ {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("usar_varaible",$1,this._$.first_line,@1.last_column));}
    |valores_chart {$$= new TREE("operacion_aritmetica","operacion_aritmetica",this._$.first_line,@1.last_column);$$.addChilds(new TREE("valores_chart",$1,this._$.first_line,@1.last_column));}
    ;
valores_chart
    :DATO_CHAR{$$=$1}
    ;
boolean
    :TRUE{$$=$1}
    |FALSE{$$=$1}
    ;
/******************SENTENCIAS DE CONTROL********************/
sentencias_control
    :SI P_APERTURA datos P_CIERRE DOUBLE_PUNTO  {$$=new TREE("SI","SI",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    |PARA P_APERTURA condiciones_for P_CIERRE DOUBLE_PUNTO {$$=new TREE("PARA","PARA",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    |MIENTRA P_APERTURA datos P_CIERRE DOUBLE_PUNTO {$$=new TREE("MIENTRAS","MIENTRAS",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
    |SINO DOUBLE_PUNTO  {$$=new TREE("SINO","SINO",this.$first_line,@1.last_column);$$.agregarHijo($1);return $$}
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
