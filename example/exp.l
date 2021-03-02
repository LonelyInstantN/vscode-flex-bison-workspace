%{
int yywrap(void);
#include "exp_tab.h"
%}
ID      [a-zA-Z]
%%


"+"             return ADD;
"-"             return SUB;
"*"             return MUL;
"/"             return DIV;
"\n"            return CR;
([1-9][0-9]*)|0|([0-9]+\.[0-9]*) {
    double temp;
    sscanf(yytext, "%lf", &temp);
    yylval.double_value = temp;
    return DOUBLE_LITERAL;
}
[ \t] ;
. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}            /*IGNORE*/;


%%
int yywrap(void)
{
    return 1;
}