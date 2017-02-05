import sys
import ply.yacc as yacc
from LittleDuckLexer import tokens

def p_program(p):
    '''program : PROGRAM ID SEMICOLON programVars bloque'''
    p[0] = "PROGRAM COMPILED"

def p_programVars(p):
    '''programVars : vars
                   | empty'''

def p_bloque(p):
    '''bloque : LEFTBRACKET estatutoBloque RIGHTBRACKET'''

def p_estatutoBloque(p):
    '''estatutoBloque : estatuto estatutoBloque
                      | empty'''

def p_vars(p):
    '''vars : VAR varId COLON tipo SEMICOLON a'''

def p_varId(p):
    '''varId : ID varsId'''

def p_varsId(p):
    '''varsId : COMMA ID varsId
              | empty'''

def p_a(p):
    '''a : varId COLON tipo SEMICOLON a
         | empty'''

def p_tipo(p):
    '''tipo : INT
            | FLOAT'''

def p_estatuto(p):
    '''estatuto : asignacion
                | condicion
                | escritura '''

def p_asignacion(p):
    '''asignacion : ID EQUALS expresion SEMICOLON'''

def p_expresion(p):
    '''expresion : exp comparison'''

def p_comparison(p):
    '''comparison : GREATER comparisonExp
                  | LESS comparisonExp
                  | NOTEQUAL comparisonExp
                  | empty'''

def p_comparisonExp(p):
    '''comparisonExp : exp'''

def p_escritura(p):
    '''escritura : PRINT LEFTPAREN toprint RIGHTPAREN SEMICOLON'''

def p_toprint(p):
    '''toprint : expresion toprintExp
               | CTESTRING toprintExp'''

def p_toprintExp(p):
    '''toprintExp : COMMA  toprint
                  | empty'''

def p_exp(p):
    '''exp : termino operator'''

def p_operator(p):
    '''operator : PLUS termino operator
            | MINUS termino operator
            | empty'''

def p_termino(p):
    '''termino : factor termOperator'''

def p_termOperator(p):
    '''termOperator : TIMES factor termOperator
                    | DIVIDE factor termOperator
                    | empty'''

def p_condicion(p):
    '''condicion : IF LEFTPAREN expresion RIGHTPAREN bloque elseCondition SEMICOLON'''

def p_elseCondition(p):
    '''elseCondition : ELSE bloque
                     | empty'''

def p_varcte(p):
    '''varcte : ID
              | CTEI
              | CTEF'''

def p_factor(p):
    '''factor : LEFTPAREN expresion RIGHTPAREN
              | sign varcte'''

def p_sign(p):
    '''sign : PLUS
            | MINUS
            | empty'''

def p_empty(p):
    '''empty :'''

def p_error(p):
    print("ERROR {}".format(p))

yacc.yacc()

if __name__ == '__main__':
	if (len(sys.argv) > 1):
		file = sys.argv[1]
		# Abre el archivo, almacena su informacion y lo cierra
		try:
			f = open(file,'r')
			data = f.read()
			f.close()
			# Parsear el contenido
			
			if (yacc.parse(data, tracking=True) == 'PROGRAM COMPILED'):
				print "Valid syntax"

		except EOFError:
	   		print(EOFError)
	else:
		print('File missing')