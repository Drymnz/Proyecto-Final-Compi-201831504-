/* parser generated by jison 0.4.18 */
/*
  Returns a Parser object of the following structure:

  Parser: {
    yy: {}
  }

  Parser.prototype: {
    yy: {},
    trace: function(),
    symbols_: {associative list: name ==> number},
    terminals_: {associative list: number ==> name},
    productions_: [...],
    performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate, $$, _$),
    table: [...],
    defaultActions: {...},
    parseError: function(str, hash),
    parse: function(input),

    lexer: {
        EOF: 1,
        parseError: function(str, hash),
        setInput: function(input),
        input: function(),
        unput: function(str),
        more: function(),
        less: function(n),
        pastInput: function(),
        upcomingInput: function(),
        showPosition: function(),
        test_match: function(regex_match_array, rule_index),
        next: function(),
        lex: function(),
        begin: function(condition),
        popState: function(),
        _currentRules: function(),
        topState: function(),
        pushState: function(condition),

        options: {
            ranges: boolean           (optional: true ==> token location info will include a .range[] member)
            flex: boolean             (optional: true ==> flex-like lexing behaviour where the rules are tested exhaustively to find the longest match)
            backtrack_lexer: boolean  (optional: true ==> lexer regexes are tested in order and for each matching regex the action code is invoked; the lexer terminates the scan when a token is returned by the action code)
        },

        performAction: function(yy, yy_, $avoiding_name_collisions, YY_START),
        rules: [...],
        conditions: {associative list: name ==> set},
    }
  }


  token location info (@$, _$, etc.): {
    first_line: n,
    last_line: n,
    first_column: n,
    last_column: n,
    range: [start_number, end_number]       (where the numbers are indexes into the input string, regular zero-based)
  }


  the parseError function receives a 'hash' object with these members for lexer and parser errors: {
    text:        (matched text)
    token:       (the produced terminal token, if any)
    line:        (yylineno)
  }
  while parser (grammar) errors will also provide these members, i.e. parser errors deliver a superset of attributes: {
    loc:         (yylloc)
    expected:    (string describing the set of expected tokens)
    recoverable: (boolean: TRUE when the parser has a error recovery rule available for this particular error)
  }
*/
var importaciones = (function(){
var o=function(k,v,o,l){for(o=o||{},l=k.length;l--;o[k[l]]=v);return o},$V0=[5,10,27,31,32,33,34,35],$V1=[2,4],$V2=[1,5],$V3=[1,6],$V4=[2,16],$V5=[1,18],$V6=[1,11],$V7=[1,13],$V8=[1,14],$V9=[1,15],$Va=[1,16],$Vb=[1,17],$Vc=[1,24],$Vd=[1,22],$Ve=[1,23],$Vf=[1,29],$Vg=[5,9,10,13,27,31,32,33,34,35],$Vh=[1,31],$Vi=[1,32],$Vj=[1,33],$Vk=[1,34],$Vl=[1,35],$Vm=[1,36],$Vn=[5,9,10,13,15,16,17,18,19,20,22,27,31,32,33,34,35],$Vo=[1,41],$Vp=[1,43],$Vq=[2,57],$Vr=[1,54],$Vs=[1,47],$Vt=[1,48],$Vu=[1,46],$Vv=[1,55],$Vw=[1,52],$Vx=[1,53],$Vy=[5,10,27,31,32,33,34,35,81,85],$Vz=[1,69],$VA=[1,70],$VB=[1,71],$VC=[1,72],$VD=[1,73],$VE=[1,74],$VF=[1,75],$VG=[1,76],$VH=[1,77],$VI=[1,78],$VJ=[1,79],$VK=[1,80],$VL=[1,81],$VM=[1,82],$VN=[1,83],$VO=[1,84],$VP=[1,85],$VQ=[5,10,15,16,17,18,19,20,22,27,31,32,33,34,35,41,60,61,62,63,64,65,66,67,68,69,70,81,85],$VR=[1,90],$VS=[1,89],$VT=[5,10,15,16,17,18,19,20,22,27,31,32,33,34,35,41,81,85],$VU=[2,54],$VV=[1,120],$VW=[2,35],$VX=[1,123],$VY=[10,31,32,33,34,35,47,49,50,76,77,79,80,85],$VZ=[5,10,27,31,32,33,34,35,85];
var parser = {trace: function trace () { },
yy: {},
symbols_: {"error":2,"inicio":3,"documentacion":4,"EOF":5,"import":6,"instrucciones":7,"importar_incerteza":8,"IMPORTAR":9,"ID":10,"PUNTO":11,"CLR":12,"INCERTEZA":13,"operacion_aritmetica":14,"POW":15,"POR":16,"DIV":17,"MOD":18,"MAS":19,"MEN":20,"P_APERTURA":21,"P_CIERRE":22,"NUMERO":23,"variable_global_metodo_reasignacion":24,"tipos_variables":25,"variable_metodo":26,"VOID":27,"metodos_archivo":28,"reasignacion_varable":29,"variable_global":30,"DOUBLE":31,"BOOLEAN":32,"STRING":33,"INT":34,"CHAR":35,"parametros_metodo":36,"DOUBLE_PUNTO":37,"instrucciones_locales":38,"parametros":39,"secuencia_parametros":40,"COMA":41,"tabulaciones":42,"habito_local":43,"variable_local":44,"usar_varaible_local":45,"sentencias_control":46,"RETORNO":47,"datos":48,"BREACK":49,"CONTINUAR":50,"factorizacion_usar_varaible_local":51,"usar_varaible_factorizacion_literal":52,"asignaciones_variable":53,"usar_varaible":54,"usar_varaible_factorizacion":55,"secuencia_datos":56,"secuencia_datos_factorizado":57,"varias_declaraciones":58,"IGUAL":59,"AND":60,"AD_AND":61,"OR":62,"AD":63,"MAYOR_IGUAL":64,"MENOR_IGUAL":65,"IGUAL_IGUAL":66,"AD_IGUAL":67,"MAYOR":68,"MENOR":69,"EQUIVALENCIA":70,"boolean":71,"valores_chart":72,"DATO_CHAR":73,"TRUE":74,"FALSE":75,"SI":76,"PARA":77,"condiciones_for":78,"MIENTRA":79,"SINO":80,"PUNTO_COMA":81,"decremento_incremento":82,"PLUS_PLUS":83,"LESS_LESS":84,"TABULADOR":85,"$accept":0,"$end":1},
terminals_: {2:"error",5:"EOF",9:"IMPORTAR",10:"ID",11:"PUNTO",12:"CLR",13:"INCERTEZA",15:"POW",16:"POR",17:"DIV",18:"MOD",19:"MAS",20:"MEN",21:"P_APERTURA",22:"P_CIERRE",23:"NUMERO",27:"VOID",31:"DOUBLE",32:"BOOLEAN",33:"STRING",34:"INT",35:"CHAR",37:"DOUBLE_PUNTO",41:"COMA",47:"RETORNO",49:"BREACK",50:"CONTINUAR",59:"IGUAL",60:"AND",61:"AD_AND",62:"OR",63:"AD",64:"MAYOR_IGUAL",65:"MENOR_IGUAL",66:"IGUAL_IGUAL",67:"AD_IGUAL",68:"MAYOR",69:"MENOR",70:"EQUIVALENCIA",73:"DATO_CHAR",74:"TRUE",75:"FALSE",76:"SI",77:"PARA",79:"MIENTRA",80:"SINO",81:"PUNTO_COMA",83:"PLUS_PLUS",84:"LESS_LESS",85:"TABULADOR"},
productions_: [0,[3,2],[4,2],[6,2],[6,0],[8,4],[8,2],[14,3],[14,3],[14,3],[14,3],[14,3],[14,3],[14,3],[14,1],[14,1],[7,0],[7,2],[24,3],[24,3],[24,1],[26,1],[26,1],[25,1],[25,1],[25,1],[25,1],[25,1],[28,5],[36,0],[36,1],[39,3],[40,0],[40,2],[38,3],[38,0],[43,1],[43,1],[43,1],[43,2],[43,1],[43,1],[45,2],[51,1],[51,1],[54,2],[55,1],[55,0],[52,3],[52,2],[44,3],[56,2],[56,0],[57,3],[57,0],[30,2],[58,3],[58,0],[29,2],[53,2],[48,1],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,3],[48,1],[48,1],[48,1],[48,1],[72,1],[71,1],[71,1],[46,5],[46,5],[46,5],[46,2],[78,5],[82,1],[82,1],[42,2],[42,1]],
performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate /* action[1] */, $$ /* vstack */, _$ /* lstack */) {
/* this == yyval */

var $0 = $$.length - 1;
switch (yystate) {
case 1:

    this.$ = new Intreprete();
    file.texto_salida = insertesa +'\n'+ file.texto_salida+'\n';
    Object.assign(this.$,file)
    file = new Intreprete();//reiniciar esto
    return this.$;
    
break;
case 5:
file.pushArray_Importaciiones($$[$0-2]);
break;
case 6:
insertesa= 'Incerteza ' + $$[$0];
break;
case 7:
this.$=$$[$0-2]+'^'+$$[$0];
break;
case 8:
this.$=$$[$0-2]+'*'+$$[$0];
break;
case 9:
this.$=$$[$0-2]+'/'+$$[$0];
break;
case 10:
this.$=$$[$0-2]+'%'+$$[$0];
break;
case 11:
this.$=$$[$0-2]+'-'+$$[$0];
break;
case 12:
this.$=$$[$0-2]+'+'+$$[$0];
break;
case 13:
this.$='('+$$[$0-1]+')';
break;
case 14: case 15:
this.$=$$[$0];
break;
}
},
table: [o($V0,$V1,{3:1,4:2,6:3,8:4,9:$V2,13:$V3}),{1:[3]},{5:[1,7]},{5:$V4,7:8,10:$V5,24:9,25:10,27:$V6,29:12,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb},o($V0,$V1,{8:4,6:19,9:$V2,13:$V3}),{10:[1,20]},{10:$Vc,14:21,21:$Vd,23:$Ve},{1:[2,1]},{5:[2,2]},{5:$V4,7:25,10:$V5,24:9,25:10,27:$V6,29:12,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb},{10:[1,26]},{10:[1,27]},o($V0,[2,20]),{10:[2,23]},{10:[2,24]},{10:[2,25]},{10:[2,26]},{10:[2,27]},{53:28,59:$Vf},o($V0,[2,3]),{11:[1,30]},o($Vg,[2,6],{15:$Vh,16:$Vi,17:$Vj,18:$Vk,19:$Vl,20:$Vm}),{10:$Vc,14:37,21:$Vd,23:$Ve},o($Vn,[2,14]),o($Vn,[2,15]),{5:[2,17]},{21:$Vo,26:38,28:39,30:40,41:$Vp,58:42,59:$Vq},{21:$Vo,28:44},o($V0,[2,58]),{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:45,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{12:[1,56]},{10:$Vc,14:57,21:$Vd,23:$Ve},{10:$Vc,14:58,21:$Vd,23:$Ve},{10:$Vc,14:59,21:$Vd,23:$Ve},{10:$Vc,14:60,21:$Vd,23:$Ve},{10:$Vc,14:61,21:$Vd,23:$Ve},{10:$Vc,14:62,21:$Vd,23:$Ve},{15:$Vh,16:$Vi,17:$Vj,18:$Vk,19:$Vl,20:$Vm,22:[1,63]},o($V0,[2,18]),o($V0,[2,21]),o($V0,[2,22]),{22:[2,29],25:66,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb,36:64,39:65},{53:67,59:$Vf},{10:[1,68]},o($V0,[2,19]),o($Vy,[2,59],{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o($VQ,[2,60]),{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:86,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},o($VQ,[2,79]),o($VQ,[2,80]),o($VQ,[2,81]),o($VQ,[2,82]),o($VQ,[2,84]),o($VQ,[2,85]),o($VQ,[2,47],{55:87,52:88,11:$VR,21:$VS}),o($VQ,[2,83]),o($Vg,[2,5]),o($Vn,[2,7]),o([5,9,10,13,16,18,19,20,22,27,31,32,33,34,35],[2,8],{15:$Vh,17:$Vj}),o([5,9,10,13,16,17,18,19,20,22,27,31,32,33,34,35],[2,9],{15:$Vh}),o([5,9,10,13,18,19,20,22,27,31,32,33,34,35],[2,10],{15:$Vh,16:$Vi,17:$Vj}),o([5,9,10,13,19,22,27,31,32,33,34,35],[2,11],{15:$Vh,16:$Vi,17:$Vj,18:$Vk,20:$Vm}),o([5,9,10,13,19,20,22,27,31,32,33,34,35],[2,12],{15:$Vh,16:$Vi,17:$Vj,18:$Vk}),o($Vn,[2,13]),{22:[1,91]},{22:[2,30]},{10:[1,92]},o($Vy,[2,55]),{41:$Vp,58:93,59:$Vq},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:94,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:95,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:96,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:97,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:98,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:99,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:100,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:101,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:102,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:103,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:104,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:105,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:106,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:107,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:108,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:109,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:110,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,22:[1,111],60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP},o($VQ,[2,45]),o($VQ,[2,46]),{10:$Vr,21:$Vs,22:[2,52],23:$Vt,33:$Vu,48:113,54:50,56:112,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{10:$Vr,54:114},{37:[1,115]},{22:[2,32],40:116,41:[1,117]},{59:[2,56]},o($VT,[2,61],{60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,16,18,19,20,22,27,31,32,33,34,35,41,81,85],[2,62],{15:$Vz,17:$VB,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,16,17,18,19,20,22,27,31,32,33,34,35,41,81,85],[2,63],{15:$Vz,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,18,19,20,22,27,31,32,33,34,35,41,81,85],[2,64],{15:$Vz,16:$VA,17:$VB,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,19,22,27,31,32,33,34,35,41,81,85],[2,65],{15:$Vz,16:$VA,17:$VB,18:$VC,20:$VE,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,19,20,22,27,31,32,33,34,35,41,81,85],[2,66],{15:$Vz,16:$VA,17:$VB,18:$VC,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),o([5,10,15,16,17,18,19,20,22,27,31,32,33,34,35,41,60,61,62,64,65,66,67,68,69,70,81,85],[2,67],{63:$VI}),o([5,10,15,16,17,18,19,20,22,27,31,32,33,34,35,41,61,62,64,65,66,67,68,69,70,81,85],[2,68],{60:$VF,63:$VI}),o([5,10,15,16,17,18,19,20,22,27,31,32,33,34,35,41,62,64,65,66,67,68,69,70,81,85],[2,69],{60:$VF,61:$VG,63:$VI}),o($VQ,[2,70]),o($VT,[2,71],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,72],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,73],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,74],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,75],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,76],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VT,[2,77],{60:$VF,61:$VG,62:$VH,63:$VI}),o($VQ,[2,78]),{22:[1,118]},{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,22:$VU,41:$VV,57:119,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP},o($VQ,[2,49]),o($V0,$VW,{38:121,42:122,85:$VX}),{22:[2,31]},{25:66,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb,39:124},o($VQ,[2,48]),{22:[2,51]},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:125,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},o($V0,[2,28]),{10:[1,135],25:134,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb,43:126,44:128,45:129,46:130,47:[1,131],49:[1,132],50:[1,133],76:[1,136],77:[1,137],79:[1,138],80:[1,139],85:[1,127]},o($VY,[2,94]),{22:[2,33]},{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,22:$VU,41:$VV,57:140,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP},o($V0,$VW,{42:122,38:141,85:$VX}),o($VY,[2,93]),o($VZ,[2,36]),o($VZ,[2,37]),o($VZ,[2,38]),{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:142,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},o($VZ,[2,40]),o($VZ,[2,41]),{10:[1,143]},{11:$VR,21:$VS,51:144,52:145,53:146,59:$Vf},{21:[1,147]},{21:[1,148]},{21:[1,149]},{37:[1,150]},{22:[2,53]},o($V0,[2,34]),o($VZ,[2,39],{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP}),{30:151,41:$Vp,58:42,59:$Vq},o($VZ,[2,42]),o($VZ,[2,43]),o($VZ,[2,44]),{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:152,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{25:134,31:$V7,32:$V8,33:$V9,34:$Va,35:$Vb,44:154,78:153},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:155,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},o($VZ,[2,89]),o($Vy,[2,50]),{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,22:[1,156],60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP},{22:[1,157]},{81:[1,158]},{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,22:[1,159],60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP},{37:[1,160]},{37:[1,161]},{10:$Vr,21:$Vs,23:$Vt,33:$Vu,48:162,54:50,71:49,72:51,73:$Vv,74:$Vw,75:$Vx},{37:[1,163]},o($VZ,[2,86]),o($VZ,[2,87]),{15:$Vz,16:$VA,17:$VB,18:$VC,19:$VD,20:$VE,60:$VF,61:$VG,62:$VH,63:$VI,64:$VJ,65:$VK,66:$VL,67:$VM,68:$VN,69:$VO,70:$VP,81:[1,164]},o($VZ,[2,88]),{82:165,83:[1,166],84:[1,167]},{22:[2,90]},{22:[2,91]},{22:[2,92]}],
defaultActions: {7:[2,1],8:[2,2],13:[2,23],14:[2,24],15:[2,25],16:[2,26],17:[2,27],25:[2,17],65:[2,30],93:[2,56],116:[2,31],119:[2,51],124:[2,33],140:[2,53],165:[2,90],166:[2,91],167:[2,92]},
parseError: function parseError (str, hash) {
    if (hash.recoverable) {
        this.trace(str);
    } else {
        var error = new Error(str);
        error.hash = hash;
        throw error;
    }
},
parse: function parse(input) {
    var self = this, stack = [0], tstack = [], vstack = [null], lstack = [], table = this.table, yytext = '', yylineno = 0, yyleng = 0, recovering = 0, TERROR = 2, EOF = 1;
    var args = lstack.slice.call(arguments, 1);
    var lexer = Object.create(this.lexer);
    var sharedState = { yy: {} };
    for (var k in this.yy) {
        if (Object.prototype.hasOwnProperty.call(this.yy, k)) {
            sharedState.yy[k] = this.yy[k];
        }
    }
    lexer.setInput(input, sharedState.yy);
    sharedState.yy.lexer = lexer;
    sharedState.yy.parser = this;
    if (typeof lexer.yylloc == 'undefined') {
        lexer.yylloc = {};
    }
    var yyloc = lexer.yylloc;
    lstack.push(yyloc);
    var ranges = lexer.options && lexer.options.ranges;
    if (typeof sharedState.yy.parseError === 'function') {
        this.parseError = sharedState.yy.parseError;
    } else {
        this.parseError = Object.getPrototypeOf(this).parseError;
    }
    function popStack(n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }
    _token_stack:
        var lex = function () {
            var token;
            token = lexer.lex() || EOF;
            if (typeof token !== 'number') {
                token = self.symbols_[token] || token;
            }
            return token;
        };
    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        state = stack[stack.length - 1];
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol === null || typeof symbol == 'undefined') {
                symbol = lex();
            }
            action = table[state] && table[state][symbol];
        }
                    if (typeof action === 'undefined' || !action.length || !action[0]) {
                var errStr = '';
                expected = [];
                for (p in table[state]) {
                    if (this.terminals_[p] && p > TERROR) {
                        expected.push('\'' + this.terminals_[p] + '\'');
                    }
                }
                if (lexer.showPosition) {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ':\n' + lexer.showPosition() + '\nExpecting ' + expected.join(', ') + ', got \'' + (this.terminals_[symbol] || symbol) + '\'';
                } else {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ': Unexpected ' + (symbol == EOF ? 'end of input' : '\'' + (this.terminals_[symbol] || symbol) + '\'');
                }
                this.parseError(errStr, {
                    text: lexer.match,
                    token: this.terminals_[symbol] || symbol,
                    line: lexer.yylineno,
                    loc: yyloc,
                    expected: expected
                });
            }
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error('Parse Error: multiple actions possible at state: ' + state + ', token: ' + symbol);
        }
        switch (action[0]) {
        case 1:
            stack.push(symbol);
            vstack.push(lexer.yytext);
            lstack.push(lexer.yylloc);
            stack.push(action[1]);
            symbol = null;
            if (!preErrorSymbol) {
                yyleng = lexer.yyleng;
                yytext = lexer.yytext;
                yylineno = lexer.yylineno;
                yyloc = lexer.yylloc;
                if (recovering > 0) {
                    recovering--;
                }
            } else {
                symbol = preErrorSymbol;
                preErrorSymbol = null;
            }
            break;
        case 2:
            len = this.productions_[action[1]][1];
            yyval.$ = vstack[vstack.length - len];
            yyval._$ = {
                first_line: lstack[lstack.length - (len || 1)].first_line,
                last_line: lstack[lstack.length - 1].last_line,
                first_column: lstack[lstack.length - (len || 1)].first_column,
                last_column: lstack[lstack.length - 1].last_column
            };
            if (ranges) {
                yyval._$.range = [
                    lstack[lstack.length - (len || 1)].range[0],
                    lstack[lstack.length - 1].range[1]
                ];
            }
            r = this.performAction.apply(yyval, [
                yytext,
                yyleng,
                yylineno,
                sharedState.yy,
                action[1],
                vstack,
                lstack
            ].concat(args));
            if (typeof r !== 'undefined') {
                return r;
            }
            if (len) {
                stack = stack.slice(0, -1 * len * 2);
                vstack = vstack.slice(0, -1 * len);
                lstack = lstack.slice(0, -1 * len);
            }
            stack.push(this.productions_[action[1]][0]);
            vstack.push(yyval.$);
            lstack.push(yyval._$);
            newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
            stack.push(newState);
            break;
        case 3:
            return true;
        }
    }
    return true;
}};

 class Intreprete {
  constructor() {
    this.texto_salida = "";
    this.texto_errores = "";
    this.array_importaciiones = new Array();
    this.acctivar = false;
  }
  appetTexto_salida(testo) {
    if (this.acctivar) {
      this.texto_salida += testo;
    }
  }
  appetTexto_errores(testo) {
    this.texto_errores += testo;
  }
  pushArray_Importaciiones(text){
    this.array_importaciiones.push(text);
  }
  getText_Salida(){
    return this.texto_salida;
  }
}
let primera = true;
let file = new Intreprete();
let insertesa = '';
let texto_agregar = '';
/* generated by jison-lex 0.3.4 */
var lexer = (function(){
var lexer = ({

EOF:1,

parseError:function parseError(str, hash) {
        if (this.yy.parser) {
            this.yy.parser.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },

// resets the lexer, sets new input
setInput:function (input, yy) {
        this.yy = yy || this.yy || {};
        this._input = input;
        this._more = this._backtrack = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {
            first_line: 1,
            first_column: 0,
            last_line: 1,
            last_column: 0
        };
        if (this.options.ranges) {
            this.yylloc.range = [0,0];
        }
        this.offset = 0;
        return this;
    },

// consumes and returns one char from the input
input:function () {
        var ch = this._input[0];
        this.yytext += ch;
        this.yyleng++;
        this.offset++;
        this.match += ch;
        this.matched += ch;
        var lines = ch.match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno++;
            this.yylloc.last_line++;
        } else {
            this.yylloc.last_column++;
        }
        if (this.options.ranges) {
            this.yylloc.range[1]++;
        }

        this._input = this._input.slice(1);
        return ch;
    },

// unshifts one char (or a string) into the input
unput:function (ch) {
        var len = ch.length;
        var lines = ch.split(/(?:\r\n?|\n)/g);

        this._input = ch + this._input;
        this.yytext = this.yytext.substr(0, this.yytext.length - len);
        //this.yyleng -= len;
        this.offset -= len;
        var oldLines = this.match.split(/(?:\r\n?|\n)/g);
        this.match = this.match.substr(0, this.match.length - 1);
        this.matched = this.matched.substr(0, this.matched.length - 1);

        if (lines.length - 1) {
            this.yylineno -= lines.length - 1;
        }
        var r = this.yylloc.range;

        this.yylloc = {
            first_line: this.yylloc.first_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.first_column,
            last_column: lines ?
                (lines.length === oldLines.length ? this.yylloc.first_column : 0)
                 + oldLines[oldLines.length - lines.length].length - lines[0].length :
              this.yylloc.first_column - len
        };

        if (this.options.ranges) {
            this.yylloc.range = [r[0], r[0] + this.yyleng - len];
        }
        this.yyleng = this.yytext.length;
        return this;
    },

// When called from action, caches matched text and appends it on next action
more:function () {
        this._more = true;
        return this;
    },

// When called from action, signals the lexer that this rule fails to match the input, so the next matching rule (regex) should be tested instead.
reject:function () {
        if (this.options.backtrack_lexer) {
            this._backtrack = true;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. You can only invoke reject() in the lexer when the lexer is of the backtracking persuasion (options.backtrack_lexer = true).\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });

        }
        return this;
    },

// retain first n characters of the match
less:function (n) {
        this.unput(this.match.slice(n));
    },

// displays already matched input, i.e. for error messages
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },

// displays upcoming input, i.e. for error messages
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20) + (next.length > 20 ? '...' : '')).replace(/\n/g, "");
    },

