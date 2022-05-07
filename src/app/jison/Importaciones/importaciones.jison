//Definicion de analisis lexico
%lex
%options cas-insentive
%%
%%// token
"!!".*"\n"// comentarios de simple linea
'\'\'\''[^('\'\'\'')]*'\'\'\''  //comentario multi-linea 

//palabras reservadas
//HEAD
"clr"       return'CLR'{text+= yytext.substr(1,yyleng-2);}
"Importar"  return'IMPORTAR'{text+= yytext.substr(1,yyleng-2);}
'.'         return'PUNTO'{text+= yytext.substr(1,yyleng-2);}
//Exprecion regular

([a-zA-Z_])[a-zA-Z0-9_]* { text+= yytext.substr(1,yyleng-2); return 'IDENTIFICADOR'; }
<<EOF>>				       return 'EOF';

.					{text+= yytext.substr(1,yyleng-2);} 
/lex

// el codigo de js
%{
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

};

let text: String = '';

let insertar: boolean = false;

function agregarTextoFinal(valor: String) {
    if (insertar) {
        name
    }
}

    
%}

//GRAMTICA PRODUCCIONES
%start incio

%%

// el inicio (analisar documento) y el final $
incio: importaciones EOF ;

import :  importaciones import
|
;
importaciones :  IMPORTAR IDENTIFICADOR {listado.agregarValor( yytext.substr(1,yyleng-2));} PUNTO CLR  ;

