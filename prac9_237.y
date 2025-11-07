%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token FOR ID NUM

%%
stmt: FOR '(' assign ';' cond ';' inc ')'  { printf("Valid FOR loop syntax.\n"); }
    ;

assign: ID '=' NUM     ;
cond:   ID '<' NUM     ;
inc:    ID '=' ID '+' NUM ;
%%
void yyerror(const char *s){ printf("Invalid FOR syntax!\n"); }
int main(){
    printf("Enter a FOR loop statement:\n");
    yyparse();
    return 0;
}
