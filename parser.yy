%{
#include <cstdio>
#include <iostream>

extern "C" int yylex();
extern "C" int yyparse();

void yyerror(const char *s);
%}

%union {
  int token;
  std::string* string;
}

%token <string> TINTEGER TDOUBLE
%token <token> TLPAREN TRPAREN TAND TOR

%%
formula:
  formula TDOUBLE { std::cout << "double " << $2 << std::endl; }
  | formula TINTEGER { std::cout << "int " << $2 << std::endl; }
  | TLPAREN { std::cout << "lparen" << std::endl; }
  | TRPAREN { std::cout << "rparen" << std::endl; }
  | TAND { std::cout << "and" << std::endl; }
  | TOR { std::cout << "or" << std::endl; }

%%
main() {
	// lex through the input:
	yylex();
}
void yyerror(const char *s) {
	std::cout << "EEK, parse error!  Message: " << s << std::endl;
	// might as well halt now:
	exit(-1);
}
