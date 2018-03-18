%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE double
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE
%token LEFT RIGHT
%token END

%left PLUS MINUS
%left TIMES DIVIDE


%start Input
%%

Input:
    
     | Input Line
;

Line:
     END
     | Expression END { float answer = $1; int ans= answer; if((float) ans == answer){printf("%d\n",ans);} 
			else {printf("%f\n",answer);}
	 }
;

Expression:
NUMBER { $$=$1; }
| Expression Expression PLUS { $$=$1+$2; }
| Expression Expression MINUS { $$=$1-$2; }
| Expression Expression TIMES { $$=$1*$2; }
| Expression Expression DIVIDE { $$=$1/$2; }
| LEFT Expression RIGHT { $$=$2; }
;
%%
extern char* yytext;

int yyerror(char *s){
}
int main() {
  yyparse();
}

