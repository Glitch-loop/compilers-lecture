%{
#include "y.tab.h"
%}

%%

hello           { return HELLO; }
hi              { return HELLO; }
hey             { return HELLO; }
goodbye         { return GOODBYE; }
bye             { return GOODBYE; }
time            { return TIME; }
what[' ']is[' ']the[' ']time  { return TIME; }
what[' ']time[' ']is[' ']it  { return TIME; }
give[' ']me[' ']a[' ']random[' ']number {return RANDOM_POSITIVE_NUMBER; }
give[' ']me[' ']a[' ']negative[' ']random[' ']number {return RANDOM_NEGATIVE_NUMBER; }
[0-9]+ { return NUMBER; }
\n              { return 0; }  /* End of input on newline */

.               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}