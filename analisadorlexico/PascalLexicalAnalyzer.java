package br.com.brunoepedro.analisadorlexico;

import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;

public class PascalLexicalAnalyzer {

	public static void main(String[] args) throws IOException {

		String pathRaiz = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/br/com/brunoepedro/analisadorlexico/";

		String arquivoPascal = pathRaiz + subPath + "program.pas";

		LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader(arquivoPascal));

		PascalToken token;
		while ((token = lexical.yylex()) != null) {

			System.out.println("[	" + token.value + "	]" + " ==> " + token.name + "	(linha: " + token.line + " - "
					+ "coluna: " + token.column + ")");
		}

	}
}