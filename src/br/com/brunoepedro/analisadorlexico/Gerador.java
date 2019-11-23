package br.com.brunoepedro.analisadorlexico;

import java.io.File;
import java.nio.file.Paths;

public class Gerador {

    public static void main(String[] args) {

        String pathRaiz = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/br/com/brunoepedro/analisadorlexico/";

        String arquivo = pathRaiz + subPath + "pascal.lex";

        File arquivoLex = new File(arquivo);

        jflex.Main.generate(arquivoLex);

    }
}
