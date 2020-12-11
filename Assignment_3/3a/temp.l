%{
%}

%%
car|house|man|state|ocean|country|city {printf("Noun\n");}
she|he|was|we|they|it {printf("Pronoun\n");}
come|go|walk|did|have|read|writ {printf("Verb\n");}
pretty|old|blue|smart {printf("Adjective\n");}
abnormally|accidently|actually|beautifully|bitterly|brightly|calmly {printf("Adverb\n");}
by|with|about|until {printf("Preposition\n");}
and|but|or|while|because {printf("Conjunction\n");}
Oh!|Wow!|Oops! {printf("Interjection");}
%%
int yywrap(void){}
int main()
{
yylex();
return 0;
}
