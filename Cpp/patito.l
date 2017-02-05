%{
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
int line_count = 1;

#include "patito.tab.h"  // para obtener los tokens

%}
%%

program				{ return PROGRAM; }
";"					{ return SEMICOLON; }
"{"					{ return LEFT_CURLYBRACKET; }
"}"					{ return RIGHT_CURLYBRACKET; }
var					{ return VAR; }
":"					{ return COLON; }
","					{ return COMMA; }
"="					{ return EQUAL_SIGN; }
"<"					{ return LESS_THAN; }
">"					{ return GREATER_THAN; }
"<>"				{ return NOT_EQUAL; }
print				{ return PRINT; }
"("					{ return LEFT_PARENTHESIS; }
")"					{ return RIGHT_PARENTHESIS; }
"+"					{ return PLUS_SIGN; }
"-"					{ return MINUS_SIGN; }
"*"					{ return MULTIPLICATION_SIGN; }
"/"					{ return DIVISION_SIGN; }
if 					{ return IF; }
else				{ return ELSE; }
int 				{ return INT_TYPE; }
float 				{ return FLOAT_TYPE; }

[0-9]+            	{ yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+     	{ yylval.sval = strdup(yytext); return ID; }
[0-9]+\.[0-9]+ 		{ yylval.fval = atof(yytext); return FLOAT; }
\".*\"				{ return STRING; }

[\n]           		{ ++line_count; }

.                	;
%%