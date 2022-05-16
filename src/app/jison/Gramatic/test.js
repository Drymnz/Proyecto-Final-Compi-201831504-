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
      if(num>-1){
        if (this.listadoStatico[index].tipos == this.listadoStatico[num].tipos && this.listadoStatico[index].valor==undefined) {
          this.listadoStatico[index].setValor(this.listadoStatico[num].valor);
        }
      }
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
class Nodo{
  constructor(nombre,dato_aguardar){
    this.nombre = nombre;
    this.dato_aguardar = dato_aguardar;
  }
}
let metodo = false;
let reprotes = new Reporte();
let tabla = new TablaHabito();
let tipos_variable_actual = undefined;
let tipos_metodo_actual = undefined;