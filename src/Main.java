import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) throws FileNotFoundException, Exception {
        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
        Symbol s = scanner.next_token();
        
        FileWriter arq = new FileWriter("saida.txt");
        PrintWriter gravarArq = new PrintWriter(arq);
        
        gravarArq.printf("Análise Léxica: Lista de Tokens:");
        while (s.sym != Tokens.EOF) {
            gravarArq.printf("<%d, %s, %s>\n", s.sym, s.value, Tokens.terminalNames[s.sym]);
            s = scanner.next_token();
        }
        
        arq.close();
        
        //criando o parser passando o scanner
//        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
//        Parser parser = new Parser(scanner);
//        parser.parse();
    }
}
