%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER PLUS MINUS MUL DIV

%%
input:
      /* empty */
    | input expr '\n' { printf("Result = %d\n", $2); }
    ;

expr:
      expr expr PLUS   { $$ = $1 + $2; }
    | expr expr MINUS  { $$ = $1 - $2; }
    | expr expr MUL    { $$ = $1 * $2; }
    | expr expr DIV    { $$ = $1 / $2; }
    | NUMBER           { $$ = $1; }
    ;
%%

void yyerror(const char *s) { printf("Error: %s\n", s); }
int main() {
    printf("Enter postfix expression:\n");
    yyparse();
    return 0;
}
