%{
	#include <stdio.h>
	#include "tablesymboles.h"
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
%token tLESS
%token tMORE
%token tPLUSPLUS
%token tMOINSMOINS

%left tPLUS tMOINS
%left tMULT tDIV

%type <str> tINT tID tCONST
%type <nb>  tINTEGER

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
			printf("LOAD r1, %d\n", b);
			printf("STORE %d,r1\n", a);
			delete_symbol(b);}
	| tID tPLUSPLUS {
			int a = find_symbol($1);
			printf("LOAD r1, %d\n", a);
			printf("AFC r2, 1\n");
			printf("ADD r1,r2\n");
			printf("STORE %d,r1\n", a);}
	| tID tMOINSMOINS {
			int a = find_symbol($1);
			printf("LOAD r1, %d\n", a);
			printf("AFC r2, 1\n");
			printf("SUB r1,r2\n");
			printf("STORE %d,r1\n", a);}
	| tID tPLUS tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			printf("LOAD r0, %d\n", a);
			printf("LOAD r1, %d\n", b);
			printf("ADD r0,r1\n");
			printf("STORE %d,r0\n", a);}
	| tID tMOINS tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			printf("LOAD r0, %d\n", a);
			printf("LOAD r1, %d\n", b);
			printf("SUB r0,r1\n");
			printf("STORE %d,r0\n", a);}
	| tID tDIV tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			printf("LOAD r0, %d\n", a);
			printf("LOAD r1, %d\n", b);
			printf("DIV r0,r1\n");
			printf("STORE %d,r0\n", a);}
	| tID tMULT tEGAL Expression {
			int a = find_symbol($1);
			int b = get_last_address();
			printf("LOAD r0, %d\n", a);
			printf("LOAD r1, %d\n", b);
			printf("MUL r0,r1\n");
			printf("STORE %d,r0\n", a);};

Expression:
	  Expression tPLUS Expression {
				int a = get_last_address();
				int b = a-1;
				printf("LOAD r1, %d\n", a);
				printf("LOAD r2, %d\n", b);
				printf("ADD r1, r2\n");
				printf("STORE %d,r1\n", b);
				delete_symbol(a);
				}
	| Expression tMOINS Expression {
				int a = get_last_address();
				int b = a-1;
				printf("LOAD r1, %d\n", a);
				printf("LOAD r2, %d\n", b);
				printf("SUB r1, r2\n");
				printf("STORE %d,r1\n", b);
				delete_symbol(a);
				}
	| Expression tDIV Expression {
				int a = get_last_address();
				int b = a-1;
				printf("LOAD r1, %d\n", a);
				printf("LOAD r2, %d\n", b);
				printf("DIV r1, r2\n");
				printf("STORE %d,r1\n", b);
				delete_symbol(a);
				}
	| Expression tMULT Expression {
				int a = get_last_address();
				int b = a-1;
				printf("LOAD r1, %d\n", a);
				printf("LOAD r2, %d\n", b);
				printf("MUL r1, r2\n");
				printf("STORE %d,r1\n", b);
				delete_symbol(a);
				}
	| tID 		{
				ADD_TMP();
				printf("AFC r1, %d\n", get_value($1));
				printf("STORE %d, r1\n", get_last_address());}
	| tINTEGER 	{
				ADD_TMP();
				printf("AFC r1, %d\n", $1);
				printf("STORE %d, r1\n", get_last_address());}
	| tPARENTHESEouv Expression tPARENTHESEferm
	;

If:
	tIF tPARENTHESEouv Expression Comparateur Expression tPARENTHESEferm Body Else;

Else:
	tELSE Body
	| tELSE If
 	| ;

While:
	tWHILE tPARENTHESEouv Expression Comparateur Expression tPARENTHESEferm Body;

For:
	tFOR tPARENTHESEouv Calcul tPOINTVIRGULE Condition tPOINTVIRGULE Calcul tPARENTHESEferm Body;

Condition:
	Expression Comparateur Expression
	| ;

Comparateur:
	tEGAL tEGAL
	| tLESS tINT tID tCONST
	| tMORE
	| tLESS tEGAL
	| tMORE tEGAL;
	

%%
int main(){
	yyparse();
}
