%{
#include "y.tab.h"
%}

%%
"for"       { return FOR; }
"("         { return '('; }
")"         { return ')'; }
";"         { return ';'; }
"="         { return '='; }
[a-zA-Z]    { yylval = yytext[0]; return ID; }
[0-9]+      { return NUM; }
.|\n        ;
%%

int yywrap(){ return 1; }
