BUILT_SOURCES = parser.h
AM_YFLAGS = -d
bin_PROGRAMS = wiki_main
wiki_main_SOURCES = lexer.l parser.y  wiki_main.c expression.c
wiki_main_LDADD = -lfl

clean-local:
	-rm -f lexer.c lexer.h parser.c parser.h
