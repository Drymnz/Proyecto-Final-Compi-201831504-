//Definicion de analisis lexico
%lex
%options cas-insentive
%%
%%// token
"!!".*"\n"// comentarios de simple linea
'\'\'\''[^('\'\'\'')]*'\'\'\''  //comentario multi-linea 
//palabras reservadas
//HEAD
"clr"  return'CLR'
"Importar"  return'IMPORTAR'
"Incerteza"  return'INCERTEZA'
//VARIABLE
"Double"  return'DOUBLE'
"Boolean"  return'BOOLEAN'
"String"  return'STRING'
"Int"  return'INT'
"Char"  return'CHAR'
"Void"  return'VOID'
//SENTENCIA
"Si"  return'SI'
"Sino"  return'SINO'
"Para"  return'PARA'
"Mientras"  return'MIENTRA'
"Retorno"  return'RETURN'
"Detener"  return'BREACK'
"Continuar"  return'CONTINUAR'
//Simbolos
";" return 'PUNTO_COMA'
":" return 'DOUBLE_PUNTO'
"." return 'PUNTO'
"~" return 'EQUIVALENCIA'
"," return 'COMA'
"(" return 'P_APERTURA'
")" return 'C_APERTURA'
//para opereacion
// relacionales
"=" return 'IGUAL'
">="    return 'MAYOR_IGUAL'
"<="    return 'MENOR_IGUAL'
"=="    return 'IGUAL_IGUAL'
"!="return 'AD_IGUAL'
">" return 'MAYOR'
"<" return 'MENOR'
"'"."'" return 'CARACTER_CHAR'
//logicos
"&&" return 'AND'
"!&" return 'AD_AND'
"||" return 'OR'
"!" return 'AD'
"true"  return 'TRUE'
"false"  return 'FALSE'
// PARA 
"++" return 'PLUS_PLUS'
"--" return 'LESS_LESS'
//aritmetico
"-" return 'MENO'
"^" return 'POW'
"*" return 'POR'
"/" return 'DIV'
"%" return 'MOD'
"+" return 'MAS'
//Exprecion regular
"\""[^"\""]*"\""  { yytext = yytext.substr(1,yyleng-2); return 'STRING'; }
[0-9]+("."[0-9]+)?\b    return'NUMERO'//(NO HAY DIFERENCIA ENTRE ENTERO Y DECIMAL)

([a-zA-Z_])[a-zA-Z0-9_]* return 'IDENTIFICADOR';

<<EOF>>				return 'EOF';

\s+ // se ignoran los espacios en blanco
.					{ console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column);
                                          L_Error.getInstance().insertar(new N_Error("Lexico","Caracter: \" "+yytext+"\" no es valido" ,yylloc.first_line,yylloc.first_column));
                                          return null; }
/lex


