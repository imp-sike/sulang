class Token {
  final String type;
  final String value;

  Token({required this.type, required this.value});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token && runtimeType == other.runtimeType && type == other.type && value == other.value;

  @override
  int get hashCode => type.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'Token(type: $type, value: $value)';
  }
}
