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



operador = "+"|"*"|"/"|"%" 
digito = 0|[1-9][0-9]* 
letra = [a-zA-Z]+
logico = ">"|"<"|"=="|"<="|">="|"!="
identificador = {letra}+ | ({letra}+{digito}+) 
numero = {digito}+ | "."{digito}+ | {digito}+"."{digito}+
tipo = "var"({identificador}+":")


brancos = [\n|" "|\t|\r]

 

%%

{operador} 		{ return createToken("operador", yytext()); }
{logico} 		{ return createToken("logico", yytext()); }

{brancos} 		{ return createToken("Espaço em branco", yytext()); }


{numero} 		{ return createToken("numero", yytext()); }
{identificador} { return createToken("identificador", yytext()); }
{tipo} 			{ return createToken("tipo", yytext()); }



. { throw new RuntimeException("Caracter inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }