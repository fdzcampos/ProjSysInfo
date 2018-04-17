D	[0-9]
E	[Ee][-+]?{D}+
%%


"ADD" return tADD;
"SUB" return tSUB;
"DIV" return tDIV;
"MUL" return tMUL;

"STORE" return tSTORE;
"LOAD" return tLOAD;
"AFC" return tAFC;

"EQU" return tEQU;
"INF" return tINF;
"INFE" return tINFE;
"SUP" return tSUP;
"SUPE" return tSUPE;

"JMP" return tJMP;
"JMPC" return tJMPC;

{D}+{E}? {
		yylval.nb = atoi(yytext);
		return tINTEGER;
	}
