import { Component, Input, OnInit } from '@angular/core';
import { graphviz } from 'd3-graphviz';
declare var Viz: any;
@Component({
  selector: 'app-grafica',
  templateUrl: './grafica.component.html',
  styleUrls: ['./grafica.component.css'],
})
export class GraficaComponent implements OnInit {
  @Input('texto') url!: String;

  ngOnInit() {
    
  }
  print(){
    let texto:string = "digraph g{rankdir=LR;\"webgraphviz\" -> \"@\" -> \"gmail\" -> \".\" -> \"com\"}";
    /* let observar = viz(document.getElementById('graphviz_svg_div'),"digraph g{rankdir=LR;\"webgraphviz\" -> \"@\" -> \"gmail\" -> \".\" -> \"com\"}");  */
    console.log(graphviz);
    console.log(Viz());

  }
 
}

