%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int tempCount = 1;
char* newTemp(){
    char *t = malloc(5);
    sprintf(t, "t%d", tempCount++);
    return t;
}
void yyerror(const char *s);
int yylex(void);
%}

%union { char* sval; }
%token <sval> ID NUM
%token PLUS MINUS MUL DIV
%left PLUS MINUS
%left MUL DIV
%left '(' ')'
%type <sval> expr

%%
input: /*empty*/ | input line ;
line: expr '\n' { printf("\n--- Intermediate Code ---\n%s\n", $1); tempCount=1; };
expr:
      expr PLUS expr { char*t=newTemp(); printf("%s = %s + %s\n",t,$1,$3); $$=t; }
    | expr MINUS expr { char*t=newTemp(); printf("%s = %s - %s\n",t,$1,$3); $$=t; }
    | expr MUL expr { char*t=newTemp(); printf("%s = %s * %s\n",t,$1,$3); $$=t; }
    | expr DIV expr { char*t=newTemp(); printf("%s = %s / %s\n",t,$1,$3); $$=t; }
    | '(' expr ')' { $$=$2; }
    | ID { $$=strdup($1); }
    | NUM { $$=strdup($1); }
    ;
%%
void yyerror(const char *s){ fprintf(stderr,"Error: %s\n",s); }
int main(){
    printf("Enter arithmetic expression:\n");
    yyparse();
    return 0;
}
