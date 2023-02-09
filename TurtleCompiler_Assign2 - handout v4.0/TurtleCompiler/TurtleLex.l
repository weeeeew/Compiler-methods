
%{

/* Turtle Compiler lex file
   by Pete Myers
   OIT Portland Fall 2008
   Flex C++ version Jan 2017

   Assignment 2 handout
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "TurtleYacc.h"

void yyerror(const char * msg);

int countNewLines(const char * string);

%}

%option noyywrap

%%

"="			{ return yytext[0]; }
"<"			{ return yytext[0]; }
">"			{ return yytext[0]; }

"/"			{ return yytext[0]; }
"*"			{ return yytext[0]; }
"-"			{ return yytext[0]; }
"+"			{ return yytext[0]; }

"["			{ return yytext[0]; }
"]"			{ return yytext[0]; }
"("			{ return yytext[0]; }
")"			{ return yytext[0]; }

if			{ return IF; }
ifelse		{ return IFELSE; }
repeat		{ return REPEAT; }

to			{ return TO; }
return		{ return RETURN; }

int			{ return INT; }
random		{ return RANDOM; }


xcor		{ return XCOR; }
ycor		{ return YCOR; }
home		{ return HOME; }
setx		{ return SETX; }
sety		{ return SETY; }
setxy		{ return SETXY; }

heading		{ return HEADING; }
seth		{ return SETH; }

color		{ return COLOR; }
setc		{ return SETC; }
pd			{ return PD; }
pu			{ return PU; }
ht			{ return HT; }
st			{ return ST; }

black		{ return BLACK; }
white		{ return WHITE; }
orange		{ return ORANGE; }
yellow		{ return YELLOW; }
lime		{ return LIME; }
cyan		{ return CYAN; }
blue		{ return BLUE; }
magenta		{ return MAGENTA; }
red			{ return RED; }
brown		{ return BROWN; }
green		{ return GREEN; }
turquoise	{ return TURQUOISE; }
sky			{ return SKY; }
violet		{ return VIOLET; }
pink		{ return PINK; }


fd			{ return FD; }
bk			{ return BK; }
rt			{ return RT; }
lt			{ return LT; }

-?[0-9]+			{ return NUMBER; }
[a-z][0-9a-z]*		{ return ID; }



\/\/.*	{ /* line comment */ }

\/\*([^*]|(\*+[^*/]))*\*+\/		{ /* group comment */ yylineno += countNewLines(yytext); }

(\t|" ")+	{ /* ignore whitespace */ }

\n			{ yylineno++; }

[^ \(\)\[\]\+\-\*\/\=\<\>\t\n]*		{ yyerror(yytext); }

.			{ yyerror(yytext); }


%%

void yyerror(const char * msg)
{
	fprintf(stderr, "ERROR! Line #%d: %s, near '%s'\n", yylineno, msg, yytext);
}

int countNewLines(const char * string){
	int count = 0;
	for (unsigned int i = 0; i < strlen(string); i++)
		if (string[i] == '\n')
			count++;
	return count;
}

