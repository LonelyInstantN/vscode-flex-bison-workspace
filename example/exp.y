%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
void yyerror(const char *s);
%}
%union {
    int          int_value;
    double       double_value;
}
%token      DOUBLE_LITERAL
%token ADD SUB MUL DIV CR
%type <double_value> expression term primary_expression DOUBLE_LITERAL
%%

line_list
    : line
    | line_list line
    ;
line
    : expression CR
    {
        printf("= %.4lf\n", $1);
    }
expression
    : term
    | expression ADD term
    {
        $$ = $1 + $3;
        printf("<ADD>");
    }
    | expression SUB term
    {
        $$ = $1 - $3;
        printf("<SUB>");
    }
    ;
term
    : primary_expression{$$=$1;}
    | term MUL primary_expression 
    {
        $$ = $1 * $3;
        printf("<MUL>");
    }
    | term DIV primary_expression
    {
        $$ = $1 / $3;
        printf("<DIV>");
    }
    ;
primary_expression
    : DOUBLE_LITERAL
    {
        printf("<NUM,%.4lf>",$1);
    }
    ;
         
%%
yyerror(char const *str)
{
    extern char *yytext;
    fprintf(stderr, "parser error near %s\n", yytext);
    return 0;
}

int main(void)
{
    extern int yyparse(void);
    extern FILE *yyin;

    yyin = stdin;
    if (yyparse()) {
        fprintf(stderr, "Error ! Error ! Error !\n");
        exit(1);
    }

    
}
