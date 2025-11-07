%{
#include <stdio.h>
#include <stdlib.h>
%}

[0-9]+  {
            int n = atoi(yytext);
            printf("Decimal: %d  →  Hexadecimal: %X\n", n, n);
        }

[ \t\n] ;
.       ;
%%

int main() {
    printf("Enter decimal numbers (Ctrl+D to stop):\n");
    yylex();
    return 0;
}
