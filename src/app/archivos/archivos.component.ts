import { Component, OnInit } from '@angular/core';
import { RegistroDocumentoes } from '../registro-documentoes';
declare var importaciones: any;

@Component({
  selector: 'app-archivos',
  templateUrl: './archivos.component.html',
  styleUrls: ['./archivos.component.css'],
})
export class ArchivosComponent implements OnInit {
  //variables

  listadoFiles: Array<RegistroDocumentoes> = [];
  private contador: number = 1;
  private possicion: number = 0;
  private nombre_archivo_defoul: string = 'file';
  private extencion: string = '.crl';
  textArea!: any;

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
  //compilar
  compilar() {
    var datos = importaciones.parse(String(this.textArea));
    //console.log(importaciones)
  }
}
