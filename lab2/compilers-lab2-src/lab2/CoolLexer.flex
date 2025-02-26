%{
#include <iostream>
#include <fstream>
#include <cstdio>
#include <string>

#include "Parser.h"
#include "CoolLexer.h"

#undef YY_DECL
#define YY_DECL int CoolLexer::yylex()

%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
INT         {DIGIT}+
STRING      \"([^\"\\]|\\.)*\"
WHITESPACE  [ \t\n\r]+
COMMENT     --.*\n

%%

"class"     { return TOKEN_CLASS; }
"inherits"  { return TOKEN_INHERITS; }
"if"        { return TOKEN_IF; }
"then"      { return TOKEN_THEN; }
"else"      { return TOKEN_ELSE; }
"fi"        { return TOKEN_FI; }
"while"     { return TOKEN_WHILE; }
"loop"      { return TOKEN_LOOP; }
"pool"      { return TOKEN_POOL; }
"let"       { return TOKEN_LET; }
"in"        { return TOKEN_IN; }
"case"      { return TOKEN_CASE; }
"of"        { return TOKEN_OF; }
"esac"      { return TOKEN_ESAC; }
"new"       { return TOKEN_NEW; }
"isvoid"    { return TOKEN_ISVOID; }
"not"       { return TOKEN_NOT; }
"true"      { return TOKEN_TRUE; }
"false"     { return TOKEN_FALSE; }
{ID}        { return TOKEN_ID; }
{INT}       { return TOKEN_INT; }
{STRING}    { return TOKEN_STRING; }
"+"         { return TOKEN_PLUS; }
"-"         { return TOKEN_MINUS; }
"*"         { return TOKEN_MULT; }
"/"         { return TOKEN_DIV; }
"="         { return TOKEN_ASSIGN; }
"<"         { return TOKEN_LT; }
"<="        { return TOKEN_LE; }
"~"         { return TOKEN_TILDE; }
"<-"        { return TOKEN_ARROW; }
";"         { return TOKEN_SEMICOLON; }
":"         { return TOKEN_COLON; }
","         { return TOKEN_COMMA; }
"."         { return TOKEN_DOT; }
"("         { return TOKEN_LPAREN; }
")"         { return TOKEN_RPAREN; }
"{"         { return TOKEN_LBRACE; }
"}"         { return TOKEN_RBRACE; }
{WHITESPACE} { /* Игнорировать пробелы */ }
{COMMENT}   { /* Игнорировать комментарии */ }
<<EOF>>     { return TOKEN_EOF; }

%%

void CoolLexer::Error(const char* msg) const
{
    std::cerr << "Lexer error (line " << lineno << "): " << msg << ": lexeme '" << YYText() << "'\n";
    std::exit(YY_EXIT_FAILURE);
}