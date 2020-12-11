%{
	FILE *yyin;
	int yylex();
	void yyerror(const char *s);
%}

%name parse
%token BOOLEAN INT CHAR FLOAT BIT NUMBER CHARACTER REAL IDENTIFIER ASSN SC COMMA


%%


s : sboolean | sint | schar | sfloat						


sboolean : BOOLEAN blist SC { printf("Boolean Variable Declared\n"); } | BOOLEAN blist SC s { printf("Boolean Variable Declared\n"); } ;

blist : bvar | bvar COMMA blist ;

bvar : IDENTIFIER | IDENTIFIER ASSN BIT


sint : INT ilist SC { printf("Integer Variable Declared\n"); } | INT ilist SC s { printf("Integer Variable Declared\n"); } ;

ilist : ivar | ivar COMMA ilist ;

ivar : IDENTIFIER | IDENTIFIER ASSN NUMBER


schar : CHAR clist SC { printf("Character Variable Declared\n"); } | CHAR clist SC s { printf("Character Variable Declared\n"); } ;

clist : cvar | cvar COMMA clist ;

cvar : IDENTIFIER | IDENTIFIER ASSN CHARACTER


sfloat : FLOAT flist SC { printf("Float Variable Declared\n"); } | FLOAT flist SC s { printf("Float Variable Declared\n"); } ;

flist : fvar | fvar COMMA flist ;

fvar : IDENTIFIER | IDENTIFIER ASSN REAL


%%


void yyerror(const char *s )
{ 
	fprintf(stderr, "ERROR: %s\n",s);
}

int main()
{
	yyin = fopen("input.java","r");
	yyparse();
	fclose(yyin);
	
	return 0;
}
