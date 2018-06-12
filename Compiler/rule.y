%{
	#include <stdio.h>
	#include "tablesymboles.h"
	#include "instr.h"
	int yylex(void);
	void yyerror(char*);

#define ADD_TMP() \
	do { \
		char x[128]; \
		sprintf(x, "#TMP%d", get_last_address()); \
		add_symbol(x, "int"); \
	} while (0)
%}

%union{
	int nb;
	char* str;
}

%token tINT
%token tPLUS
%token tMOINS
%token tMULT
%token tDIV
%token tEGAL
%token tEGALEGAL
%token tVIRGULE
%token tPOINTVIRGULE
%token tINTEGER
%token tCONST
%token tID
%token tPRINT
%token tPARENTHESEouv
%token tPARENTHESEferm
%token tACOLADEouv
%token tACOLADEferm
%token tIF
%token tELSE
%token tWHILE
%token tFOR
%token tLESSEGAL
%token tLESS
%token tMOREEGAL
%token tMORE
%token tPLUSPLUS
%token tMOINSMOINS

%left tPLUS tMOINS
%left tMULT tDIV

%type <str> tINT tID tCONST
%type <nb>  tINTEGER tIF tWHILE

%%

Fonctions:
	Fonction Fonctions
	| ;

Fonction: 
	tINT tID tPARENTHESEouv Args tPARENTHESEferm Body;

Args:
	Arg ArgsSuite 
	| ;

ArgsSuite:
	tVIRGULE Arg ArgsSuite 
	| ;

Arg:
	tINT tID;

Body: 
	tACOLADEouv Intrs tACOLADEferm;

Intrs: 
	Intr Intrs 
	| ;

Intr: 
	Decl 
	| Print 
	| Calcul tPOINTVIRGULE
	| If
	| While
	| For;

Decl: 
	tINT tID { add_symbol($2, "int"); } Declp;

Declp: 
	tVIRGULE tID { add_symbol($2, "int");} Declp 
	| tPOINTVIRGULE;

Print: 
	tPRINT tPARENTHESEouv Expression tPARENTHESEferm tPOINTVIRGULE;

Calcul: 
	tID tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			add_instruction("LOAD", 1, b);
			add_instruction("STORE", a, 1);
			delete_symbol(b);}
	| tID tPLUSPLUS {
			int a = find_symbol($1);
			add_instruction("LOAD", 1, a);
			add_instruction("AFC", 2, 1);
			add_instruction("ADD", 1, 2);
			add_instruction("STORE", a, 1);}
	| tID tMOINSMOINS {
			int a = find_symbol($1);
			add_instruction("LOAD", 1, a);
			add_instruction("AFC", 2, 1);
			add_instruction("SUB", 1, 2);
			add_instruction("STORE", a, 1);}
	| tID tPLUS tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			add_instruction("LOAD", 0, a);
			add_instruction("LOAD", 1, b);
			add_instruction("ADD", 0, 1);
			add_instruction("STORE", a, 0);}
	| tID tMOINS tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			add_instruction("LOAD", 0, a);
			add_instruction("LOAD", 1, b);
			add_instruction("SUB", 0, 1);
			add_instruction("STORE", a, 0);}
	| tID tDIV tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			add_instruction("LOAD", 0, a);
			add_instruction("LOAD", 1, b);
			add_instruction("DIV", 0, 1);
			add_instruction("STORE", a, 0);}
	| tID tMULT tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			add_instruction("LOAD", 0, a);
			add_instruction("LOAD", 1, b);
			add_instruction("MUL", 0, 1);
			add_instruction("STORE", a, 0);};

