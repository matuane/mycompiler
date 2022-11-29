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
delimiter = "'"
variavel = ident (letra+digito)*
ballot = "-"?digito*
separadordigito = ","|"."
coin = "-"?digito+separadordigito+
torf = true|false;
string = demiliter(letra|digito)*delimiter
lineTerminator = \r|\n|\r\n
whiteSpace = {lineTerminator} | [ \t\f]

%%
"+" {return new Symbol (Tokens.SOMA);}
"-" {return new Symbol (Tokens.SUBTRACAO);}
"*" {return new Symbol (Tokens.MULTIPLICACAO);}
"/" {return new Symbol (Tokens.DIVISAO);}
"^" {return new Symbol (Tokens.EXPONENCIAL);}
"@" {return new Symbol (Tokens.RAIZ);}
"#" {return new Symbol (Tokens.RESTO);}
";" {return new Symbol (Tokens.FIMLINHA);}
">" {return new Symbol (Tokens.MAIOR);}
">=" {return new Symbol (Tokens.MAIORIGUAL);}
"<" {return new Symbol (Tokens.MENOR);}
"<=" {return new Symbol (Tokens.MENORIGUAL);}
"&=" {return new Symbol (Tokens.IGUAL);}
"*=*" {return new Symbol (Tokens.DIFERENTE);}
"NOT" {return new Symbol (Tokens.NEGACAO);}
"AND" {return new Symbol (Tokens.AND);}
"OR" {return new Symbol (Tokens.OR);}
"(" {return new Symbol (Tokens.ABREPARENTESE);}
")" {return new Symbol (Tokens.FECHAPARENTESE);}
"{" {return new Symbol (Tokens.ABREBLOCO);}
"}" {return new Symbol (Tokens.FECHABLOCO);}
"try this" {return new Symbol (Tokens.CONDICIONAL);}
"otherwise" {return new Symbol (Tokens.DESVIOCONDICIONAL);}
"init" {return new Symbol(Tokens.INIT); }
"ending" {return new Symbol(Tokens.ENDING); }
"end" {return new Symbol(Tokens.END); }
":" {return new Symbol(Tokens.ATRIBUICAO); }
"listen" {return new Symbol(Tokens.ENTRADA); }
"speak" {return new Symbol(Tokens.SAIDA); }
"until" {return new Symbol(Tokens.UNTIL); }
"for" {return new Symbol(Tokens.FOR); }


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

