%{
	#include "y.tab.h"	
%}

DIGIT		[0-9]
TEXT		[A-Za-z]

NUMBER		[0-9]+
REAL		[0-9]*[.][0-9]+
CHARACTER	\'.\'
IDENTIFIER	[A-Za-z$_]({DIGIT}|{TEXT}|_|$)*

ASSN		=
SC 		;
COMMA		,

%%

boolean			{ printf("%s\t==> BOOLEAN\n",yytext); return(BOOLEAN); }
int				{ printf("%s\t==> INT\n",yytext); return(INT); }
char			{ printf("%s\t==> CHAR\n",yytext); return(CHAR); }
float			{ printf("%s\t==> FLOAT\n",yytext); return(FLOAT); }

true|false		{ printf("%s\t==> BIT\n",yytext); return(BIT); }
{IDENTIFIER}		{ printf("%s\t==> IDENTIFIER\n",yytext); return(IDENTIFIER); }
{NUMBER}		{ printf("%s\t==> NUMBER\n",yytext); return(NUMBER); }
{REAL}			{ printf("%s\t==> REAL\n",yytext); return(REAL); }
{CHARACTER}		{ printf("%s\t==> CHARACTER\n",yytext); return(CHARACTER); }
{ASSN}			{ printf("%s\t==> ASSIGNMENT\n",yytext); return(ASSN); }
{SC}			{ printf("%s\t==> SEMICOLON\n",yytext); return(SC); }
{COMMA}			{ printf("%s\t==> COMMA\n",yytext); return(COMMA); }
. 			;

%%

int yywrap()
{
	return 1;
}

