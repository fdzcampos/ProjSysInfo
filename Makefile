lex.yy.c: regles.l
	./flex regles.l
regles: lex.yy.c
	gcc -o regles lex.yy.c libfl.a
