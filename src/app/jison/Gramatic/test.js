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
            return Number(dato);
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
