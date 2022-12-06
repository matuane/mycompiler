
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java_cup.runtime.Symbol;

public class Main {

    public static void main(String[] args) throws FileNotFoundException, Exception {
        Scanner scanner = new Scanner(new FileReader("entrada2.txt"));

        FileWriter arq = new FileWriter("saida2.txt");
        PrintWriter gravarArq = new PrintWriter(arq);

        Parser parser = new Parser(scanner);
        Object result = parser.parse().value;
        
        System.out.println(result);
        
        Scanner scanner1 = new Scanner(new FileReader("entrada2.txt"));
        Symbol s = scanner1.next_token();
        
        if (result == null) {    
            gravarArq.printf("Análise Sintática realizada com sucesso!\n");
            gravarArq.printf("Análise Léxica:\n Lista de Tokens:\n");
            while (s.sym != Tokens.EOF) {
                gravarArq.printf("<%d, %s, %s>\n", s.sym, s.value, Tokens.terminalNames[s.sym]);
                s = scanner1.next_token();
            }
        }
        
        arq.close();
    }
}