// displays the character position where the lexing error occurred, i.e. for error messages
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c + "^";
    },

// test the lexed token: return FALSE when not a match, otherwise return token
test_match:function(match, indexed_rule) {
        var token,
            lines,
            backup;

        if (this.options.backtrack_lexer) {
            // save context
            backup = {
                yylineno: this.yylineno,
                yylloc: {
                    first_line: this.yylloc.first_line,
                    last_line: this.last_line,
                    first_column: this.yylloc.first_column,
                    last_column: this.yylloc.last_column
                },
                yytext: this.yytext,
                match: this.match,
                matches: this.matches,
                matched: this.matched,
                yyleng: this.yyleng,
                offset: this.offset,
                _more: this._more,
                _input: this._input,
                yy: this.yy,
                conditionStack: this.conditionStack.slice(0),
                done: this.done
            };
            if (this.options.ranges) {
                backup.yylloc.range = this.yylloc.range.slice(0);
            }
        }

        lines = match[0].match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno += lines.length;
        }
        this.yylloc = {
            first_line: this.yylloc.last_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.last_column,
            last_column: lines ?
                         lines[lines.length - 1].length - lines[lines.length - 1].match(/\r?\n?/)[0].length :
                         this.yylloc.last_column + match[0].length
        };
        this.yytext += match[0];
        this.match += match[0];
        this.matches = match;
        this.yyleng = this.yytext.length;
        if (this.options.ranges) {
            this.yylloc.range = [this.offset, this.offset += this.yyleng];
        }
        this._more = false;
        this._backtrack = false;
        this._input = this._input.slice(match[0].length);
        this.matched += match[0];
        token = this.performAction.call(this, this.yy, this, indexed_rule, this.conditionStack[this.conditionStack.length - 1]);
        if (this.done && this._input) {
            this.done = false;
        }
        if (token) {
            return token;
        } else if (this._backtrack) {
            // recover context
            for (var k in backup) {
                this[k] = backup[k];
            }
            return false; // rule action called reject() implying the next rule should be tested instead.
        }
        return false;
    },

