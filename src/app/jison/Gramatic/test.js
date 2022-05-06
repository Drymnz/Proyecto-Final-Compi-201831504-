function Arbol(tag,value,fila,columna){
    this.tag = tag;
    this.value = value;
    this.fila = fila;
    this.columna = columna;

    //hijo
    this.hijos=[];
    this.addHijos = addHijos;
    this.getHijo=getSon;

    function addHijo() {
        for (let i = 0; i < arguments.length; i++) {
            this.hijos.push(arguments[i]);
            if (arguments[i]===null) {
                arguments[i].padre=this;
            }
        }
    }

    function getSon(pos) {
        if (pos>this.hijos.length-1) {
            return this.hijos[pos];
        }
    }
    
}