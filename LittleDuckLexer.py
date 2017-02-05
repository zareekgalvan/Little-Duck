import ply.lex as lex

keywords = {
    'program':'PROGRAM',
    'int':'INT',
    'float':'FLOAT',
    'print':'PRINT',
    'if':'IF',
    'else':'ELSE',
    'var':'VAR'
}

tokens = [
    'PLUS','MINUS','TIMES','DIVIDE',
    'EQUALS','GREATER','LESS','NOTEQUAL',
    'LEFTPAREN','RIGHTPAREN', 'LEFTBRACKET',
    'RIGHTBRACKET', 'SEMICOLON','COMMA', 'COLON',
    'CTEI', 'CTEF', 'ID', 'CTESTRING'] + list(keywords.values())

# Tokens

t_PLUS    = r'\+'
t_MINUS   = r'-'
t_TIMES   = r'\*'
t_DIVIDE  = r'/'
t_EQUALS    = r'='
t_GREATER   = r'>'
t_LESS      = r'<'
t_NOTEQUAL  = r'<>'
t_LEFTPAREN    = r'\('
t_RIGHTPAREN   = r'\)'
t_LEFTBRACKET = r'{'
t_RIGHTBRACKET = r'}'
t_SEMICOLON    = r';'
t_COMMA        = r','
t_COLON        = r':'
t_CTESTRING = r'\".*\"'

def t_CTEF(t):
    r'([0-9]+[.])[0-9]+'
    t.value = float(t.value)
    return t

def t_CTEI(t):
    r'\d+'
    t.value = int(t.value)
    return t

def t_ID(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    t.type = keywords.get(t.value,'ID')
    return t

t_ignore = " \t"

def t_newline(t):
    r'\n+'
    t.lexer.lineno += t.value.count("\n")

def t_error(t):
    print("Illegal character '{}' at: {}".format(t.value[0], t.lexer.lineno))
    t.lexer.skip(1)


lex.lex()