import { Directive ,ViewContainerRef} from '@angular/core';

@Directive({
  selector: '[appCodeFile]'
})
export class CodeFileDirective {

  constructor(public viewContainerRef: ViewContainerRef) { }

}
