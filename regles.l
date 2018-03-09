D	[0-9]
E	[Ee][-+]?{D}+
F	[a-zA-Z]+([_]*[a-zA-Z]*[0-9]*)*
L	[a-zA-Z]

%%

[+] printf("read plus\n" );
[-] printf("read moins\n" );
[*] printf("read multiplication\n" );
[/] printf("read division\n" );
[=] printf("read egal\n" );
[,] printf("read virgule\n" );
[\n] printf("read fin de ligne\n" );
[\t] printf("read tab\n" );
[ ] printf("read espace\n" );
[;] printf("read point virgule\n" );
{D}+	|
{D}+{E}	printf("integer\n");
{D}*"."{D}*({E})?	printf("real\n");
const[ ]{F} printf("read %s\n", yytext);
int[ ]{F} printf("read %s\n", yytext);
main printf("read main\n" );
printf[ ]*"("[ ]*{L}[ ]*")" printf("read print\n" );
[(] printf("read parenthese ouvrante\n" );
[)] printf("read parenthese fermante\n" );
["{"] printf("read acolade ouvrante\n" );
["}"] printf("read acolade fermante\n" );

