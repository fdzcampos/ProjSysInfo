%{
	#include "rule.tab.h"
%}
D	[0-9]
E	[Ee][-+]?{D}+
ID	[a-zA-Z][_a-zA-Z0-9]*

%%

"++" return tPLUSPLUS;
"+" return tPLUS;
"--" return tMOINSMOINS;
"-" return tMOINS;
"*" return tMULT;
"/" return tDIV;
"=" return tEGAL;
"," return tVIRGULE;
[\n\t ]	{}
";" return tPOINTVIRGULE;
{D}+{E}? {
		yylval.nb = atoi(yytext);
		return tINTEGER;
	}
const {
		yylval.str = strdup(yytext);
		return tCONST;
	}
int	{
		yylval.str = strdup(yytext);
		return tINT;
	}
"if" return tIF;
"else"	return tELSE;
"while" return tWHILE;
"for" return tFOR;
"printf" return tPRINT;
{ID} {
		yylval.str = strdup(yytext);
		return tID;
	}
"(" return tPARENTHESEouv;
")" return tPARENTHESEferm;
"{" return tACOLADEouv;
"}" return tACOLADEferm;
"<" return tLESS;
">"	return tMORE;
