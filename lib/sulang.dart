import 'package:sulang/lexer/lexer.dart';

import 'model/token.dart';

void kMain() {
  var sourceCode = '''
    var x = 5;
    var y = "Hello, world!";
    print(y);
    
    for var i = 0; i < 5; i = i + 1 {
      print(i);
    }
    
    if x > 0 {
      print("Positive");
    } else if x == 0 {
      print("Zero");
    } else {
      print("Negative");
    }
    
    func multiply(a, b) {
      return a * b;
    }
    
    var result = multiply(3, 4);
    print(result);
  ''';

  var lexer = Lexer2(sourceCode);

  Token token = lexer.getNextToken();
  while (token.type != 'EOF') {
    print(token);
    token = lexer.getNextToken();
  }
}
