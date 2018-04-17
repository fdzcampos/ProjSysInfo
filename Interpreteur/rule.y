%{
	#include <stdio.h>
	#include "instr.h"
	int yylex(void);
	void yyerror(char*);
%}

%union{
	int nb;
}

%token tADD
%token tSUB
%token tDIV
%token tMUL

%token tSTORE
%token tLOAD
%token tAFC

%token tEQU
%token tINF
%token tINFE
%token tSUP
%token tSUPE

%token tJMP
%token tJMPC

%type <nb>  tINTEGER 

%%

Add:
	tADD


