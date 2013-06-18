%{
#include <iostream>
#include <string>
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
#define YY_DECL extern "C" int yylex()

#include "parser.h"
%}
%%
[ \t\n]         ;
[0-9]+\.[0-9]*          SAVE_TOKEN; return TDOUBLE;
[0-9]+                  SAVE_TOKEN; return TINTEGER;
"("                     return TOKEN(TLPAREN);
")"                     return TOKEN(TRPAREN);
"&&"                    return TOKEN(TAND);
"||"                    return TOKEN(TOR);
"send" { std::cout << "found a send " << yytext << std::endl; }
[a-zA-Z0-9]+ { std::cout << "string "<< yytext << std::endl; }
.                       std::cout << "Unknown token!" << std::endl; yyterminate();

%%