// return next match in input
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) {
            this.done = true;
        }

        var token,
            match,
            tempMatch,
            index;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i = 0; i < rules.length; i++) {
            tempMatch = this._input.match(this.rules[rules[i]]);
            if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
                match = tempMatch;
                index = i;
                if (this.options.backtrack_lexer) {
                    token = this.test_match(tempMatch, rules[i]);
                    if (token !== false) {
                        return token;
                    } else if (this._backtrack) {
                        match = false;
                        continue; // rule action called reject() implying a rule MISmatch.
                    } else {
                        // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
                        return false;
                    }
                } else if (!this.options.flex) {
                    break;
                }
            }
        }
        if (match) {
            token = this.test_match(match, rules[index]);
            if (token !== false) {
                return token;
            }
            // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
            return false;
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. Unrecognized text.\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });
        }
    },

// return next match that has a token
lex:function lex () {
        var r = this.next();
        if (r) {
            return r;
        } else {
            return this.lex();
        }
    },

// activates a new lexer condition state (pushes the new lexer condition state onto the condition stack)
begin:function begin (condition) {
        this.conditionStack.push(condition);
    },

// pop the previously active lexer condition state off the condition stack
popState:function popState () {
        var n = this.conditionStack.length - 1;
        if (n > 0) {
            return this.conditionStack.pop();
        } else {
            return this.conditionStack[0];
        }
    },

