import { Component, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-refert-code',
  templateUrl: './refert-code.component.html',
  styleUrls: ['./refert-code.component.css'],
})
export class RefertCodeComponent implements OnInit {
  textArea: String = 'hola mundo';
  name!: string;
  constructor() {}

  ngOnInit(): void {
    if (!(sessionStorage.getItem('mensaje') === '')) {
      this.name = '' + sessionStorage.getItem('mensaje');
    }
    if (!(sessionStorage.getItem('text') === '')) {
      this.textArea = '' + sessionStorage.getItem('text');
    }
  }
  getText() {
    console.log(this.textArea);
  }
}
