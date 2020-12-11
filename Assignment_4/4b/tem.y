%{
    #include<math.h>		//Run gcc with -lm flag
    #include<stdio.h>
    #include<string.h>
%}


%union 
{
    double dval;
}
 
%token <dval> NUMBER
%token SQRT
%token STR
%token LOG
%token POW
%token SIN
%token COS
%token TAN
%type <dval> E

%%
exp: E{
     printf("\nResult=%lf\n",$1);
     return 0;
     }
    
E:SQRT'('NUMBER')' {$$ = sqrt($3);}
 |STR NUMBER {$$= $2;}	
 |LOG'('NUMBER')' {$$ = log($3);}
 |POW'('NUMBER','NUMBER')' {$$ = pow($3,$5);}
 |SIN'('NUMBER')' {$$ = sin($3*(3.14159265/180));}
 |COS'('NUMBER')' {$$ = cos($3*(3.14159265/180));}
 |TAN'('NUMBER')' {$$ = tan($3*(3.14159265/180));}
 ;
%%

void main()
{
printf("\nEnter A Valid Function : ");
yyparse();
}
int yyerror(char *errormsg)
{
    fprintf(stderr, "%s\n", errormsg);
    exit(1);
}
