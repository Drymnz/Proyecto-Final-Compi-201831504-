import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { RegistroDocumentoes } from '../registro-documentoes';
declare var importaciones: any;
declare var crl: any;

@Component({
  selector: 'app-archivos',
  templateUrl: './archivos.component.html',
  styleUrls: ['./archivos.component.css'],
})
export class ArchivosComponent implements OnInit {
  //variables
  private TEXTO_ERROR_IMPORTACION: string = 'Verifique que exista este archivo -->> ';
  textConador: string = '1';
  listadoFiles: Array<RegistroDocumentoes> = [];
  private contador: number = 1;
  private possicion: number = 0;
  private nombre_archivo_defoul: string = 'file';
  private extencion: string = '.crl';
  textArea!: any;
  textoConsola!: any;
  private textoFinalUsar: String = '';

  //constructor
  constructor() {}

  //inicializacion del componete
  ngOnInit(): void {}

  //añadir nuevo componete de archivos
  public addComponet(): void {
    this.addComponetTwo(
      '',
      this.nombre_archivo_defoul + this.contador + this.extencion
    );
    this.contador++;
  }

  //crear componete para ver su texto
  private addComponetTwo(mensaje: string, name: string): void {
    this.listadoFiles.push({ name: name, texto: mensaje }); //añadir componete en listado
    this.possicion = this.listadoFiles.length - 1;
    this.textArea = mensaje; // se muestra
    this.contadorLineas();
  }
  //ingresa nuevo archivo
  onChange($event: any): void {
    const [file] = $event.target.files; //retorna el ulimo file
    if (file.type === 'application/pkix-crl') {
      //pide que solo lee archivos .crl
      let fileReader: FileReader = new FileReader(); //el lector de archivos
      let self = this; //para poder utilizar variables de este ts
      fileReader.onloadend = function () {
        let text: string = fileReader.result + '';
        self.addComponetTwo(text, file.name); //añade en este ts el archivo
      };
      fileReader.readAsText(file);
    } else {
      alert('por favor selecciones un archivo ' + this.extencion);
    }
  }
  //remover archivo
  eliminarArchivo(indixe: number) {
    let self = this;
    this.listadoFiles = this.listadoFiles.filter(function (item) {
      return item !== self.listadoFiles[indixe];
    });
    this.cargarTexto(this.listadoFiles.length - 1); // se muestra
  }

  //seleccionar el archio y colocarlo en el text area
  cargarTexto(index: number) {
    for (let i = 0; i < this.listadoFiles.length; i++) {
      if (i === index) {
        this.possicion = i;
        this.textArea = this.listadoFiles[i].texto;
      }
    }
    this.contadorLineas();
  }
  //exporta el archivo que esta en vista
  exportarArchivo(): void {
    if (this.listadoFiles.length === 0 && this.textArea === '') {
      alert('no de puede descargar nada');
    } else {
      if (this.listadoFiles.length === 0) {
        let nameFileDescargar = this.nombre_archivo_defoul + this.extencion;
        this.descargar(nameFileDescargar);
      } else {
        for (let i = 0; i < this.listadoFiles.length; i++) {
          if (i === this.possicion) {
            this.descargar(this.listadoFiles[i].name);
          }
        }
      }
    }
  }
  // construe el archivo para ser descargado
  descargar(nombre: string): void {
    let textPra = document.getElementById('text-area-code');
    let blo = window.URL.createObjectURL(
      new Blob([this.textArea], { type: 'octet/steam' })
    );
    const descarga = document.createElement('a');
    descarga.href = blo;
    descarga.download = nombre;

    document.body.appendChild(descarga);
    descarga.click();
    document.body.removeChild(descarga);
  }
  //actualiza el texto cuando termna de ser enfocado
  actualizar(elementoHTML: any) {
    for (let i = 0; i < this.listadoFiles.length; i++) {
      if (i === this.possicion) {
        this.listadoFiles[i].texto = elementoHTML.value;
      }
    }
    this.textArea = elementoHTML.value;
  }
  contadorLineas() {
    this.textConador = '';
    if (this.textArea) {
      let myArray = this.textArea.split('\n');
      for (let index = 0; index < myArray.length; index++) {
        this.textConador += '' + (index + 1) + '\n';
      }
    }
  }
  /*SINCRONIZAR SCROLL*/
  title = 'withivy';

  currentElement!: string;

  @ViewChild('scrollOne') scrollOne!: ElementRef;
  @ViewChild('scrollTwo') scrollTwo!: ElementRef;

  updateVerticalScroll(event: any): void {
    if (this.currentElement === 'scrollTwo') {
      this.scrollOne.nativeElement.scrollTop = event.target.scrollTop;
    } else if (this.currentElement === 'scrollOne') {
      this.scrollTwo.nativeElement.scrollTop = event.target.scrollTop;
    }
  }

  updateCurrentElement(element: 'scrollOne' | 'scrollTwo') {
    this.currentElement = element;
  }
  /*SINCRONIZAR SCROLL*/
  //compilar
  compilar() {
    if (this.textArea) {
      let datos: any = importaciones.parse(String(this.textArea)); //analisara la parte de importaciones
      if (datos) {
        /* console.log(datos.array_importaciiones); */
        if (this.importaciones(datos.array_importaciiones)) {
          // verifica que existe el archivo a importar
          this.textoFinalUsar += datos.texto_salida;
          console.log(this.textoFinalUsar);
          let final: any = crl.parse(String(this.textoFinalUsar)); //analisara la parte de importaciones
          if (final.texto_errores != undefined) {
            this.textoConsola = 'Resultado' + datos.texto_salida;
          } else {
            this.textoConsola = 'Errores' + String(datos.texto_errores);
          }
        }
        //console.log(this.textoFinalUsar)
      }
    }
  }
  /* 
  @array pide un array
  @return un verdadero si existe el archivo en listado de archivos
  */
  importaciones(listado: any): boolean {
    /* console.log(listado) */
    if (listado != undefined) {
      for (let index = 0; index < listado.length; index++) {
        let elemeto = listado[index];
        let encontrado: boolean = false;
        elemeto += this.extencion;
        this.listadoFiles.forEach((element) => {
          if (element.name === elemeto) {
            let datos: any = importaciones.parse(String(element.texto)); //analisara la parte de importaciones
            if (this.importaciones(datos.array_importaciiones)) {
              this.textoFinalUsar += datos.texto_salida;
              encontrado = true;
            }
          }
        });
        if (!encontrado) {
          this.textoConsola =
            this.TEXTO_ERROR_IMPORTACION +
            elemeto;
          return false;
        }
      }
      return true;
    }
    return true;
  }
}
