all: compiler
lex.yy.c: compiler.l
	./flex compiler.l
rule.tab.c: rule.y
	~/bison/bin/bison -d -v rule.y

%.o: %.c %.h
	gcc -c $<

compiler: lex.yy.c rule.tab.c tablesymboles.o instr.o
	gcc -o compiler lex.yy.c rule.tab.c tablesymboles.o instr.o libfl.a ~/bison/lib/liby.a

clean:
	rm -rf compiler lex.yy.c rule.tab.c
test: compiler
	./compiler<test.c
