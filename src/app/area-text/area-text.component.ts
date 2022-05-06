import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-area-text',
  templateUrl: './area-text.component.html',
  styleUrls: ['./area-text.component.css']
})
export class AreaTextComponent implements OnInit {
  @Input()textArea:String = '';
  constructor() { }

  ngOnInit(): void {
  }

}
