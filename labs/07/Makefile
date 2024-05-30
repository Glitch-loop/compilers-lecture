all:
	lex chatbot.l
	yacc -d chatbot.y
	gcc lex.yy.c y.tab.c -o chatbot -ll

clean:
	rm -rf simplecalc
	rm -rf lex.yy.c
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf y.tab.h.gch
	rm -rf simplecalc.tab.c
	rm -rf simplecalc.tab.h
