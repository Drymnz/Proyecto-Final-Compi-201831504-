class Intreprete {
  constructor() {
    this.texto_salida = "159";
    this.texto_errores = "159";
  }
  setText_Salida(testo) {
    this.texto_salida = testo;
  }
  appetText_salida(testo) {
    this.texto_salida += testo;
  }
}
const file = new Intreprete();
file.appetText_salida("hola mundo");
