%{
	#include<stdio.h>
	#include"y.tab.h"
	#include<string.h>
	int l;
%}


%%


[0-9]+  			{ yylval.dval = atoi(yytext); return NUMBER; }
[\t]				;

pow 	return POW;
sqrt  	return SQRT;
log 	return LOG;
strlen 	return STR;
sin  	return SIN;
cos  	return COS;
tan  	return TAN;

[\n] 	return 0;
. 		return yytext[0];


%%


int yywrap()
{
	return 1;
}

