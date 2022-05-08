function nodo_arbol(lexema,valor,fila,columna){
   // recolecto datos del arbol
   this.lexema=lexema;
   this.valor=valor;
   this.fila=fila;
   this.columna=columna;
   //Vamos a definir que tenga hijos
   this.childs=[]
   this.addChilds=addChilds;
   this.getSon=getSon;
   function addChilds(){
       for(var i =0; i< arguments.length;i++){
           this.childs.push(arguments[i]);
           if(arguments[i]!==null){
               arguments[i].padre=this;
           }
       }
   }
   function getSon(pos){
       if(pos >this.hijos.length - 1)return null;
       return this.hijos[pos];
   }
}