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

white_space               [ \t\f\b\r]*
digit                     [0-9]
alpha                     [A-Za-z_]
alpha_num                 ({alpha}|{digit})

%x COMMENT
%x STRING

%option warn nodefault batch noyywrap c++
%option yylineno
%option yyclass="CoolLexer"

%%

--.*                      { }
"*)"                      { Error("Unmatched comment ending"); BEGIN(INITIAL); return -1; }
"(*"                      { BEGIN(COMMENT); comment_level = 0; }
<COMMENT>"(*"             { comment_level++; }
<COMMENT><<EOF>>          { Error("EOF in comment"); BEGIN(INITIAL); return -1; }
<COMMENT>\n               { lineno++; }
<COMMENT>.                { }
<COMMENT>"*)"             {
                            if (comment_level == 0) {
                                BEGIN(INITIAL);
                            }
                            comment_level--;
                          }

"\""                      { BEGIN(STRING); yymore(); }
<STRING>\n                { Error("Wrong newline in string"); BEGIN(INITIAL); lineno++; return -1; }
<STRING><<EOF>>           { Error("EOF in string"); BEGIN(INITIAL); return -1; }
<STRING>\0                { Error("Can't use \\0 in strings"); BEGIN(INITIAL); yymore(); return -1; }
<STRING>[^\\\"\n]*        { yymore(); }
<STRING>\\[^\n]           { yymore(); }
<STRING>\\\n              { lineno++; yymore(); }
<STRING>"\""              { BEGIN(INITIAL); EscapeStrLexeme(); return TOKEN_STRING; }

true                 return TOKEN_TRUE;
false                return TOKEN_FALSE;
class                return TOKEN_CLASS;
else                 return TOKEN_ELSE;
in                   return TOKEN_IN;
inherits             return TOKEN_INHERITS;
let                  return TOKEN_LET;
if                   return TOKEN_IF;
fi                   return TOKEN_FI;
loop                 return TOKEN_LOOP;
pool                 return TOKEN_POOL;
then                 return TOKEN_THEN;
while                return TOKEN_WHILE;
case                 return TOKEN_CASE;
esac                 return TOKEN_ESAC;
new                  return TOKEN_NEW;
isvoid               return TOKEN_ISVOID;
of                   return TOKEN_OF;
not                  return TOKEN_NOT;

"<="                      return TOKEN_LEQ;
"<-"                      return TOKEN_ASSIGN;
"=>"                      return TOKEN_ARROW;
"<"                       return TOKEN_LESS;
"="                       return TOKEN_EQUAL;
"@"                       return TOKEN_AT;
"*"                       return TOKEN_MUL;
"/"                       return TOKEN_DIVIDE;
"+"                       return TOKEN_PLUS;
"-"                       return TOKEN_MINUS;
","                       return TOKEN_COMMA;
"."                       return TOKEN_DOT;
";"                       return TOKEN_SEMICOLON;
":"                       return TOKEN_COLON;
"~"                       return TOKEN_LOGICAL_NOT;
"("                       return TOKEN_OPEN_PAREN;
")"                       return TOKEN_CLOSE_PAREN;
"["                       return TOKEN_OPEN_BRACKET;
"]"                       return TOKEN_CLOSE_BRACKET;
"{"                       return TOKEN_OPEN_BRACE;
"}"                       return TOKEN_CLOSE_BRACE;

{digit}+                  return TOKEN_CONST_INT;

[a-z]{alpha_num}*         return TOKEN_IDENTIFIER_OBJECT;
[A-Z]{alpha_num}*         return TOKEN_IDENTIFIER_TYPE;
_{alpha_num}*             return TOKEN_IDENTIFIER_OTHER;

{white_space}             { }
\n                        lineno++;
.                         { BEGIN(INITIAL); Error("Unrecognized character"); return -1; }

%%

void CoolLexer::Error(const char* msg) const {
    std::cerr << "Lexer error (line " << lineno << "): " << msg << ": lexeme '" << YYText() << "'\n";
}

void CoolLexer::EscapeStrLexeme() const {
    const char *input = yytext;
    char *output = yytext;
    input++;
    while (*(input + 1)) {
        if (*input == '\\') {
            input++;
            switch (*input) {
                case 'n': *output++ = '\n'; break;
                case 't': *output++ = '\t'; break;
                case 'f': *output++ = '\f'; break;
                case 'b': *output++ = '\b'; break;
                default: *output++ = *input;
            }
        } else {
            *output++ = *input;
        }
        input++;
    }
    *output = '\0';
}