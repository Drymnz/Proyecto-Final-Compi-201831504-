import { Component, OnInit, ViewChild, ComponentFactoryResolver } from '@angular/core';
import {CodeFileDirective} from './../code-file.directive';
import {RefertCodeComponent} from './../refert-code/refert-code.component'
@Component({
  selector: 'app-archivos',
  templateUrl: './archivos.component.html',
  styleUrls: ['./archivos.component.css']
})
export class ArchivosComponent implements OnInit {
@ViewChild(CodeFileDirective)public addCode!:CodeFileDirective;
  constructor(
    private componetFR : ComponentFactoryResolver
  ) { }

  ngOnInit(): void {
  }
  public addComponet():void{
    let twu = this.componetFR.resolveComponentFactory(RefertCodeComponent);
    this.addCode.viewContainerRef.createComponent(twu);
  }
}
