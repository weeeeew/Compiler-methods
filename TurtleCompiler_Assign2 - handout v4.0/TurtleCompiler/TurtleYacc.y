%{

/* Turtle Compiler yacc file
   by Pete Myers
   OIT Portland Fall 2008
   Bison C++ version Jan 2017

   Assignment 2 handout
*/

#include <stdio.h>
#include <stdlib.h>

extern FILE * yyin;
extern FILE * yyout;
extern int yylineno;

void yyerror(const char *);

int yylex(void);

%}

%token HOME
%token PD
%token PU
%token HT
%token ST
%token FD
%token BK
%token RT
%token LT
%token SETC
%token SETXY
%token SETX
%token SETY

%token IF
%token IFELSE
%token REPEAT

%token TO
%token RETURN

%token INT
%token RANDOM

%token XCOR
%token YCOR

%token HEADING
%token SETH

%token COLOR

%token BLACK
%token WHITE
%token ORANGE
%token YELLOW
%token LIME
%token CYAN 
%token BLUE
%token MAGENTA
%token RED
%token BROWN
%token GREEN
%token TURQUOISE
%token SKY
%token VIOLET
%token PINK

%token NUMBER
%token ID

%left '+' '-'
%left '*' '/'


%%

statements:	statement statements		{ printf("statements->statement statements\n"); }
	|									{ printf("statements-><empty>\n"); }
	;

statement:	HOME						{ printf("statement->HOME\n"); }
	|	PD								{ printf("statement->PD\n"); }
	|	PU								{ printf("statement->PU\n"); }
	|	ST								{ printf("statement->ST\n"); }
	|	HT								{ printf("statement->HT\n"); }
	|	FD expression					{ printf("statement->FD expression\n"); }
	|	BK expression					{ printf("statement->BK expression\n"); }
	|	RT expression					{ printf("statement->RT expression\n"); }
	|	LT expression					{ printf("statement->LT expression\n"); }
	|	SETC expression					{ printf("statement->SETC expression\n"); }
	|	SETX expression					{ printf("statement->SETX expression\n"); }
	|	SETY expression					{ printf("statement->SETY expression\n"); }
	|	SETH expression					{ printf("statement->SETH expression\n"); }
	|	SETXY expression expression		{ printf("statement->SETXY expression expression\n"); };
	|	IF '(' condition ')' '[' statements ']'							{ printf("statement->IF ( condition ) [ statements ]\n"); }
	|	IFELSE '(' condition ')' '[' statements ']'	'[' statements ']'	{ printf("statement->IFELSE ( condition ) [ statements ] [ statements ]\n"); }
	|	REPEAT expression '[' statements ']'							{ printf("statement->REPEAT expression [ statements ]\n"); }
	|	vardecl							{ printf("statement->vardecl\n"); }
	|	ID '=' expression				{ printf("statement->ID = expression\n"); }
	|	ID '(' args ')'					{ printf("statement->ID ( args )\n"); }
	|	procsig '[' statements ']'		{ printf("statement->procsig [ statements ]\n"); }
	|	RETURN expression				{ printf("statement->RETURN expression\n"); }
	|	RETURN							{ printf("statement->RETURN\n"); }
	;

expression:	expression '+' expression	{ printf("expression->expression + expression\n"); }
	|	expression '-' expression		{ printf("expression->expression - expression\n"); }
	|	expression '*' expression		{ printf("expression->expression * expression\n"); }
	|	expression '/' expression		{ printf("expression->expression / expression\n"); }
	|	'(' expression ')'				{ printf("expression->( expression )\n"); }
	|	NUMBER							{ printf("expression->NUMBER\n"); }
	|	ID								{ printf("expression->ID\n"); }
	|	ID '(' args ')'					{ printf("expression->ID ( args )\n"); }
	|	colorconst						{ printf("expression->colorconst\n"); }
	|	function						{ printf("expression->function\n"); }
	;
	
condition: expression '=' expression	{ printf("condition->expression = expression\n"); }
	|	expression '<' expression		{ printf("condition->expression < expression\n"); }
	|	expression '>' expression		{ printf("condition->expression > expression\n"); }
	;

function: COLOR							{ printf("expression->COLOR\n"); }
	|	YCOR							{ printf("expression->YCOR\n"); }
	|	XCOR							{ printf("expression->XCOR\n"); }
	|	RANDOM '(' expression ')'		{ printf("expression->RANDOM ( expression )\n"); }
	|	HEADING							{ printf("expression->HEADING\n"); }
	;

procsig: TO ID '(' params ')'			{ printf("procsig->TO ID ( params )\n"); }
	;

vardecl: INT ID							{ printf("vardecl->INT ID\n"); }
	;

params: vardecl params					{ printf("params->vardecl params\n"); }
	|									{ printf("params-><empty>\n"); }
	;
	
args: expression args					{ printf("args->expression args\n"); }
	|									{ printf("args-><empty>\n"); }
	;

colorconst: BLACK						{ printf("colorconst->black\n"); }
	|	WHITE							{ printf("colorconst->white\n"); }
	|	ORANGE							{ printf("colorconst->orange\n"); }
	|	YELLOW							{ printf("colorconst->yellow\n"); }
	|	LIME							{ printf("colorconst->lime\n"); }
	|	CYAN							{ printf("colorconst->cyan\n"); }
	|	BLUE							{ printf("colorconst->blue\n"); }
	|	MAGENTA							{ printf("colorconst->magenta\n"); }
	|	RED								{ printf("colorconst->red\n"); }
	|	BROWN							{ printf("colorconst->brown\n"); }
	|	GREEN							{ printf("colorconst->green\n"); }
	|	TURQUOISE						{ printf("colorconst->turquoise\n"); }
	|	SKY								{ printf("colorconst->sky\n"); }
	|	VIOLET							{ printf("colorconst->violet\n"); }
	|	PINK							{ printf("colorconst->pink\n"); }
	;

%%


