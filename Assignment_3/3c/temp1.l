%{
%}

%%

if|for|while|printf|scanf|else {printf("Keywords\n");}
[a-zA-z][a-zA-z0-9]* {printf("Identifier\n");}
-[0-9]+\.[0-9]*|[0-9]+\.[0-9]*|-[0-9]+|[0-9]+ {printf("Numbers\n");}
&&|\|\| {printf("Logical Operator\n");}
\+|-|\/|%|\* {printf("Arithmetic Operator\n");}
\<|\>|==|\<=|\>= {printf("Relational Operator\n");}
\.|\{|\}|\,|\;|\'|:|\"|\?|\! {printf("Punctuations\n");}
%d|%s|%f|%s {printf("Format Specifier\n");}

%%
int yywrap(void){}
int main()
{
yylex();
return 0;
}
