calc1:
	flex calc1.l
	gcc -o calc1 lex.yy.c -lfl -lm

calc2:
	bison -d calc2.y
	flex calc2.l
	gcc calc2.tab.c lex.yy.c -lfl -o calc2

clean2: 
	rm calc2.tab.c
	rm calc2.tab.h
	rm lex.yy.c
	rm calc2

clean: 
	rm calc1
	rm lex.yy.c
