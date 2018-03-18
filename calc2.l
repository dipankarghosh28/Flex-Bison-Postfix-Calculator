%{
#define YYSTYPE double
#include "calc2.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

white [ \t]+
digit [0-9]
integer {digit}+
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp ({integer}|{real})[eE]{integer}
exp2 ({integer}|{real})[eE][+-]{integer}
exp3 [+-]({integer}|{real})[eE][+-]{integer}
integer2 [+-]({integer}|{real})

%%

{white} { }
({integer}|{integer2}|{real}|{exp}|{exp2}|{exp3}) { yylval=atof(yytext); 
 return NUMBER;
}

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"(" return LEFT;
")" return RIGHT;
"\n" return END;
[^-0-9+*/.eE \n ] {printf("Invalid character: %c\n",yytext[0]);}
