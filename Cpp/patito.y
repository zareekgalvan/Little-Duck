%{
#include <cstdio>
#include <iostream>
using namespace std;

// stuff from flex that bison needs to know about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;
extern int line_count;
 
void yyerror(const char *s);
%}

// Bison fundamentally works by asking flex to get the next token, which it
// returns as an object of type "yystype".  But tokens could be of any
// arbitrary data type!  So we deal with that in Bison by defining a C union
// holding each of the types of tokens that Flex could return, and have Bison
// use that union instead of "int" for the definition of "yystype":
%union {
	int ival;
	float fval;
	char *sval;
}

// Sibolos terminales del lenguaje
%token <sval> PROGRAM
%token <sval> ID
%token <sval> SEMICOLON
%token <sval> LEFT_CURLYBRACKET
%token <sval> RIGHT_CURLYBRACKET
%token <sval> VAR
%token <sval> COLON
%token <sval> COMMA
%token <sval> INT_TYPE
%token <sval> FLOAT_TYPE
%token <sval> STRING_TYPE
%token <sval> EQUAL_SIGN
%token <sval> LESS_THAN
%token <sval> GREATER_THAN
%token <sval> NOT_EQUAL
%token <sval> PRINT
%token <sval> LEFT_PARENTHESIS
%token <sval> RIGHT_PARENTHESIS
%token <sval> PLUS_SIGN
%token <sval> MINUS_SIGN
%token <sval> MULTIPLICATION_SIGN
%token <sval> DIVISION_SIGN
%token <sval> IF
%token <sval> ELSE
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

//Simbolos no terminales del lenguaje
%type <sval> programa
%type <sval> a
%type <sval> bloque
%type <sval> vars
%type <sval> b
%type <sval> estatuto
%type <sval> c
%type <sval> tipo
%type <sval> d
%type <sval> e
%type <sval> f
%type <sval> asignacion
%type <sval> expresion
%type <sval> g
%type <sval> h
%type <sval> exp
%type <sval> escritura
%type <sval> i
%type <sval> j
%type <sval> termino
%type <sval> k
%type <sval> factor
%type <sval> l
%type <sval> condicion
%type <sval> m
%type <sval> varcte
%type <sval> n
%type <sval> o
%type <sval> p
%type <sval> q

%%

// Gramatica que Bison parseará
programa:
	PROGRAM ID SEMICOLON a bloque { cout << "Programa Valido. Con "<< line_count << " lineas de codigo."  << endl; }
	;

a:
	vars
	| /*vacio*/ {}
	;

bloque:
	LEFT_CURLYBRACKET b RIGHT_CURLYBRACKET
	;

b:
	estatuto b
	| /*vacio*/ {}
	;

vars:
	VAR c COLON tipo SEMICOLON q
	;

c:
	ID d
	;

d:
	COMMA ID d
	| /*vacio*/ {}
	;

tipo:
	e
	;

e:
	INT_TYPE
	| FLOAT_TYPE
	;

estatuto:
	f
	;

f:
	asignacion
	| condicion
	| escritura
	;

asignacion:
	ID EQUAL_SIGN expresion SEMICOLON
	;

expresion:
	exp g
	;

g:
	GREATER_THAN h
	| LESS_THAN h
	| NOT_EQUAL h
	| /*vacio*/ {}
	;

h:
	exp
	;

escritura:
	PRINT LEFT_PARENTHESIS i RIGHT_PARENTHESIS SEMICOLON
	;

i:
	expresion j
	| STRING j
	;

j:
	COMMA i
	| /*vacio*/ {}
	;

exp:
	termino k
	;

k:
	PLUS_SIGN termino k
	| MINUS_SIGN termino k
	| /*vacio*/ {}
	;

termino:
	factor l
	;

l:
	MULTIPLICATION_SIGN factor l
	| DIVISION_SIGN factor l
	| /*vacio*/ {}
	;

condicion:
	IF LEFT_PARENTHESIS expresion RIGHT_PARENTHESIS bloque m SEMICOLON
	;

m:
	ELSE bloque
	| /*vacio*/ {}
	;

varcte:
	n
	;

n:
	ID
	| INT {}
	| FLOAT {}
	;

factor:
	o
	;

o:
	LEFT_PARENTHESIS expresion RIGHT_PARENTHESIS
	| p varcte
	;

p:
	PLUS_SIGN
	| MINUS_SIGN
	| /*vacio*/ {}
	;

q:
	c COLON tipo SEMICOLON q
	| /*vacio*/ {}
	;

%%

int main(int argc, char *argv[]) {
	// open a file handle to a particular file:
	FILE *myfile = fopen(argv[1], "r");
	// make sure it is valid:
	if (!myfile) {
		cout << "I can't open the file!" << endl;
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));
	
}

void yyerror(const char *s) {
	cout << "Parse error in line " << line_count <<"! Message: " << s << endl;
	// might as well halt now:
	exit(-1);
}