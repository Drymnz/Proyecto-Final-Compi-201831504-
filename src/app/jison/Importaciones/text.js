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
let file = new Intreprete();


