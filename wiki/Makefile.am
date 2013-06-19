BUILT_SOURCES = parser.h

AM_YFLAGS = -d
AM_LFLAGS = -olex.yy.c

bin_PROGRAMS = wiki_main
wiki_main_SOURCES = lexer.ll parser.y wiki_main.cc expression.c

clean-local:
	-rm -f lexer.c lexer.cc lexer.h lexer.hh parser.c parser.cc parser.h parser.hh
