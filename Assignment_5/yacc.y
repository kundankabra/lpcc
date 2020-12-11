%{
 #include"y.tab.h"
 #include<stdio.h>
 char table(char,char,char);

 int count=0;
 char temp = 'A'-1;

 struct expression{
 char opr1;
 char opr2;
 char operator;
 char result;
 };



%}

 %union{
 char symbol;
}


 %left '+' '-'		
 %left '/' '*'

 %token <symbol> LETTER NUMBER
 %type <symbol> exp
 
%%

 statement: LETTER '=' exp ';' {table((char)$1,(char)$3,'=');};
 exp: exp '+' exp 		{$$ = table((char)$1,(char)$3,'+');}
     |exp '-' exp 		{$$ = table((char)$1,(char)$3,'-');}
     |exp '/' exp 		{$$ = table((char)$1,(char)$3,'/');}
     |exp '*' exp 		{$$ = table((char)$1,(char)$3,'*');}
     |'(' exp ')' 		{$$= (char)$2;}
     |NUMBER 			{$$ = (char)$1;}
     |LETTER 			{(char)$1;};

%%

 struct expression exp_array[20]; 

 void yyerror(char *s){
     printf("Error %s",s);
 }

 char table(char a, char b, char o){
     temp++;
     exp_array[count].opr1 =a;
     exp_array[count].opr2 = b;
     exp_array[count].operator = o;
     exp_array[count].result=temp;
     count++;
     return temp;
 }
 

 void intermediate_convo(){
     int i=0;
     char temp='A';
     while(i<count){
         printf("%c:=\t",exp_array[i].result);
         printf("%c\t",exp_array[i].opr1);
         printf("%c\t",exp_array[i].operator);
         printf("%c\t",exp_array[i].opr2);
         i++;
         temp++;
         printf("\n");
     }
 }


 int yywrap(){
     return 1;
 }

 int main(){
     printf("Enter the expression: ");
     yyparse();				//reads a stream of token/value pairs from yylex(),
     intermediate_convo();
     printf("\n");	
     return 0;
 }