// el codigo de js
%{
     function AST_Node(tag,value,fila,columna){
        this.tag=tag;
        this.value=value;
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
%}

//precedencia
%left 'MAS'
%left 'MENOS'
%left 'MOD'
%left 'POR'
%left 'DIV'
%right 'POW'
//          ==          !=             <     >          <=              >=          ~ 
%nonassoc 'IGUAL_IGUAL' 'AD_IGUAL' 'MENOR' 'MAYOR' 'MENOR_IGUAL' 'MAYOR_IGUAL' 'EQUIVALENCIA'
%left 'OR'
%left 'AD_AND'
%left 'AND'
%left 'AD'
%nonassoc 'P_APERTURA' 'P_CIERRE'

//GRAMTICA PRODUCCIONES
%start incio

%%

// el inicio (analisar documento) y el final $
incio: doc EOF {$$=new AST_Node("RAIZ","RAIZ",this.$first_line,@1.last_column);$$.addChilds($1);return $$} ;

doc : headD ejecucion ;
ejecucion : ejecucion  crearDatos
|crearDatos
;
crearDatos : crearVariable
|asignar
|sentencia
;
//2) EL ENCABEZADO DEL DOCUMENTO
headD: headD encabezado {$1.addChilds($2);$$=$1;}
    | encabezado {$$= new AST_Node("ENCABEZADO","ENCABEZADO",this._$.first_line,@1.last_column);$$.addChilds($1);} ;
    ; 

encabezado : IMPORTAR ID PUNTO CLR
    | INCERTEZA NUMERO
    | {/*NADA*/}
;
//asignacion
crearVariable : crearVariable asignar
|variable
;
asignar : IGUAL DATO 
|ID asignar
;
variable: variable COMA variable
| tipos ID
;
tipos : 
BOOLEAN
|DOUBLE
|STRING
|INT
|CHAR
;
// sentecias de control
sentencias: sentencias sentencia {$1.addChilds($2);$$=$1;}
            | sentencia{$$= new AST_Node("SENTENCIAS","SENTENCIAS",this._$.first_line,@1.last_column);$$.addChilds($1);} 
            ;
//{$$=$1}
sentencia: si
|para
|mientras
;

// SENTENCIA SIU!!!
si : SI P_APERTURA /*TRUE/FALSE*/ P_CIERRE DOUBLE_PUNTO  /*CODIGO \t*/ sino ;

sino : SINO DOUBLE_PUNTO
| {/*nada*/}
;

// SENTENCIA PARA FOR
para : PARA P_APERTURA /*VARIABLE MAS ASIGNACION*/ /*TRUE/FALSE*/ PUNTO_COMA incementoOdecremento P_CIERRE DOUBLE_PUNTO /*CODE \t*/

incementoOdecremento : PLUS_PLUS
| LESS_LESS
;

//MIENTRAS WHILE
mientras : MIENTRA P_APERTURA /*TRUE/FALSE*/ P_CIERRE DOUBLE_PUNTO  /*CODIGO \t*/ salto ;

salto : BREACK
|CONTINUAR
;

//OPERACIONES DE DATO
// OPERACIONES ARITMETICAS
DATO: 
DATO MAS DATO       {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("SUMA",$2,this._$.first_line,@2.last_column),$3);}
|DATO MENO DATO     {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MENOS",$2,this._$.first_line,@2.last_column),$3);}
|DATO POR DATO      {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("POR",$2,this._$.first_line,@2.last_column),$3);}
|DATO POW DATO      {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("POW",$2,this._$.first_line,@2.last_column),$3);}
|DATO DIV DATO      {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("DIV",$2,this._$.first_line,@2.last_column),$3);}
|DATO MOD DATO      {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MOD",$2,this._$.first_line,@2.last_column),$3);}
//RELACIONALES
|DATO IGUAL_IGUAL DATO  {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("IGUAL_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
|DATO MENOR_IGUAL DATO  {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MENOR_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
|DATO MAYOR_IGUAL DATO  {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MAYOR_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
|DATO AD_IGUAL DATO     {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("AD_IGUAL",$2,this._$.first_line,@2.last_column),$3);}
|DATO MENOR DATO        {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MENOR",$2,this._$.first_line,@2.last_column),$3);}
|DATO MAYOR DATO        {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("MAYOR",$2,this._$.first_line,@2.last_column),$3);}
|DATO EQUIVALENCIA DATO {$$= new AST_Node("DATO","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("EQUIVALENCIA",$2,this._$.first_line,@2.last_column),$3);}
// !
|AD DATO                {$$= new AST_Node("AD","DATO",this._$.first_line,@2.last_column);$$.addChilds($1,new AST_Node("AD",$2,this._$.first_line,@2.last_column),$3);}
// ( DATO )
|P_APERTURA DATO P_CIERRE   {$$=$2}
//DATA
|ID     {$$= new AST_Node("EXP","EXP",this._$.first_line,@1.last_column);$$.addChilds(new AST_Node("ID",$1,this._$.first_line,@1.last_column));} 
;