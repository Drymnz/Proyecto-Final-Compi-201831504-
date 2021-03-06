%lex
//%options cas-insentive
AD  [!] //el simbolo de adminarcion
COMMILA  \'
TRIPLE_COMILLA {COMMILA}{COMMILA}{COMMILA}
AMPERSAND   [&]
NID [|]
TABULACION_REALIZADA \t|[\s][\s][\s][\s]
%%
/*********************token**********************/
\f   					                        {/* console.log('<Form Feed>'+yytext); */}
\n   					                        {/* console.log('<New Line>'+yytext); */}
\r   					                        {/* console.log('<Carriage Return>'+yytext); */}
{TABULACION_REALIZADA}{TABULACION_REALIZADA}    {console.log('<TABULADOR_DOS>'+yytext);			return 'TABULADOR_DOS';}
{TABULACION_REALIZADA}   	                    {console.log('<TABULADOR_UNO>'+yytext);			return 'TABULADOR_UNO';}
\v   					                        {/* console.log('<Vertical Tabulator>'+yytext); */}
\s   					                        {/* console.log('<ESPACIO>'+yytext); */}
//COMENTARIOS
{AD}{AD}.*        		                        {/* console.log('<COMENTARIO>'+yytext); */}//comentario simple
{TRIPLE_COMILLA}[^\'\'\']*{TRIPLE_COMILLA}      {/* console.log('<COMENTARIO_MULTILINEA>'+yytext); */}//comentario simple
//PUNTUACIONES
[.]                       {console.log('PUNTO'+yytext);			    return 'PUNTO';}
[,]  					  {console.log('<COMA>'+yytext);		    return 'COMA';}
":"  					  {console.log('<DOUBLE_PUNTO>'+yytext);    return 'DOUBLE_PUNTO';}
";"  					  {console.log('<PUNTO_COMA>'+yytext);	    return 'PUNTO_COMA';}
//SIMBOLOS
//simbolos de igual 
"="  					{console.log('<"=">'+yytext);		return 'IGUAL';}//asignaciones
// relacionales return false o true
">="    				{console.log('<>=>'+yytext);		return 'MAYOR_IGUAL';/*  */}
"<="    				{console.log('<<=>'+yytext);		return 'MENOR_IGUAL';/*  */}
"=="    				{console.log('<"==">'+yytext);		return 'IGUAL_IGUAL';/*  */}
{AD}"=" 				{console.log('<{AD}"=">'+yytext);	return 'AD_IGUAL';/*  */}
">"     				{console.log('<">">'+yytext);		return 'MAYOR';/*  */}
"<"     				{console.log('<"<">'+yytext);		return 'MENOR';/*  */}
"~"     				{console.log('<"~">'+yytext);		return 'EQUIVALENCIA';}
//logicos	return false o true
{AMPERSAND}{AMPERSAND}  {console.log('<"&&">'+yytext);    return 'AND';/*  */}
{NID}{AMPERSAND}    	{console.log('<"|&">'+yytext);    return 'AD_AND';/*  */}
{NID}{NID}  			{console.log('<[|][|]>'+yytext);  return 'OR';/*  */}
{AD}    				{console.log('<!>'+yytext);       return 'AD';/*  */}
"true"    				{console.log('<true>'+yytext);    return 'TRUE';}
"false"    				{console.log('<false>'+yytext);   return 'FALSE';}
// PARA 
"++"  {console.log('<PLUS_PLUS>'+yytext); return 'PLUS_PLUS';}
"--"  {console.log('<LESS_LESS>'+yytext); return 'LESS_LESS';}
//aritmetico
"-" 					{console.log('<"-">'+yytext);return 'MEN';/*  */}
"^" 					{console.log('<"^">'+yytext);return 'POW';/*  */}
"*" 					{console.log('<"*">'+yytext);return 'POR';/*  */}
"/" 					{console.log('<"/">'+yytext);return 'DIV';/*  */}
"%" 					{console.log('<"%">'+yytext);return 'MOD';/*  */}
"+" 					{console.log('<"+">'+yytext);return 'MAS';/* *** */}
//agrupacion
[(]     				{console.log('<[(]>'+yytext);return 'P_APERTURA';}
")"     				{console.log('<[)]>'+yytext);return 'P_CIERRE';}
//HEAD FROM PROYECT
"Importar"        {console.log('<"importar">'+yytext);    return 'IMPORTAR';}
"Incerteza"       {console.log('<"incerteza">'+yytext);   return 'INCERTEZA';}
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
"Si"          {console.log('<"SI">'+yytext);         return 'SI';}
"Sino"        {console.log('<"SINO">'+yytext);       return 'SINO';}
"Para"        {console.log('<"PARA">'+yytext);       return 'PARA';}
"Mientras"    {console.log('<"MIENTRA">'+yytext);    return 'MIENTRA';}
"Retorno"     {console.log('<"RETURN">'+yytext);     return 'RETORNO';}
"Detener"     {console.log('<"BREACK">'+yytext);     return 'BREACK';}
"Continuar"   {console.log('<"CONTINUAR">'+yytext);  return 'CONTINUAR';}
{COMMILA}.{COMMILA}     {console.log('<"CHAR">'+yytext);       return 'DATO_CHAR';}
//GENERICOS
[0-9]+("."[0-9]+)?\b        {console.log('<NUMERO>'+yytext);  return 'NUMERO';}//YA QUE EL ENUNCIADO PIEDE QUE NO SE DIFERENCIE ENTRE ENTERO Y DECIMAL
[a-zA-Z0-9]([a-zA-Z0-9]+)?  {console.log('<ID>'+yytext);      return 'ID';}
// DE ULTIMO SIEMPRE EL ID
\"[^\"]*\"      { /* yytext = yytext.substr(1,yyleng-2); */console.log('<STRING>'+yytext);    return 'STRING'; }
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
//          ==          !=    <     >          <=    >=          ~ 
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
    this.tabla_habitos = undefined;
  }
  appetTexto_salida(testo) {
    if (this.acctivar) {
      this.texto_salida += testo;
    }
  }
  appetTexto_errores(testo) {
    this.texto_errores += testo;
  }
  setTablaHabitos(tabla) {
    this.tabla_habitos = tabla;
  }
}
/* Classe para los metodos */
class Metodo {
  constructor(tipo, id, parametros, nodo) {
    this.tipo = tipo;
    this.id = id;
    this.parametros = parametros;
    this.nodo = nodo;
  }
}
/* Classe para los las variables */
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
/* Classe para los la tabla de habito */
class TablaHabito {
  constructor() {
    this.incerteza = 0.5;
    this.listadoStatico = new Array();
    this.listadoLocal = new Array();
    this.listadoMetodos = new Array();
    this.IMAGENES = new Array();
  }
  /* 
  @ dato espero un dato objeto tipo nodo
  */
  pushIMAGENES(dato) {
    this.IMAGENES.push(dato);
  }
  /* 
  @ dato espero un dato objeto tipo nodo
  */
  pushListadoMedos(dato) {
    this.listadoMetodos.push(dato);
  }
  /* 
  @ dato espero un dato objeto tipo variable
  */
  pushListadoStatico(dato) {
    if (this.listadoStatico == undefined || this.listadoStatico == []) {
      if (!verificacionIDiguales(dato)) {
        this.listadoStatico.push(dato);
      }
    } else {
      this.listadoStatico.push(dato);
    }
  }
  /* 
  @ dato espero un dato objeto tipo variable
  */
  verificacionIDiguales(dato) {
    let datoreturnar = busquedaListadoStatico(dato) != undefined;
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
  verificacoinListadoEstatico() {
    for (let index = this.listadoStatico.length - 1; index > -1; index--) {
      let num = index - 1;
      if (num > -1) {
        if (
          this.listadoStatico[index].tipos == this.listadoStatico[num].tipos &&
          this.listadoStatico[index].valor == undefined
        ) {
          this.listadoStatico[index].setValor(this.listadoStatico[num].valor);
        }
      }
    }
  }
}
/* el nodo que use */
class ArbolNodo {
  constructor(nombre, value, fila, columna) {
    this.nombre = nombre;
    this.value = value;
    this.fila = fila;
    this.columna = columna;
    this.childs = [];
  }
  agregarHijo() {
    for (var i = 0; i < arguments.length; i++) {
      this.childs.push(arguments[i]);
      if (arguments[i] !== undefined) {
        arguments[i].padre = this;
      }
    }
  }
  agregarHijoPrimero() {
    for (var i = 0; i < arguments.length; i++) {
      this.childs.unshift(arguments[i]);
      if (arguments[i] !== undefined) {
        arguments[i].padre = this;
      }
    }
  }
  obtenerHijo(pos) {
    if (pos > this.hijos.length - 1) return undefined;
    return this.hijos[pos];
  }
}
/* como recorre un nodo */
function imprimir(raiz, name_metodo) {
  var texto = "";
  var contador = 1;
  texto += "digraph {";
  texto +=
    '\nNode0[label="' +
    escapar("Metodo" + " | " + String(name_metodo)) +
    '"];\n';

  recorrido("Node0", raiz);

  texto += "}";
  return texto;

  function recorrido(padre, hijos) {
    if (hijos === undefined || hijos === null) return;
    if (typeof hijos == "string") return;
    hijos.childs.forEach((nodito) => {
      if (typeof nodito.nombre == "undefined") return;
      let nombrehijo = "Node" + contador;
      texto +=
        nombrehijo +
        '[label="' +
        escapar(String(nodito.nombre) + " | " + String(nodito.value)) +
        '"];\n';
      texto += padre + "->" + nombrehijo + ";\n";
      contador++;
      recorrido(nombrehijo, nodito);
    });
  }

  function escapar(cadena) {
    cadena = cadena.replace("{", " ");
    cadena = cadena.replace("}", " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    cadena = cadena.replace('"', " ");
    return cadena;
  }
}
/* las constantes de tipo de variable */
const TIPOS_VARIALE = {
  Double: "Double",
  Boolean: "Boolean",
  String: "String",
  Int: "Int",
  Char: "Char",
};
/* tipos de operaciones a realizar */
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
/* convertir un a un tipo */
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
      reprotes.texto_errores("El castin esta incorecto");
      return false;
  }
}
/* ejeccion de los operador */
function operador(primer_dato, segundo_dato, tipos_operacion, tipo_actual) {
  try {
    switch (tipos_operacion) {
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.POW:
        switch (tipo_actual) {
          /* TIPO INT Y DOUBLE */
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return Math.pow(Number(primer_dato), Number(segundo_dato));
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return Math.pow(Number(primer_dato), Number(segundo_dato));
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.POR:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return primer_dato * segundo_dato;
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return primer_dato * segundo_dato;
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.DIV:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return primer_dato / segundo_dato;
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return primer_dato / segundo_dato;
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MOD:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return primer_dato % segundo_dato;
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return primer_dato % segundo_dato;
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MAS:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return Number(primer_dato) + Number(segundo_dato);
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return Number(primer_dato) + Number(segundo_dato);
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MEN:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return Number(primer_dato) - Number(segundo_dato);
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return Number(primer_dato) - Number(segundo_dato);
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.AND:
        return primer_dato && segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.AD_AND:
        return primer_dato || segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.OR:
        return primer_dato || segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.AD:
        return !segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MAYOR_IGUAL:
        return primer_dato >= segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MENOR_IGUAL:
        return primer_dato <= segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.IGUAL_IGUAL:
        return primer_dato === segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.AD_IGUAL:
        return primer_dato != segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MAYOR:
        return primer_dato > segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.MENOR:
        return primer_dato < segundo_dato;
      /* segun el tipo de operacion realizar la forma */
      case TIPOS_OPERACION.EQUIVALENCIA:
        switch (tipo_actual) {
          case TIPOS_VARIALE.Double:
          case TIPOS_VARIALE.Int:
          case TIPOS_VARIALE.Char:
            return Number(primer_dato) - Number(segundo_dato) < tabla.incerteza;
          case TIPOS_VARIALE.Boolean:
            if (primer_dato === "true") {
              primer_dato = 1;
            } else if (primer_dato === "false") {
              primer_dato = 0;
            }
            if (segundo_dato === "true") {
              segundo_dato = 1;
            } else if (segundo_dato === "false") {
              segundo_dato = 0;
            }
            return Number(primer_dato) - Number(segundo_dato) < tabla.incerteza;
          case TIPOS_VARIALE.String:
            return String(primer_dato)===String(segundo_dato);
          default:
            reprotes.texto_errores("El castin esta incorecto");
            return false;
        }
      /* segun el tipo de operacion realizar la forma */
      default:
        reprotes.texto_errores("El castin esta incorecto");
        return false;
    }
  } catch (error) {
    reprotes.texto_errores("El castin esta incorecto");
    return undefined;
  }
}
function ejecutar(reportes) {
  let listado = reportes.tabla_habitos.listadoMetodos;
  console.log(listado);
  reportes.texto_salida = "todo bien";
  let metodo_principal = realizar(reportes.tabla_habitos.listadoMetodos);
  if (metodo_principal != undefined) {
    console.log(metodo_principal.nodo);
    reportes.texto_salida += recurimiento_nodo_ejecucion(metodo_principal.nodo);
  }
  function realizar(array) {
    let retunar_dato = undefined;
    array.forEach((element) => {
      if (
        element.tipo === "Void" &&
        element.id === "Principal" &&
        element.parametros === undefined
      ) {
        console.log("si existe el metodo");
        retunar_dato = element;
      }
    });
    return retunar_dato;
  }

  function recurimiento_nodo_ejecucion(hijos) {
    if (hijos === undefined || hijos === null) return;
    if (typeof hijos == "string") return;
    hijos.childs.forEach((nodito) => {
      switch (typeof nodito) {
        case "undefined":
          return "";
        case "ArbolNodo":
          switch (nodito.nombre) {
            case "Cuerpo":
              return recurimiento_nodo_ejecucion(nodito);
            case "Usar":
              nodo_usar(nodito);
              return recurimiento_nodo_ejecucion(nodito);
            default:
              return recurimiento_nodo_ejecucion(nodito);
          }
        default:
          return "";
      }
    });
  }
  function nodo_usar(nodito) {
    console.log(nodito.childs[0]);
    console.log(nodito.childs[0].childs[0]);
  }
}
/* 
    this.texto_salida = "";
    this.texto_errores = "";
    this.tabla_habitos =undefined;

    this.incerteza = 0.5;
    this.listadoStatico = new Array();
    this.listadoLocal = new Array();
    this.listadoMetodos = new Array();
    this.IMAGENES = new Array(); 
*/

let metodo = false;
let reprotes = new Reporte();
let tabla = new TablaHabito();
let tipos_variable_actual = undefined;

%}
%%
/******************inicio de la sintactico********************/
inicio
    : documentacion EOF  {
    let usar_tabla = new TablaHabito();
    $$ = new Reporte();
    Object.assign($$,reprotes);
    Object.assign(usar_tabla,tabla);
    $$.setTablaHabitos(usar_tabla);
    /* reiniciar esto */
    reprotes = new Reporte();
    tabla = new TablaHabito();
    boolean_variable = false;
    boolean_metodo = false;
    tipo_actual = undefined;
    usar_tabla= undefined;
    ejecutar($$);
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
    :variable_global_metodo_reasignacion /* variable_global_metodo global */;
variable_global_metodo_reasignacion
    :tipos_variables ID variable_metodo	/* aqui creo variables */ 
    {
      if(metodo){
        let usar_metodo =new Metodo($1,$2,$3.parametros_insertar,$3.nodos_para_metodo);
        tabla.pushListadoMedos(usar_metodo);
        metodo=false;
        }else{
        tabla.pushListadoStatico((new Variable($2,$3,tipos_variable_actual)));
        tabla.verificacoinListadoEstatico();
        }
    }
    |VOID ID P_APERTURA parametros_metodo P_CIERRE DOUBLE_PUNTO instrucciones_locales_nodo	
    /* aqui creo metodos */
    {
        tabla.pushIMAGENES(imprimir($7,$2)); 
    let usar_metodo_incrustar = new Metodo($1,$2,$4,$7);
    tabla.pushListadoMedos(usar_metodo_incrustar);
    }
    |reasignacion_varable	
    /* aqui reutilizo una vriable */{/* ya esta el codigo realizado para la reasignacion */}
    ;
variable_metodo
    :P_APERTURA parametros_metodo P_CIERRE DOUBLE_PUNTO instrucciones_locales_nodo 
    /* es un metodo */ 
    {metodo=true;$$={parametros_insertar : $2,nodos_para_metodo : $5}}
    |variable_global /* es variable global */{$$=$1;}
    ;
///////////////////////////////////////////////////////////TIPOS DE DATOS
tipos_variables//tipos de variables o metodos menos void 
    :DOUBLE   {tipos_variable_actual=TIPOS_VARIALE.Double;   $$=yytext;}
    |BOOLEAN  {tipos_variable_actual=TIPOS_VARIALE.boolean;  $$=yytext;}
    |STRING   {tipos_variable_actual=TIPOS_VARIALE.String;   $$=yytext;}
    |INT      {tipos_variable_actual=TIPOS_VARIALE.Int;      $$=yytext;}
    |CHAR     {tipos_variable_actual=TIPOS_VARIALE.Char;     $$=yytext;}
    ;
/****************************************METODOS********************/
parametros_metodo	// si posee parametros de entra el metodo
    :{$$=undefined;}
    |parametros{$$=$1;}
    ;
parametros
    :tipos_variables ID secuencia_parametros
    {
      if($3===undefined){
        $$=new Array();
        $$.push((new Variable($2,undefined,$1)));
      }else{
        $3.push((new Variable($2,undefined,$1)));
        $$= $3;
      }
    }
    ;
secuencia_parametros
    :{$$=new Array();}
    |COMA parametros{$$=$2;}
    ;
/******************************************************usar variable o metodo*/
usar_varaible_local
    :ID factorizacion_usar_varaible_local
    ;
factorizacion_usar_varaible_local
    :usar_varaible_factorizacion_literal
    |asignaciones_variable
    ;
usar_varaible_factorizacion_literal
    :P_APERTURA secuencia_datos P_CIERRE /* METODO PARAMETROS */{/* LISTADO */}
    |PUNTO usar_varaible /* SE DEBERIA ID.ID REFERENCIA DE UN OBJETO */;
usar_varaible
    :ID usar_varaible_factorizacion 
    {
        let dato_analisar = tabla.busquedaListadoStatico(new Variable($1,undefined,undefined));if(dato_analisar!=undefined){$$=dato_analisar.valor;}else{$$=undefined;}
    }
    ;
usar_varaible_factorizacion
    :usar_varaible_factorizacion_literal
    |/*importante ya que tamien el datos usa esto de usar_variable*/ {/* VARIABLE */}
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
    if(
    $1!=undefined){tabla.pushListadoStatico(new Variable($1,$2,tipos_variable_actual));(new Variable($1,$2,tipos_variable_actual)).print();
    $$=undefined;
    }else{
        $$=$2;
    }
    }
    ;
