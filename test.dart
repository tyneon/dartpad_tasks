int toDecimal(String binary) {
  int result = 0;
  for (int i = 0; i < binary.length; i++) {
    result = result * 2 + ((binary[i] == '1') ? 1 : 0);
  }
  return result;
}

void main() {
  final testCases = <int>[4, 10, 7, 518, 365, 256, 1, 0];
  for (final test in testCases) {
    try {
      final String part = toBinary(test);
      final int back = toDecimal(part);
      if (test != back) {
        _result(false,
            ['Функция выводит что-то не то: $test --> $part --> $back.']);
      }
    } catch (e) {
      _result(false, [
        'Исключение при попытке вызвать функцию toBinary: ${e.runtimeType}'
      ]);
      return;
    }
  }
  _result(true);
}
