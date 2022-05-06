import {
  Component,
  OnInit,
  ViewChild,
  ComponentFactoryResolver,
  ElementRef,
} from '@angular/core';
import { RegistroDocumentoes } from '../registro-documentoes';
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
  textArea!: string;

  //constructor
  constructor() {}

  //inicializacion del componete
  ngOnInit(): void {}

  //añadir nuevo componete de archivos
  public addComponet(): void {
    this.addComponetTwo(
      '',
      this.nombre_archivo_defoul + this.contador + '.crl'
    );
    this.contador++;
  }

  //crear componete para ver su texto
  private addComponetTwo(mensaje: string, name: string): void {
    this.aguardarTexto(); //se aguarda
    this.listadoFiles.push({ name: name, texto: mensaje }); //añadir componete en listado
    this.possicion = this.listadoFiles.length - 1;
    this.textArea = mensaje;// se muestra
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
      alert('por favor selecciones un archivo crl');
    }
  }
  //remover archivo
  eliminarArchivo(indixe: number) {
    this.aguardarTexto(); //se aguarda
    console.log(this.listadoFiles);
    let self = this;
    this.listadoFiles = this.listadoFiles.filter(function (item) {
      return item !== self.listadoFiles[indixe];
    });
    this.cargarTexto(this.listadoFiles.length - 1);// se muestra
  }
  //aguardar el texto
  aguardarTexto() {
    for (let i = 0; i < this.listadoFiles.length; i++) {
      if (i === this.possicion) {
        this.listadoFiles[i].texto = this.textArea;
      }
    }
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
}