Expression:
	  Expression tPLUS Expression {
				int a = get_last_address();
				int b = a-1;
				add_instruction("LOAD", 1, a);
				add_instruction("LOAD", 2, b);
				add_instruction("ADD", 1, 2);
				add_instruction("STORE", b, 1);
				delete_symbol(a);
				}
	| Expression tMOINS Expression {
				int a = get_last_address();
				int b = a-1;
				add_instruction("LOAD", 1, a);
				add_instruction("LOAD", 2, b);
				add_instruction("SUB", 1, 2);
				add_instruction("STORE", b, 1);
				delete_symbol(a);
				}
	| Expression tDIV Expression {
				int a = get_last_address();
				int b = a-1;
				add_instruction("LOAD", 1, a);
				add_instruction("LOAD", 2, b);
				add_instruction("DIV", 1, 2);
				add_instruction("STORE", b, 1);
				delete_symbol(a);
				}
	| Expression tMULT Expression {
				int a = get_last_address();
				int b = a-1;
				add_instruction("LOAD", 1, a);
				add_instruction("LOAD", 2, b);
				add_instruction("MUL", 1, 2);
				add_instruction("STORE", b, 1);
				delete_symbol(a);
				}
	| tID 		{
				ADD_TMP();
				add_instruction("AFC", 1, get_value($1));
				add_instruction("STORE", get_last_address(), 1);}
	| tINTEGER 	{
				ADD_TMP();
				add_instruction("AFC", 1, $1);
				add_instruction("STORE", get_last_address(), 1);}
	| tPARENTHESEouv Expression tPARENTHESEferm
	;

If:
	tIF tPARENTHESEouv Condition tPARENTHESEferm
	{
		int a = get_last_address();
		add_instruction("LOAD", 1, a);
		add_instruction("JMPC", -1, 1);
		delete_symbol(a);
		dec_last_address();
		$1 = get_last_inst();		
	} Body {
		patcher($1, get_last_inst());
	}
 	Else; 

Else:
	tELSE Body
	| tELSE If
 	| ;

While:
	tWHILE {
		$<nb>$ = get_last_inst();
	}
	tPARENTHESEouv Condition tPARENTHESEferm 
	{
		int a = get_last_address();
		add_instruction("LOAD", 1, a);
		add_instruction("JMPC", -1, 1);
		delete_symbol(a);
		$1 = get_last_inst();		
	}
	 Body {
		patcher($1, get_last_inst());
		add_instruction("JMP", $<nb>2, 0);
	};

For:
	tFOR tPARENTHESEouv Calcul tPOINTVIRGULE Condition tPOINTVIRGULE Calcul tPARENTHESEferm Body {
		printf("Not suported yet.");
	};


Condition:
	Expression tEGALEGAL Expression {
		int a = get_last_address();
		int b = a-1;
		add_instruction("LOAD", 1, a);
		add_instruction("LOAD", 2, b);
		add_instruction("EQU", 1, 2);
		add_instruction("STORE", b, 1);
		delete_symbol(a);
	}
	| Expression tLESS Expression {
		int a = get_last_address();
		int b = a-1;
		add_instruction("LOAD", 1, a);
		add_instruction("LOAD", 2, b);
		add_instruction("INF", 1, 2);
		add_instruction("STORE", b, 1);
		delete_symbol(a);
	}
	| Expression tMORE Expression {
		int a = get_last_address();
		int b = a-1;
		add_instruction("LOAD", 1, a);
		add_instruction("LOAD", 2, b);
		add_instruction("SUP", 1, 2);
		add_instruction("STORE", b, 1);
		delete_symbol(a);
	}
	| Expression tLESSEGAL Expression {
		int a = get_last_address();
		int b = a-1;
		add_instruction("LOAD", 1, a);
		add_instruction("LOAD", 2, b);
		add_instruction("INFE", 1, 2);
		add_instruction("STORE", b, 1);
		delete_symbol(a);
	}
	| Expression tMOREEGAL Expression {
		int a = get_last_address();
		int b = a-1;
		add_instruction("LOAD", 1, a);
		add_instruction("LOAD", 2, b);
		add_instruction("SUPE", 1, 2);
		add_instruction("STORE", b, 1);
		delete_symbol(a);
	};
	

%%
int main(){
	yyparse();
	writeFile();
}
