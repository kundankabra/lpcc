%{
#include<stdio.h>
#include"y.tab.h"
#include<string.h>
int l;
%}
%%


[0-9]+  {
    	yylval.dval = atof(yytext);              
    	return NUMBER;
	}
[\t];
\(\"[a-zA-Z]*\"\) {
	       yylval.dval = strlen(yytext)-4;
	       return NUMBER;
	       }
pow return POW;
sqrt  return SQRT;
log return LOG;
strlen return STR;
sin  return SIN;
cos  return COS;
tan  return TAN;

[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}

