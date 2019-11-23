package br.com.brunoepedro.analisadorlexico;

import java_cup.runtime.*;

%%

%{


public PascalToken createToken(String name, String value) {
    return new PascalToken( name, value, yyline, yycolumn);
}

%}

%public
%class LexicalAnalyzer
%type PascalToken
%line
%column




identificador = {letra}+ | ({letra}+{digito}+) 
numero = {digito}+ | "."{digito}+ | {digito}+"."{digito}+
operador = "+"|"*"|"/"|"%" 
digito = 0|[1-9][0-9]* 
letra = [a-zA-Z]+
logico = ">"|"<"|"=="|"<="|">="|"!=" especiais = [(,),:]+
tipo = {identificador}{identificador}":"{numero}

brancos = [\n|" "|\t|\r]

 

%%

{operador} 		{ return createToken("operador", yytext()); }
{tipo} 			{ return createToken("tipo", yytext()); }
{numero} 		{ return createToken("numero", yytext()); }
{identificador} { return createToken("identificador", yytext()); }

{logico} 		{ return createToken("logico", yytext()); }
{tipo} 			{ return createToken("tipo", yytext()); } 
{brancos} 		{  /**/ }



. { throw new RuntimeException("Caracter inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }