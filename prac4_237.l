%{
#include <stdio.h>
%}

%%
[a-z]   { printf("%c", yytext[0]-32); }
[A-Z]   { printf("%c", yytext[0]+32); }
.|\n    { ECHO; }
%%

int main() {
    printf("Enter text:\n");
    yylex();
    return 0;
}
