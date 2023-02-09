/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_TURTLEYACC_H_INCLUDED
# define YY_YY_TURTLEYACC_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     HOME = 258,
     PD = 259,
     PU = 260,
     HT = 261,
     ST = 262,
     FD = 263,
     BK = 264,
     RT = 265,
     LT = 266,
     SETC = 267,
     SETXY = 268,
     SETX = 269,
     SETY = 270,
     IF = 271,
     IFELSE = 272,
     REPEAT = 273,
     TO = 274,
     RETURN = 275,
     INT = 276,
     RANDOM = 277,
     XCOR = 278,
     YCOR = 279,
     HEADING = 280,
     SETH = 281,
     COLOR = 282,
     BLACK = 283,
     WHITE = 284,
     ORANGE = 285,
     YELLOW = 286,
     LIME = 287,
     CYAN = 288,
     BLUE = 289,
     MAGENTA = 290,
     RED = 291,
     BROWN = 292,
     GREEN = 293,
     TURQUOISE = 294,
     SKY = 295,
     VIOLET = 296,
     PINK = 297,
     NUMBER = 298,
     ID = 299
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_TURTLEYACC_H_INCLUDED  */
