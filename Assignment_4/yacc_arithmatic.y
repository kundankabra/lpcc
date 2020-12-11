
%{

 #include<stdio.h> #include "y.tab.h" extern intyylval;

%}


%%

 [0-9]+ 
 {
 	yylval=atoi(yytext);
 	return NUMBER;
 }

 [\t] ;
 [\n] return 0;
 . return yytext[0];

%%


 intyywrap()
 {
	return 1;
 }
