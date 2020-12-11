
%tokens DATATYPE LITERAL IDENTIFIER ASSN SC COMMA 

%%

start : statement start | statement ;

statement : DATATYPE varlist SC ;

varlist : var COMMA varlist | var ;

var : IDENTIFIER | IDENTIFIER ASSN LITERAL ;

%%

yyerror()
{
	...
}

int main()
{
	yyparse();
	
	return 0;
}
