%{
#include <stdio.h>
#include <string.h>

int comments = 0, keywords = 0, identifiers = 0, words = 0, lines = 0, spaces = 0;
char *kw[] = {"int", "float", "char", "if", "else", "for", "while", "return"};
%}

identifier [a-zA-Z_][a-zA-Z0-9_]*
comment    ("//".*)|("/*"([^*]|\*+[^*/])*\*+/)

%%
{comment}        { comments++; }
{identifier}     {
                    int i, flag=0;
                    for(i=0;i<8;i++)
                        if(strcmp(yytext, kw[i])==0) { keywords++; flag=1; }
                    if(!flag) identifiers++;
                    words++;
                 }
[ \t]            { spaces++; }
\n               { lines++; }
.                { }
%%

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("\nComments: %d\nKeywords: %d\nIdentifiers: %d\nWords: %d\nLines: %d\nSpaces: %d\n",
           comments, keywords, identifiers, words, lines, spaces);
    return 0;
}
