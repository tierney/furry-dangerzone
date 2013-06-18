%{

/*
 * Lexer.l file
 * To generate the lexical analyzer run: "flex Lexer.l"
 */

#include "expression.h"
#include "parser.h"

#include <stdio.h>

%}

%option outfile="lexer.c" header-file="lexer.h"
%option warn nodefault

%option reentrant noyywrap never-interactive nounistd
%option bison-bridge

LPAREN      "("
RPAREN      ")"
PLUS        "+"
MULTIPLY    "*"
AND         "&&"
OR          "||"

NUMBER      [0-9]+
WS          [ \r\n\t]*

%%

{WS}            { /* Skip blanks. */ }
{NUMBER}        { sscanf(yytext, "%d", &yylval->value); return TOKEN_NUMBER; }

{MULTIPLY}      { return TOKEN_MULTIPLY; }
{PLUS}          { return TOKEN_PLUS; }
{LPAREN}        { return TOKEN_LPAREN; }
{RPAREN}        { return TOKEN_RPAREN; }
{AND}           { return TOKEN_AND; }
{OR}            { return TOKEN_OR; }
.               {  }

%%

int yyerror(const char *msg) {
    fprintf(stderr,"Error:%s\n",msg); return 0;
}