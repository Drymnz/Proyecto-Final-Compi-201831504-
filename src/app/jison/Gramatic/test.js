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
class Metodo {
  constructor(tipo, id, parametros, nodo) {
    this.tipo = tipo;
    this.id = id;
    this.parametros = parametros;
    this.nodo = nodo;
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
let metodo = false;
let reprotes = new Reporte();
let tabla = new TablaHabito();
let tipos_variable_actual = undefined;
let tipos_metodo_actual = undefined;
function imprimir(raiz, name_metodo) {
  var texto = "";
  var contador = 1;
  texto += "digraph {";
  texto += '\nNode0[label="' + escapar("Metodo" + " | " + String(name_metodo)) + '"];\n';

  recorrido("Node0", raiz);

  texto += "}";
  return texto;

  function recorrido(padre,hijos){
    if(hijos === undefined || hijos === null) return;
    if(typeof hijos=="string")return;
    hijos.childs.forEach(nodito=> {
      if(typeof nodito.nombre=="undefined")return;
      let nombrehijo="Node"+contador;
      texto+=nombrehijo+"[label=\"" + escapar(String(nodito.nombre) +" | "+String(nodito.value)) + "\"];\n";
      texto+=padre+"->"+nombrehijo+";\n";
      contador++;
      recorrido(nombrehijo,nodito);
    })
  }

  function escapar(cadena) {
    cadena = cadena.replace("{", " ");
    cadena = cadena.replace('}', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    cadena = cadena.replace('\"', ' ');
    return cadena;
  }
}