package br.com.brunoepedro.analisadorlexico;

import java.io.File;
import java.nio.file.Paths;

public class Gerador {

    public static void main(String[] args) {

        String pathRaiz = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/br/com/brunoepedro/analisadorlexico/";

        String file = pathRaiz + subPath + "pascal.lex";

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);

    }
}
