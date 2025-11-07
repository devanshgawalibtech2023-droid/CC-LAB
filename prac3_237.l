%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*  { count++; }
.|\n           { ; }
%%

int main() {
    printf("Enter text (Ctrl+D to stop):\n");
    yylex();
    printf("Words starting with 'A' or 'a': %d\n", count);
    return 0;
}
