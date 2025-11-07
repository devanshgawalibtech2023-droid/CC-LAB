%{
#include "y.tab.h"
%}

digit   [0-9]+

%%
{digit}     { yylval = atoi(yytext); return NUMBER; }
[ \t\n]     ;
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }
.           ;
%%

int yywrap() { return 1; }
