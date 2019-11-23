package br.com.brunoepedro.analisadorlexico;

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
logico = ">"|"<"|"=="|"<="|">="|"!="|"=" 
simboloEspecial = "("|")"|","|";"|":"
palavraReservada = "begin" | "end" | "end." | "if" | "then" | "else" | "while" | "integer" | "real" | "char" | "var"   


brancos = [\n|" "|\t|\r]

 

%%

{operador} 				{ return createToken("operador", yytext()); }
{simboloEspecial} 		{ return createToken("simboloEspecial", yytext()); }
{logico} 				{ return createToken("logico", yytext()); }
{palavraReservada}		{ return createToken("palavraReservada", yytext()); }
{numero} 				{ return createToken("numero", yytext()); }
{identificador} 		{ return createToken("identificador", yytext()); }
{brancos} 				{  /**/ }



. { throw new RuntimeException("Caracter inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }