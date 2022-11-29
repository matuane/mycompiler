import java_cup.runtime.Symbol;

%%
%cup
%class Scanner
%line
%column
%eofval{
    return new Symbol(Tokens.EOF, new String("Fim do Arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
ident = "_"
variavel = {ident}({letra})({letra}|{digito})*
ballot = "-"?{digito}*
separadordigito = ","|"."
coin = "-"?{digito}+{separadordigito}+
torf = true|false
lineTerminator = \r|\n|\r\n
whiteSpace = {lineTerminator} | [ \t\f]
string = (\")({letra}|{digito}|{whiteSpace})+(\")

%{
      private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
      }
      private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
      }
%}

%%
"+" {return new Symbol (Tokens.SOMA, yyline, yycolumn, yytext());}
"-" {return new Symbol (Tokens.SUBTRACAO, yyline, yycolumn, yytext());}
"*" {return new Symbol (Tokens.MULTIPLICACAO, yyline, yycolumn, yytext());}
"/" {return new Symbol (Tokens.DIVISAO, yyline, yycolumn, yytext());}
"^" {return new Symbol (Tokens.EXPONENCIAL, yyline, yycolumn, yytext());}
"@" {return new Symbol (Tokens.RAIZ, yyline, yycolumn, yytext());}
"#" {return new Symbol (Tokens.RESTO, yyline, yycolumn, yytext());}
";" {return new Symbol (Tokens.FIMLINHA, yyline, yycolumn, yytext());}
">" {return new Symbol (Tokens.MAIOR, yyline, yycolumn, yytext());}
">=" {return new Symbol (Tokens.MAIORIGUAL, yyline, yycolumn, yytext());}
"<" {return new Symbol (Tokens.MENOR, yyline, yycolumn, yytext());}
"<=" {return new Symbol (Tokens.MENORIGUAL, yyline, yycolumn, yytext());}
"&=" {return new Symbol (Tokens.IGUAL, yyline, yycolumn, yytext());}
"*=*" {return new Symbol (Tokens.DIFERENTE, yyline, yycolumn, yytext());}
"NOT" {return new Symbol (Tokens.NEGACAO, yyline, yycolumn, yytext());}
"AND" {return new Symbol (Tokens.AND, yyline, yycolumn, yytext());}
"OR" {return new Symbol (Tokens.OR, yyline, yycolumn, yytext());}
"(" {return new Symbol (Tokens.ABREPARENTESE, yyline, yycolumn, yytext());}
")" {return new Symbol (Tokens.FECHAPARENTESE, yyline, yycolumn, yytext());}
"{" {return new Symbol (Tokens.ABREBLOCO, yyline, yycolumn, yytext());}
"}" {return new Symbol (Tokens.FECHABLOCO, yyline, yycolumn, yytext());}
"try this" {return new Symbol (Tokens.CONDICIONAL, yyline, yycolumn, yytext());}
"otherwise" {return new Symbol (Tokens.DESVIOCONDICIONAL, yyline, yycolumn, yytext());}
"init" {return new Symbol(Tokens.INIT, yyline, yycolumn, yytext()); }
"ending" {return new Symbol(Tokens.ENDING, yyline, yycolumn, yytext()); }
"end" {return new Symbol(Tokens.END, yyline, yycolumn, yytext()); }
":" {return new Symbol(Tokens.ATRIBUICAO, yyline, yycolumn, yytext()); }
"listen" {return new Symbol(Tokens.ENTRADA, yyline, yycolumn, yytext()); }
"speak" {return new Symbol(Tokens.SAIDA, yyline, yycolumn, yytext()); }
"until" {return new Symbol(Tokens.UNTIL, yyline, yycolumn, yytext()); }
"for" {return new Symbol(Tokens.FOR, yyline, yycolumn, yytext()); }


{variavel} {return new Symbol(Tokens.VARIAVEL, yyline, yycolumn, yytext());}
{ballot} {
    return new Symbol (Tokens.BALLOT, yyline, yycolumn, yytext());
}

{coin} {
    return new Symbol (Tokens.COIN, yyline, yycolumn, yytext());
}

{torf} {
    return new Symbol (Tokens.TORF, yyline, yycolumn, yytext());
}

{letra} {
    return new Symbol (Tokens.LETRA, yyline, yycolumn, yytext());
}

{string} {
    return new Symbol (Tokens.STRING, yyline, yycolumn, yytext());
}

/* whitespace */
{whiteSpace} { /* ignore */ }

/* error fallback */
    [^]                              { throw new Error("Illegal character <"+
                                                        yytext()+">"); }