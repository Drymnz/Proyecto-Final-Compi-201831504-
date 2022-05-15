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

