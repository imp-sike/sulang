import 'package:sulang/model/token.dart';

class Lexer2 {
  final String sourceCode;
  String currentChar = '';
  int position = 0;

  Lexer2(this.sourceCode) {
    currentChar = sourceCode.isNotEmpty ? sourceCode[0] : '';
  }

  /// increments the position by one and make the currentChar advance.
  void advance() {
    position++;
    if (position < sourceCode.length) {
      currentChar = sourceCode[position];
    } else {
      currentChar = '';
    }
  }

  /// makes it such that any number of spaces is still a single space
  void skipWhitespace() {
    while (currentChar.isNotEmpty && currentChar.trim().isEmpty) {
      advance();
    }
  }

  Token getNextToken() {
    while (currentChar.isNotEmpty) {
      // for white space skipping
      if (currentChar.trim().isEmpty) {
        skipWhitespace();
        continue;
      }
      // for some symbols
      if (currentChar == '=') {
        advance();
        if (currentChar == '=') {
          advance();
          return Token(type: 'EQUALS', value: '==');
        }
        return Token(type: 'ASSIGN', value: '=');
      }

      if (currentChar == '+') {
        advance();
        return Token(type: 'PLUS', value: '+');
      }

      if (currentChar == '-') {
        advance();
        return Token(type: 'MINUS', value: '-');
      }

      if (currentChar == '*') {
        advance();
        return Token(type: 'MUL', value: '*');
      }

      if (currentChar == '/') {
        advance();
        return Token(type: 'DIV', value: '/');
      }

      if (currentChar == '(') {
        advance();
        return Token(type: 'LPAREN', value: '(');
      }

      if (currentChar == ')') {
        advance();
        return Token(type: 'RPAREN', value: ')');
      }

      if (currentChar == '{') {
        advance();
        return Token(type: 'LBRACE', value: '{');
      }

      if (currentChar == '}') {
        advance();
        return Token(type: 'RBRACE', value: '}');
      }

      if (currentChar == ';') {
        advance();
        return Token(type: 'SEMICOLON', value: ';');
      }

      if (currentChar == ':') {
        advance();
        return Token(type: 'COLON', value: ':');
      }

      if (currentChar == ',') {
        advance();
        return Token(type: 'COMMA', value: ',');
      }

      if (currentChar == '>') {
        advance();
        return Token(type: 'GREATER_THAN', value: '>');
      }

      if (currentChar == '<') {
        advance();
        return Token(type: 'LESS_THAN', value: '<');
      }

      // for strings
      if (currentChar == '"') {
        advance();
        String stringValue = '';
        while (currentChar.isNotEmpty && currentChar != '"') {
          stringValue += currentChar;
          advance();
        }
        advance(); // Skip the closing quote
        return Token(type: 'STRING', value: stringValue);
      }

      // for numbers
      if (currentChar.contains(RegExp(r'[0-9]'))) {
        String numberValue = '';
        while (
            currentChar.isNotEmpty && currentChar.contains(RegExp(r'[0-9]'))) {
          numberValue += currentChar;
          advance();
        }
        return Token(type: 'INTEGER', value: numberValue);
      }

      if (currentChar.contains(RegExp(r'[a-zA-Z]'))) {
        String identifier = '';
        while (currentChar.isNotEmpty &&
            currentChar.contains(RegExp(r'[a-zA-Z_0-9]'))) {
          identifier += currentChar;
          advance();
        }
        if (identifier == 'print') {
          return Token(type: 'PRINT', value: 'print');
        } else if (identifier == 'input') {
          return Token(type: 'INPUT', value: 'input');
        } else if (identifier == 'for') {
          return Token(type: 'FOR', value: 'for');
        } else if (identifier == 'while') {
          return Token(type: 'WHILE', value: 'while');
        } else if (identifier == 'if') {
          return Token(type: 'IF', value: 'if');
        } else if (identifier == 'else') {
          return Token(type: 'ELSE', value: 'else');
        } else if (identifier == 'elif') {
          return Token(type: 'ELIF', value: 'elif');
        } else if (identifier == 'func') {
          return Token(type: 'FUNC', value: 'func');
        } else {
          return Token(type: 'IDENTIFIER', value: identifier);
        }
      }
      throw Exception('Invalid character: $currentChar');
    }
    return Token(type: "EOF", value: "");
  }
}
