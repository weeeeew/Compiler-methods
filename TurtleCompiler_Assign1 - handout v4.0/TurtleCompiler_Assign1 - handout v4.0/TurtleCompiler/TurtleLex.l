
%{

/* Turtle Compiler lex file
   by Pete Myers
   OIT Portland Fall 2008
   Flex C++ version Jan 2017

   Edited by Gabriel Browning
   January 2023

   Assignment 1 Handout
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char * msg);

void PrintKeyword(const char * lexeme);
void PrintIdentifier(const char * lexeme);
void PrintNumber(const char * lexeme);
void PrintIllegal(const char * lexeme);
int countNewLines(const char * string);

%}

%option noyywrap

%%

"="			{ PrintKeyword(yytext); }
"<"			{ PrintKeyword(yytext); }
">"			{ PrintKeyword(yytext); }

"/"			{ PrintKeyword(yytext); }
"*"			{ PrintKeyword(yytext); }
"-"			{ PrintKeyword(yytext); }
"+"			{ PrintKeyword(yytext); }

"["			{ PrintKeyword(yytext); }
"]"			{ PrintKeyword(yytext); }
"("			{ PrintKeyword(yytext); }
")"			{ PrintKeyword(yytext); }

if			{ PrintKeyword(yytext); }
ifelse		{ PrintKeyword(yytext); }
repeat		{ PrintKeyword(yytext); }

to			{ PrintKeyword(yytext); }
return		{ PrintKeyword(yytext); }

int			{ PrintKeyword(yytext); }
random		{ PrintKeyword(yytext); }


xcor		{ PrintKeyword(yytext); }
ycor		{ PrintKeyword(yytext); }
home		{ PrintKeyword(yytext); }
setx		{ PrintKeyword(yytext); }
sety		{ PrintKeyword(yytext); }
setxy		{ PrintKeyword(yytext); }

heading		{ PrintKeyword(yytext); }
seth		{ PrintKeyword(yytext); }

color		{ PrintKeyword(yytext); }
setc		{ PrintKeyword(yytext); }
pd			{ PrintKeyword(yytext); }
pu			{ PrintKeyword(yytext); }
ht			{ PrintKeyword(yytext); }
st			{ PrintKeyword(yytext); }

black		{ PrintKeyword(yytext); }
white		{ PrintKeyword(yytext); }
orange		{ PrintKeyword(yytext); }
yellow		{ PrintKeyword(yytext); }
lime		{ PrintKeyword(yytext); }
cyan		{ PrintKeyword(yytext); }
blue		{ PrintKeyword(yytext); }
magenta		{ PrintKeyword(yytext); }
red			{ PrintKeyword(yytext); }
brown		{ PrintKeyword(yytext); }
green		{ PrintKeyword(yytext); }
turquoise	{ PrintKeyword(yytext); }
sky			{ PrintKeyword(yytext); }
violet		{ PrintKeyword(yytext); }
pink		{ PrintKeyword(yytext); }


fd			{ PrintKeyword(yytext); }
bk			{ PrintKeyword(yytext); }
rt			{ PrintKeyword(yytext); }
lt			{ PrintKeyword(yytext); }

fd			{ PrintKeyword(yytext); }
bk			{ PrintKeyword(yytext); }
rt			{ PrintKeyword(yytext); }
lt			{ PrintKeyword(yytext); }


-?[0-9]+			{ PrintNumber(yytext); }
[a-z][0-9a-z]*		{ PrintIdentifier(yytext); }



\/\/.*\n	{ /* line comment */ yylineno++; }

\/\*([^*]|(\*+[^*/]))*\*+\/		{ /* group comment */ yylineno += countNewLines(yytext); }

(\t|" ")+	{ /* ignore whitespace */ }

\n			{ yylineno++; }

[^ \(\)\[\]\+\-\*\/\=\<\>\t\n]*		{ PrintIllegal(yytext); }

.			{ PrintIllegal(yytext); }


%%

void PrintKeyword(const char * lexeme)
{
	printf("%d\tKeyword: %s\n", yylineno, lexeme);
}

void PrintIdentifier(const char * lexeme)
{
	printf("Id: %s\n", lexeme);
}

void PrintNumber(const char * lexeme)
{
	printf("Number: %s\n", lexeme);
}

void PrintIllegal(const char * lexeme)
{
	printf("Illegal: %s\n", lexeme);
}

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