varias_declaraciones
    :COMA ID varias_declaraciones
    {if($3!=undefined)$$=$2;}
    |{$$=undefined;}/*termina ahi*/
    ;
reasignacion_varable /* REASIGNACION DE VARIABLE GLOBAL */:ID asignaciones_variable 
    {let ver = tabla.busquedaListadoStatico(new Variable($1,undefined,undefined));if(ver !=undefined){  ver.setValor($2);  ver.print();}
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
    |datos MAS datos  /*SUMA*/  {$$=operador($1,$3,TIPOS_OPERACION.MAS,tipos_variable_actual);}
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
    |datos MAYOR datos  /*>*/   {$$=operador($1,$3,TIPOS_OPERACION.MAYOR,tipos_variable_actual);}
    |datos MENOR datos  /*<*/   {$$=operador($1,$3,TIPOS_OPERACION.MENOR,tipos_variable_actual);}
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
/******************************************************* LO INTERNO DE UN LOCAL PARA ARBOL ********************************************************/
/***************************************************************tabulaciones*/
tabulaciones_nodo
    :secuencia_tabulaciones
    |
    ;
secuencia_tabulaciones
  :secuencia_tabulaciones tipos_tabulacion {$$= Number($1)+1;}
  |tipos_tabulacion {$$=1;}
  ;
tipos_tabulacion
  :TABULADOR_UNO
  |TABULADOR_DOS
  ;
/************instrucciones locales NOTA:SOLO UNA TABULACION ya que es un metodo */
instrucciones_locales_nodo
    :TABULADOR_UNO habito_local_nodo instrucciones_locales_nodo
    {
      if($3==undefined){
        $$= new ArbolNodo("Cuerpo","Cuerpo",this._$.first_line,@1.last_column);$$.agregarHijoPrimero($2);
      }else{
        $3.agregarHijoPrimero($2);
        $$= $3;
      }
    }
    |{$$=undefined;}
    ;
/************************************************************REALIZACION DE HABITOS LOCALES DE UN METODO*******************************/   
habito_local_nodo
    :variable_local_nodo/* declaracion de una variable local */
    {$$= new ArbolNodo("Declaracion","Declaracion",this._$.first_line,@1.last_column);$$.agregarHijo($1);}
    |usar_varaible_local_nodo/* uso de variables o metodos */
    {$$= new ArbolNodo("Usar","ID",this._$.first_line,@1.last_column);$$.agregarHijo($1);}
    |sentencias_control/* sentencias de control */
    {$$=$1;}
    |RETORNO datos_nodo/* si el metodo require returnar algo */{$$= new ArbolNodo("Returnar","Returnar",this._$.first_line,@1.last_column);$$.agregarHijo($2);}
    |BREACK   /* DETENER */ {$$= new ArbolNodo("Detener","Detener",this._$.first_line,@1.last_column);}
    |CONTINUAR          /* CONTINUAR */{$$= new ArbolNodo("Continuar","Continuar",this._$.first_line,@1.last_column);}
    ;
/******************SENTENCIAS DE CONTROL********************/
sentencias_control
    :SI P_APERTURA datos_nodo P_CIERRE DOUBLE_PUNTO  habito_sentencia
    {$$= new ArbolNodo("SI","SI",this._$.first_line,@1.last_column);$$.agregarHijo($3);$$.agregarHijo($6);}
    |PARA P_APERTURA condiciones_for P_CIERRE DOUBLE_PUNTO habito_sentencia
    {$$= new ArbolNodo("PARA","PARA",this._$.first_line,@1.last_column);$$.agregarHijo($3);$$.agregarHijo($6);}
    |MIENTRA P_APERTURA datos_nodo P_CIERRE DOUBLE_PUNTO habito_sentencia
    {$$= new ArbolNodo("MIENTRA","MIENTRA",this._$.first_line,@1.last_column);$$.agregarHijo($3);$$.agregarHijo($6);}
    |SINO DOUBLE_PUNTO habito_sentencia
    {$$= new ArbolNodo("SINO","SINO",this._$.first_line,@1.last_column);$$.agregarHijo($3);}
    ;
habito_sentencia
  :TABULADOR_DOS tabulaciones_nodo habito_sentencia_cuerpo
  {
      if($3!=undefined){
$$= new ArbolNodo("Cuerpo","Cuerpo",this._$.first_line,@1.last_column);
    $$.agregarHijo($3);
      }{
          $$=$3;
      }
  }
  |{$$=undefined;}
  ;
habito_sentencia_cuerpo
  :BREACK   habito_sentencia          
  {
       if($2==undefined){
      $$= new ArbolNodo("Detener","Detener",this._$.first_line,@1.last_column);
      $$.agregarHijo($1);
    }else{
       $2.agregarHijo(new ArbolNodo("Detener","Detener",this._$.first_line,@1.last_column));
       $$=$2;
    }
  }
  |CONTINUAR habito_sentencia
  {
      if($2==undefined){
      $$= new ArbolNodo("Continuar","Continuar",this._$.first_line,@1.last_column);
      $$.agregarHijo($1);
    }else{
       $2.agregarHijo(new ArbolNodo("Continuar","Continuar",this._$.first_line,@1.last_column));
       $$=$2;
    }
  }         
  |RETORNO datos_nodo habito_sentencia
  {
      if($3==undefined){
      $$= new ArbolNodo("RETORNO","RETORNO",this._$.first_line,@1.last_column);
      $$.agregarHijo($2);
    }else{
        let agreagar = new ArbolNodo("RETORNO","RETORNO",this._$.first_line,@1.last_column);
      agreagar.agregarHijo($2);
       $3.agregarHijo(agreagar);
       $$=$3;
    }
  }
  |usar_varaible_local_nodo habito_sentencia
  {
    if($2==undefined){
      $$= new ArbolNodo("Usar","ID",this._$.first_line,@1.last_column);
      $$.agregarHijo($1);
    }else{
       $2.agregarHijo($1);
       $$=$2;
    }
  }
  |sentencias_control
  {
  $$= $1;
  }
  ;
/****************************************sentencia para*/
condiciones_for
    :variable_local_nodo PUNTO_COMA  datos_nodo PUNTO_COMA decremento_incremento
    {$$= new ArbolNodo("datos_nodoresion",$1,this._$.first_line,@1.last_column);$$.agregarHijo($1);$$.agregarHijo($3);$$.agregarHijo($3);}
    ;
decremento_incremento
    :PLUS_PLUS{$$= new ArbolNodo("Inclrementeo",$1,this._$.first_line,@1.last_column);}
    |LESS_LESS{$$= new ArbolNodo("Decremento",$1,this._$.first_line,@1.last_column);}
    ;
/******************VARIABLE LOCAL********************/
usar_varaible_local_nodo
    :ID factorizacion_usar_varaible_local_nodo
    {$$= new ArbolNodo("Usar",$1,this._$.first_line,@1.last_column);$$.agregarHijo($2);}
    ;
factorizacion_usar_varaible_local_nodo
    :usar_varaible_factorizacion_literal_nodo{$$= $1;}
    |asignaciones_variable_nodo{$$= $1;}
    ;
variable_local_nodo
    :tipos_variables_nodo ID variable_global_nodo 
    /*** aquie estara la declaracion de las variables */
    {$$= new ArbolNodo($1,$2,this._$.first_line,@1.last_column);$$.agregarHijo($3);}
    ;
tipos_variables_nodo//tipos de variables o metodos menos void 
    :DOUBLE  {$$=yytext;} 
    |BOOLEAN  {$$=yytext;}
    |STRING   {$$=yytext;}
    |INT      {$$=yytext;}
    |CHAR     {$$=yytext;}
    ;
variable_global_nodo/* * */
  :varias_declaraciones_nodo asignaciones_variable_nodo
  {
    if($1!=undefined && $2!=undefined)$$= new ArbolNodo("Declarar","Declarar",this._$.first_line,@1.last_column);
    if($1!=undefined)$$=$1;
    if($2!=undefined)$$=$2;
  }
  ;
varias_declaraciones_nodo
    :COMA ID varias_declaraciones_nodo
    {$$= new ArbolNodo("Declarar","Declarar",this._$.first_line,@1.last_column);$$.agregarHijo($2);
    }
    |{$$=undefined;}/*termina ahi*/
    ;
asignaciones_variable_nodo
    :IGUAL datos_nodo 
    {
        $$= new ArbolNodo("Asignar","Asignar",this._$.first_line,@1.last_column);
        $$.agregarHijo($2);
    }
    |{$$=undefined;}
    ;
/* OPEREACIONES NODOS */
datos_nodo
    :STRING                                         {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@1.last_column);$$.agregarHijo(new ArbolNodo("String",$1,this._$.first_line,@1.last_column));}
    /******************************************************operacion_aritmetica*/
    |datos_nodo POW datos_nodo  /*POTENCIA*/        {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}       
    |datos_nodo POR datos_nodo  /*MULTIPLICACION*/  {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}   
    |datos_nodo DIV datos_nodo  /*DIVISION*/        {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}         
    |datos_nodo MOD datos_nodo  /*MODULO*/          {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo MAS datos_nodo  /*SUMA*/            {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo MEN datos_nodo  /*RESTA*/           {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Aritm",$2,this._$.first_line,@2.last_column),$3);}  
    /******************************************************operacion_logica*/
    |datos_nodo AND datos_nodo      /*&&*/          {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Logica",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo AD_AND datos_nodo   /*!&*/          {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Logica",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo OR datos_nodo       /*||*/          {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Logica",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo AD datos_nodo       /*!*/           {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Logica",$2,this._$.first_line,@2.last_column),$3);}  
    /******************************************************operacion_relacionales*/
    |datos_nodo MAYOR_IGUAL datos_nodo     /*>=*/   {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo MENOR_IGUAL datos_nodo     /*<=*/   {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo IGUAL_IGUAL datos_nodo     /*==*/   {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo AD_IGUAL datos_nodo        /*!=*/   {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo MAYOR datos_nodo  /*>*/             {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo MENOR datos_nodo  /*<*/             {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |datos_nodo EQUIVALENCIA datos_nodo    /*~*/    {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@2.last_column);$$.agregarHijo($1,new ArbolNodo("Relacional",$2,this._$.first_line,@2.last_column),$3);}  
    |P_APERTURA  datos_nodo P_CIERRE                {$$=$2;}
    |NUMERO                                         {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@1.last_column);$$.agregarHijo(new ArbolNodo("Number",$1,this._$.first_line,@1.last_column));}
    |boolean_nodo                                   {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@1.last_column);$$.agregarHijo(new ArbolNodo("Boolean",$1,this._$.first_line,@1.last_column));}
    |usar_varaible_nodo /* VARAIBLE */              {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@1.last_column);$$.agregarHijo($1);}
    |valores_chart_nodo                             {$$= new ArbolNodo("Expresion","Expresion",this._$.first_line,@1.last_column);$$.agregarHijo(new ArbolNodo("Char",$1,this._$.first_line,@1.last_column));}
    ;
valores_chart_nodo
    :DATO_CHAR {$$=yytext;}
    ;
boolean_nodo
    :TRUE{$$=yytext;}
    |FALSE{$$=yytext;}
    ;
usar_varaible_nodo
    :ID usar_varaible_factorizacion_nodo 
    {   if($2!=undefined){  
        $$= new ArbolNodo("Metodo",$1,this._$.first_line,@1.last_column);  
        $$.agregarHijo($2);
        }else{
        $$=new ArbolNodo("Variable",$1,this._$.first_line,@1.last_column);
        }
    }
    ;
usar_varaible_factorizacion_nodo
    :usar_varaible_factorizacion_literal_nodo{$$=$1;}
    |/*importante ya que tamien el datos usa esto de usar_variable*/ {$$=undefined;}
    ;
usar_varaible_factorizacion_literal_nodo
    :P_APERTURA secuencia_datos_nodo P_CIERRE /* METODO PARAMETROS */
    {
        $$=new ArbolNodo("Ingresar","Ingresar",this._$.first_line,@1.last_column);
        if($2!=undefined){
        $$.agregarHijo($2);
        }
    }
    /* |PUNTO usar_varaible_nodo /* SE DEBERIA ID.ID REFERENCIA DE UN OBJETO */ */
    ;
secuencia_datos_nodo
    :datos_nodo secuencia_datos_factorizado_nodo
    {
        if($2===undefined){
            $$= new ArbolNodo("Parametro","Parametro",this._$.first_line,@1.last_column);
            $$.agregarHijo($1);
        }else{
            $2.agregarHijo($1);
            $$=$2;
        }
    }
    |{$$=undefined;}
    ;
secuencia_datos_factorizado_nodo
    :COMA datos_nodo secuencia_datos_factorizado_nodo
    {
        if($3===undefined){
            $$= new ArbolNodo("Secuencia",$2,this._$.first_line,@1.last_column);
            $$.agregarHijo($2);
        }else{
            $3.agregarHijo($2);
            $$=$3;
        }
    }
    |{$$=undefined;}
    ;