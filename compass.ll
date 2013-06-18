%{
#include <iostream>

#define YY_DECL extern "C" int yylex()
%}
%%
[ \t\n]         ;
"send" { std::cout << "found a send " << yytext << std::endl; }
[a-zA-Z0-9]+ { std::cout << "string "<< yytext << std::endl; }
%%
main() {
	// lex through the input:
	yylex();
}
