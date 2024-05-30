%{
#include <stdio.h>
#include <time.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
 int dval;
 }

%token HELLO GOODBYE TIME RANDOM_POSITIVE_NUMBER RANDOM_NEGATIVE_NUMBER BETWEEN

%token <dval> NUMBER

%type <dval> number


%%

chatbot : greeting
        | farewell
        | query
        | random_number
        | range_query
        ;




greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); }
         ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
         ;

query : TIME { 
            time_t now = time(NULL);
            struct tm *local = localtime(&now);
            printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
         }
       ;

random_number 
    : RANDOM_POSITIVE_NUMBER { printf("Your random number: %i\n", rand() % 100 + 1); }
    | RANDOM_NEGATIVE_NUMBER { printf("Your random number: %i\n", -(rand() % 100 + 1)); }
    ;

range_query : RANDOM_POSITIVE_NUMBER BETWEEN number number { 
                int lower = $3;
                int upper = $4;
                int random_number = (rand() % (upper - lower + 1)) + lower;
                printf("Your random number between %d and %d: %d\n", lower, upper, random_number); 
              }
            | RANDOM_NEGATIVE_NUMBER BETWEEN number number { 
                int lower = $3;
                int upper = $4;
                int random_number = -((rand() % (upper - lower + 1)) + lower);
                printf("Your random number between %d and %d: %d\n", lower, upper, random_number); 
              }
            ;

number : NUMBER { $$ = $1; }
       ;




%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, or say goodbye.\n");
    while (yyparse() == 0) {
        // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I didn't understand that.\n");
}