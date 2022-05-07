var listado = class MiListado {
  private resultados: Array<String>;

  constructor() {
    this.resultados = new Array<String>();
  }
  public agregarValor(valor: String): void {
    this.resultados.push(valor);
  }
  public listado(): Array<String> {
    return this.resultados;
  }
};

let text: String = '';

