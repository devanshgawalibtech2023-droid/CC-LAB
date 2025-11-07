%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

id  [a-zA-Z]
num [0-9]+

%%
{id}    { yylval.sval = strdup(yytext); return ID; }
{num}   { yylval.sval = strdup(yytext); return NUM; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }
"("     { return '('; }
")"     { return ')'; }
[ \t\n] ;
%%
int yywrap() { return 1; }
