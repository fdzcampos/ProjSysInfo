%{
	#include<stdio.h>
	int yylex(void);
	void yyerror(char*);
%}
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
%token tIF;
%token tELSE;
%token tWHILE;
%token tFOR;
%token tLESS;
%token tMORE;
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
	Decls 
	| Print 
	| Calcul tPOINTVIRGULE
	| If
	| While
	| For;

Decls:
	Decl Decls 
	| ;

Decl: 
	tINT tID Declp;

Declp: 
	tVIRGULE tID Declp 
	| tPOINTVIRGULE;

Print: 
	tPRINT tPARENTHESEouv Expression tPARENTHESEferm tPOINTVIRGULE;

Calcul: 
	tID tEGAL Expression
	| tID tPLUS tPLUS
	| tID tMOINS tMOINS
	| tID tPLUS tEGAL Expression
	| tID tMOINS tEGAL Expression
	| tID tDIV tEGAL Expression
	| tID tMULT tEGAL Expression;

Expression:
	  Expression tPLUS Expression
	| Expression tMOINS Expression
	| Expression tDIV Expression
	| Expression tMULT Expression
	| tID
	| tINTEGER
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
	| tLESS
	| tMORE
	| tLESS tEGAL
	| tMORE tEGAL;
	

%%
int main(){
	yyparse();
}
