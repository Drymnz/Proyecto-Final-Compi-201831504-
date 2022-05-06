import {
  Component,
  OnInit,
  ViewChild,
  ComponentFactoryResolver,
  ElementRef,
} from '@angular/core';
import { FormGroup } from '@angular/forms';
import { RegistroDocumentoes } from '../registro-documentoes';
import { CodeFileDirective } from './../code-file.directive';
import { RefertCodeComponent } from './../refert-code/refert-code.component';
@Component({
  selector: 'app-archivos',
  templateUrl: './archivos.component.html',
  styleUrls: ['./archivos.component.css'],
})
export class ArchivosComponent implements OnInit {

  @ViewChild(CodeFileDirective) public addCode!: CodeFileDirective;
  @ViewChild('contenido') contenido!: ElementRef;
  listadoFiles:Array<RegistroDocumentoes>=[];
  listFiles: any = [];
  private contador: number = 1;
  private nombre_archivo_defoul: string = 'file';
  textArea!: string;
  constructor(private componetFR: ComponentFactoryResolver) {}

  ngOnInit(): void {
  }
  public addComponet(): void {
    this.addComponetTwo(
      '',
      this.nombre_archivo_defoul + this.contador + '.crl'
    );
    this.contador++;
  }
  //crear componete para ver su texto
  private addComponetTwo(mensaje: string, name: string): void {
    this.listadoFiles.push({name:name,text:mensaje});
    sessionStorage.setItem('mensaje', name);
    sessionStorage.setItem('text', mensaje);
    let twu = this.componetFR.resolveComponentFactory(RefertCodeComponent); // crea una referencia
    this.listFiles.push(twu);
    console.log(twu);
    this.addCode.viewContainerRef.createComponent(twu); // inserta la refencia en aqui
    this.textArea = mensaje;
  }
  onChange($event: any): void {
    const [file] = $event.target.files; //retorna el ulimo file
    if (file.type === 'application/pkix-crl') {
      //pide que solo lee archivos .crl
      let fileReader: FileReader = new FileReader(); //el lector de archivos
      let self = this; //para poder utilizar variables de este ts
      fileReader.onloadend = function () {
        self.textArea = fileReader.result + '';
        self.addComponetTwo(self.textArea, file.name);
      };
      fileReader.readAsText(file);
    } else {
      alert('por favor selecciones un archivo crl');
    }
  }
  buscarElemento($event: any): void {
    console.log(event);
  }
}
