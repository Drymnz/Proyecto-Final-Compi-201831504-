%lex
%option yylineno
%locations

Entero [0-9]+
Decimal [0-9]+('.'[0-9]+)

MAS "+"
MENOS "-"
POR "*"
DIV "/"
P_APERTURA "("
P_CIERRE ")"

%%INITIAL
%%
<INITIAL>{Entero} %{return 'Entero';%}
<INITIAL>{Decimal} %{return 'Decimal';%}


<INITIAL>{MAS} %{return 'MAS';%}
<INITIAL>{MENOS} %{return 'MENOS';%}
<INITIAL>{POR} %{return 'POR';%}
<INITIAL>{DIV} %{return 'DIV';%}

<INITIAL>{P_APERTURA} %{return 'P_APERTURA';%}
<INITIAL>{P_CIERRE} %{return 'P_CIERRE';%}

<<EOF>> return 'EOF'
.   return 'ERROR'

/lex

%left MAS MENOS
%left POR DIV

%start expresion

%%

expresion : exp EOF {return $1;};

exp : exp MAS exp {$$}