const EPS = 1e-6;

void main() {
  testProgression();
  if (progression.runtimeType.toString().endsWith('=> List<num>') == false) {
    _result(false, ["Функция возвращает некорректный тип данных"]);
    return;
  }

  final List<({int n, num first, num Function(num) func})> tests = [
    (n: 5, first: 1, func: (x) => x + 2),
    (n: 5, first: 2, func: (x) => x * x),
    (n: 11, first: 4.5, func: (x) => x * 3.6),
    (n: 11, first: 65536, func: (x) => x / 2),
  ];

  for (final test in tests) {
    List<num> res = [];
    try {
      final part = progression(n: test.n, first: test.first, func: test.func);
      // Protection from JavaScript compilation error
      if (part is List<num>) {
        res = part;
      }
      if (res.length != test.n) {
        _result(false,
            ["Длина полученной последовательности не совпадает с заданной"]);
        return;
      }
      if (res.first != test.first) {
        _result(false, [
          "Первый элемент полученной последовательности не совпадает с заданным"
        ]);
        return;
      }
      for (int i = 1; i < test.n; i++) {
        if ((res[i] - test.func(part[i - 1])).abs() > EPS) {
          _result(false, [
            "Один или более элементов полученной последовательности некорректны"
          ]);
          return;
        }
      }
    } catch (e) {
      _result(false,
          ["Исключение при попытке вызвать функцию func: ${e.runtimeType}"]);
      return;
    }
  }
  _result(true, []);
}
