%{
#include <stdio.h>
int count = 0;
%}

^(.*com)$   { printf("Line ends with 'com': %s\n", yytext); count++; }
.|\n        { ; }
%%

int main() {
    printf("Enter lines (Ctrl+D to stop):\n");
    yylex();
    printf("\nTotal lines ending with 'com': %d\n", count);
    return 0;
}
