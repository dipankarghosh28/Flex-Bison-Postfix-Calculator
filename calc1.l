%{
#include <string.h>
#include<stdlib.h>
#define stack_size 100
static int sp;
static float stack [stack_size];
static void push (float i) {
    if (++sp<stack_size)
        stack[sp]= i;
    else 
        {printf ("error: Stack Overflow\n");
	exit(0) ;}
}
static float pop (void) {
    if (sp>=0)
        return stack[sp--];
    else {
        printf ("error: Stack Underflow\n");
	exit(0) ;}
}
int int_value;

%}

digit [0-9]
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp ({integer}|{real})[eE]{integer}
exp2 ({integer}|{real})[eE][+-]{integer}
exp3 [+-]({integer}|{real})[eE][+-]{integer}
integer {digit}+
integer2 [+-]({integer}|{real})
 
  /* descriptions of       corresponding actions
    expected inputs       (C statements or blocks) */
%%

({integer}|{integer2}|{real}|{exp}|{exp2}|{exp3})       {push (atof(yytext));} 
"+"                      {push (pop() + pop());}
"*"                      {push (pop() * pop());}
"-"                      {float rhs= pop(); push (pop() - rhs);}
"/"                      {float rhs= pop(); push (pop() / rhs);}
"\n"					{float answer = pop();


                        char str1[20];
                        snprintf(str1, 20, "%f", answer);

                        if(strstr(str1,".0000"))
                        {               
                            memset(str1, 0, strlen(str1));
                            int_value = answer;
                            printf("%d \n", int_value);
 
                          }
                         else printf ("%.3f \n", answer); // Else Print the value with 3 decimal places.     
                          }
[ \t\n]                   ;



[^-0-9+*/.;eE \t\n]+     {ECHO; fprintf (stderr,"Invalid Character: ");
printf("\n"); exit(1);} 

%%

int main (void) {sp= -1; yylex(); return 0;}
int yywrap (void) {return 1;}
