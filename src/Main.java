import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws FileNotFoundException, Exception {
//        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
//        System.out.println("Análise Léxica: Lista de Tokens:");
//        Symbol s = scanner.next_token();
//        while (s.sym != Tokens.EOF) {
//            System.out.printf("<%d, %s>\n", s.sym, s.value);
//            s = scanner.next_token();
//        }

        //criando o parser passando o scanner
        Scanner scanner = new Scanner(new FileReader("entrada.txt"));
        Parser parser = new Parser(scanner);
        parser.parse();
    }
}
