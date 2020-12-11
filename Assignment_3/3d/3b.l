%{


enum {
      LOOKUP =0, 
      KEYWORD,
      IDENTIFIER,
      NUMBER,
      LOGICAL,
      ARITHMETIC,
      RELATIONAL,
      FORMAT,
      PUN
};

int state;

int add_word(int type, char *word);
int lookup_word(char *word);
%}

%%
\n    { state = LOOKUP; } 

^keyword { state = KEYWORD; }
^identifier  { state = IDENTIFIER; }
^number  { state = NUMBER; }
^logical { state = LOGICAL; }
^arithmetic { state = ARITHMETIC; }
^relational { state = RELATIONAL; }
^format { state = FORMAT; }
^pun { state = PUN; }


[a-zA-Z0-9\.&&\|\|\+-\/%\*\<\>==\<=\>=%d%s%f%s\{\}\,\;\':\"\?\!()]+ {
                
           if(state != LOOKUP) {
                
                add_word(state, yytext);
              } else {
                 switch(lookup_word(yytext)) {
                 case KEYWORD: printf("%s: keyword\n", yytext); break;
                 case IDENTIFIER: printf("%s: identifier\n", yytext); break;
                 case NUMBER: printf("%s: number\n", yytext); break;
                 case LOGICAL: printf("%s: Logical operator\n", yytext); break;
                 case ARITHMETIC: printf("%s: Aritmetic operator\n", yytext); break;
                 case RELATIONAL: printf("%s: Relational operator\n", yytext); break;
                 case FORMAT: printf("%s: Format Specifier\n", yytext); break;
                 case PUN: printf("%s: Punctuation Symbol\n", yytext); break;
                 default:
                         printf("%s: don't recognize\n", yytext);
                         break;
                 }
          }
         }

.    ;

%%


int main()
{
      yylex();
}


struct word {
      char *word_name;
      int word_type;
      struct word *next;
};

struct word *word_list; 

extern void *malloc() ;

int
add_word(int type, char *word)
{
      struct word *wp;

      if(lookup_word(word) != LOOKUP) {
            printf("!!! warning: word %s already defined \n", word);
            return 0;
      }

      
      wp = (struct word *) malloc(sizeof(struct word));

      wp->next = word_list;

  

      wp->word_name = (char *) malloc(strlen(word)+1);
      strcpy(wp->word_name, word);
      wp->word_type = type;
      word_list = wp;
      return 1;  
}

int
lookup_word(char *word)
{
      struct word *wp = word_list;

      for(; wp; wp = wp->next) {
      if(strcmp(wp->word_name, word) == 0)
            return wp->word_type;
      }

      return LOOKUP;       
}



