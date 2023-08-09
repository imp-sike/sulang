import 'package:sulang/lexer/lexer.dart';
import 'package:sulang/model/token.dart';
import 'package:test/test.dart';

void main() {
  group('Lexer2', () {
    test('Tokenize simple assignment', () {
      final sourceCode = 'x = 5;';
      final lexer = Lexer2(sourceCode);

      final tokens = <Token>[];
      Token token = lexer.getNextToken();
      while (token.type != 'EOF') {
        tokens.add(token);
        token = lexer.getNextToken();
      }


      expect(tokens, [
        Token(type: 'IDENTIFIER', value: 'x'),
        Token(type: 'ASSIGN', value: '='),
        Token(type: 'INTEGER', value: '5'),
        Token(type: 'SEMICOLON', value: ';'),
      ]);
    });

    test('Tokenize if-else statement', () {
      final sourceCode = '''
        if x > 0 {
          print("Positive");
        } else if x == 0 {
          print("Zero");
        } else {
          print("Negative");
        }
      ''';
      final lexer = Lexer2(sourceCode);

      final tokens = <Token>[];
      Token token = lexer.getNextToken();
      while (token.type != 'EOF') {
        tokens.add(token);
        token = lexer.getNextToken();
      }

      expect(tokens, [
        Token(type: 'IF', value: 'if'),
        Token(type: 'IDENTIFIER', value: 'x'),
        Token(type: 'GREATER_THAN', value: '>'),
        Token(type: 'INTEGER', value: '0'),
        Token(type: 'LBRACE', value: '{'),
        Token(type: 'PRINT', value: 'print'),
        Token(type: 'LPAREN', value: '('),
        Token(type: 'STRING', value: 'Positive'),
        Token(type: 'RPAREN', value: ')'),
        Token(type: 'SEMICOLON', value: ';'),
        Token(type: 'RBRACE', value: '}'),
        Token(type: 'ELSE', value: 'else'),
        Token(type: 'IF', value: 'if'),
        Token(type: 'IDENTIFIER', value: 'x'),
        Token(type: 'EQUALS', value: '=='),
        Token(type: 'INTEGER', value: '0'),
        Token(type: 'LBRACE', value: '{'),
        Token(type: 'PRINT', value: 'print'),
        Token(type: 'LPAREN', value: '('),
        Token(type: 'STRING', value: 'Zero'),
        Token(type: 'RPAREN', value: ')'),
        Token(type: 'SEMICOLON', value: ';'),
        Token(type: 'RBRACE', value: '}'),
        Token(type: 'ELSE', value: 'else'),
        Token(type: 'LBRACE', value: '{'),
        Token(type: 'PRINT', value: 'print'),
        Token(type: 'LPAREN', value: '('),
        Token(type: 'STRING', value: 'Negative'),
        Token(type: 'RPAREN', value: ')'),
        Token(type: 'SEMICOLON', value: ';'),
        Token(type: 'RBRACE', value: '}'),
      ]);
    });

    // Add more test cases as needed for different language constructs and scenarios.
  });
}