// produce the lexer rule set which is active for the currently active lexer condition state
_currentRules:function _currentRules () {
        if (this.conditionStack.length && this.conditionStack[this.conditionStack.length - 1]) {
            return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
        } else {
            return this.conditions["INITIAL"].rules;
        }
    },

// return the currently active lexer condition state; when an index argument is provided it produces the N-th previous condition state, if available
topState:function topState (n) {
        n = this.conditionStack.length - 1 - Math.abs(n || 0);
        if (n >= 0) {
            return this.conditionStack[n];
        } else {
            return "INITIAL";
        }
    },

// alias for begin(condition)
pushState:function pushState (condition) {
        this.begin(condition);
    },

// return the number of states currently on the stack
stateStackSize:function stateStackSize() {
        return this.conditionStack.length;
    },
options: {},
performAction: function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {
var YYSTATE=YY_START;
switch($avoiding_name_collisions) {
case 0:/* file.appetTexto_salida(' '); */
break;
case 1:/* console.log(', en la linea: ' + yy_.yylloc.first_line + ', en la columna: ' + yy_.yylloc.first_column); */file.appetTexto_salida('\n');
break;
case 2:/* file.appetTexto_salida(' ') */;
break;
case 3:file.appetTexto_salida('\t');			return 85;
break;
case 4:/* file.appetTexto_salida(' '); */
break;
case 5:file.appetTexto_salida(' ');
break;
case 6:file.appetTexto_salida(yy_.yytext);
break;
case 7:file.appetTexto_salida(yy_.yytext);
break;
case 8:file.appetTexto_salida(yy_.yytext);	return 11;
break;
case 9:file.appetTexto_salida(yy_.yytext);	return 41;
break;
case 10:file.appetTexto_salida(yy_.yytext);	return 37;
break;
case 11:file.appetTexto_salida(yy_.yytext);	return 81;
break;
case 12:file.appetTexto_salida(yy_.yytext);	return 59;
break;
case 13:file.appetTexto_salida(yy_.yytext);	return 64;
break;
case 14:file.appetTexto_salida(yy_.yytext);	return 65;
break;
case 15:file.appetTexto_salida(yy_.yytext);	return 66;
break;
case 16:file.appetTexto_salida(yy_.yytext);	return 67;
break;
case 17:file.appetTexto_salida(yy_.yytext);	return 68;
break;
case 18:file.appetTexto_salida(yy_.yytext);	return 69;
break;
case 19:file.appetTexto_salida(yy_.yytext);    return 70;
break;
case 20:file.appetTexto_salida(yy_.yytext);	return 60;
break;
case 21:file.appetTexto_salida(yy_.yytext);    return 61;
break;
case 22:file.appetTexto_salida(yy_.yytext);    return 62;
break;
case 23:file.appetTexto_salida(yy_.yytext);    return 63;
break;
case 24:file.appetTexto_salida(yy_.yytext);    return 74;
break;
case 25:file.appetTexto_salida(yy_.yytext);    return 75;
break;
case 26:file.appetTexto_salida(yy_.yytext);return 83;
break;
case 27:file.appetTexto_salida(yy_.yytext);return 84;
break;
case 28:file.appetTexto_salida(yy_.yytext);return 20;
break;
case 29:file.appetTexto_salida(yy_.yytext);return 15;
break;
case 30:file.appetTexto_salida(yy_.yytext);return 16;
break;
case 31:file.appetTexto_salida(yy_.yytext);return 17;
break;
case 32:file.appetTexto_salida(yy_.yytext);return 18;
break;
case 33:file.appetTexto_salida(yy_.yytext);return 19;
break;
case 34:file.appetTexto_salida(yy_.yytext);return 21;
break;
case 35:file.appetTexto_salida(yy_.yytext);return 22;
break;
case 36:return 9;
break;
case 37:return 13;
break;
case 38:return 12;
break;
case 39:file.acctivar = true;texto_agregar=''; if(primera){console.log(yy_.yylloc.first_line+''+yy_.yylloc.first_column);let numero = Number(yy_.yylloc.first_line)-1; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yy_.yytext);      return 31;
break;
case 40:file.acctivar = true;texto_agregar=''; if(primera){console.log(yy_.yylloc.first_line+''+yy_.yylloc.first_column);let numero = Number(yy_.yylloc.first_line)-1; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yy_.yytext);      return 32;
break;
case 41:file.acctivar = true;texto_agregar=''; if(primera){console.log(yy_.yylloc.first_line+''+yy_.yylloc.first_column);let numero = Number(yy_.yylloc.first_line)-1; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yy_.yytext);      return 33;
break;
case 42:file.acctivar = true;texto_agregar=''; if(primera){console.log(yy_.yylloc.first_line+''+yy_.yylloc.first_column);let numero = Number(yy_.yylloc.first_line)-1; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yy_.yytext);      return 34;
break;
case 43:file.acctivar = true;texto_agregar=''; if(primera){console.log(yy_.yylloc.first_line+''+yy_.yylloc.first_column);let numero = Number(yy_.yylloc.first_line)-1; for(let i =0; i < numero;i++){texto_agregar+='\n';}primera=false;}  file.appetTexto_salida(texto_agregar+yy_.yytext);      return 35;
break;
case 44:file.acctivar = true;file.appetTexto_salida(yy_.yytext);return 27;
break;
case 45:file.appetTexto_salida(yy_.yytext);    return 76;
break;
case 46:file.appetTexto_salida(yy_.yytext);    return 80;
break;
case 47:file.appetTexto_salida(yy_.yytext);    return 77;
break;
case 48:file.appetTexto_salida(yy_.yytext);    return 79;
break;
case 49:file.appetTexto_salida(yy_.yytext);    return 47;
break;
case 50:file.appetTexto_salida(yy_.yytext);    return 49;
break;
case 51:file.appetTexto_salida(yy_.yytext);    return 50;
break;
case 52:file.appetTexto_salida(yy_.yytext);    return 73;
break;
case 53:file.appetTexto_salida(yy_.yytext);    return 23;
break;
case 54:file.appetTexto_salida(yy_.yytext);    return 10;
break;
case 55: file.appetTexto_salida(yy_.yytext); return 33; 
break;
case 56:file.appetTexto_salida(yy_.yytext);
break;
case 57:return 5;
break;
}
},
rules: [/^(?:\f)/,/^(?:\n)/,/^(?:\r)/,/^(?:\t|[\s][\s][\s][\s])/,/^(?:\v)/,/^(?:\s)/,/^(?:([!])([!]).*)/,/^(?:((')(')('))[^\'\'\']*((')(')(')))/,/^(?:[.])/,/^(?:[,])/,/^(?::)/,/^(?:;)/,/^(?:=)/,/^(?:>=)/,/^(?:<=)/,/^(?:==)/,/^(?:([!])=)/,/^(?:>)/,/^(?:<)/,/^(?:~)/,/^(?:([&])([&]))/,/^(?:([|])([&]))/,/^(?:([|])([|]))/,/^(?:([!]))/,/^(?:true\b)/,/^(?:false\b)/,/^(?:\+\+)/,/^(?:--)/,/^(?:-)/,/^(?:\^)/,/^(?:\*)/,/^(?:\/)/,/^(?:%)/,/^(?:\+)/,/^(?:[(])/,/^(?:\))/,/^(?:Importar\b)/,/^(?:Incerteza\b)/,/^(?:clr\b)/,/^(?:Double\b)/,/^(?:Boolean\b)/,/^(?:String\b)/,/^(?:Int\b)/,/^(?:Char\b)/,/^(?:Void\b)/,/^(?:Si\b)/,/^(?:Sino\b)/,/^(?:Para\b)/,/^(?:Mientras\b)/,/^(?:Retorno\b)/,/^(?:Detener\b)/,/^(?:Continuar\b)/,/^(?:(').('))/,/^(?:[0-9]+(\.[0-9]+)?\b)/,/^(?:[a-zA-Z0-9]([a-zA-Z0-9]+)?)/,/^(?:"[^\"]*")/,/^(?:.)/,/^(?:$)/],
conditions: {"INITIAL":{"rules":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57],"inclusive":true}}
});
return lexer;
})();
parser.lexer = lexer;
function Parser () {
  this.yy = {};
}
Parser.prototype = parser;parser.Parser = Parser;
return new Parser;
})();


if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = importaciones;
exports.Parser = importaciones.Parser;
exports.parse = function () { return importaciones.parse.apply(importaciones, arguments); };
exports.main = function commonjsMain (args) {
    if (!args[1]) {
        console.log('Usage: '+args[0]+' FILE');
        process.exit(1);
    }
    var source = require('fs').readFileSync(require('path').normalize(args[1]), "utf8");
    return exports.parser.parse(source);
};
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(process.argv.slice(1));
}
}