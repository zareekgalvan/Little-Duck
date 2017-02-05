/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PROGRAM = 258,
     ID = 259,
     SEMICOLON = 260,
     LEFT_CURLYBRACKET = 261,
     RIGHT_CURLYBRACKET = 262,
     VAR = 263,
     COLON = 264,
     COMMA = 265,
     INT_TYPE = 266,
     FLOAT_TYPE = 267,
     STRING_TYPE = 268,
     EQUAL_SIGN = 269,
     LESS_THAN = 270,
     GREATER_THAN = 271,
     NOT_EQUAL = 272,
     PRINT = 273,
     LEFT_PARENTHESIS = 274,
     RIGHT_PARENTHESIS = 275,
     PLUS_SIGN = 276,
     MINUS_SIGN = 277,
     MULTIPLICATION_SIGN = 278,
     DIVISION_SIGN = 279,
     IF = 280,
     ELSE = 281,
     INT = 282,
     FLOAT = 283,
     STRING = 284
   };
#endif
/* Tokens.  */
#define PROGRAM 258
#define ID 259
#define SEMICOLON 260
#define LEFT_CURLYBRACKET 261
#define RIGHT_CURLYBRACKET 262
#define VAR 263
#define COLON 264
#define COMMA 265
#define INT_TYPE 266
#define FLOAT_TYPE 267
#define STRING_TYPE 268
#define EQUAL_SIGN 269
#define LESS_THAN 270
#define GREATER_THAN 271
#define NOT_EQUAL 272
#define PRINT 273
#define LEFT_PARENTHESIS 274
#define RIGHT_PARENTHESIS 275
#define PLUS_SIGN 276
#define MINUS_SIGN 277
#define MULTIPLICATION_SIGN 278
#define DIVISION_SIGN 279
#define IF 280
#define ELSE 281
#define INT 282
#define FLOAT 283
#define STRING 284




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 20 "patito.y"
{
	int ival;
	float fval;
	char *sval;
}
/* Line 1529 of yacc.c.  */
#line 113 "patito.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

