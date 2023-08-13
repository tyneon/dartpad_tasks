const EPS = 1e-6;

void main() {
  final testCases = <(double, double, double)>[
    (8, 0, 0),
    (6, 11, -35),
    (2, -4, -2),
    (1, 3, 5),
    (4, 0, 16),
    (1, -20, 99),
    (2, -6, 4.5),
  ];
  for (final test in testCases) {
    try {
      final (a, b, c) = test;
      final part = solve(a, b, c);
      final double d = b * b - 4 * a * c;
      if (d < 0) {
        if (part == (null, null)) {
          continue;
        }
        _result(
            false, ['Решение находит несуществующие корни', '$test --> $part']);
        return;
      }
      if (part.$1 == null || part.$2 == null) {
        _result(
            false, ['Решение возвращает неожиданный null', '$test --> $part']);
        return;
      }
      final (x1, x2) = (part.$1 as double, part.$2 as double);
      if ((a * x1 * x1 + b * x1 + c).abs() > EPS ||
          (a * x2 * x2 + b * x2 + c).abs() > EPS) {
        _result(false, ['Некорректные корни', '$test --> $part']);
        return;
      }
      if (d > 0 && (x1 - x2).abs() < EPS) {
        _result(false,
            ['Копия одного корня вместо двух корней', '$test --> $part']);
        return;
      }
    } catch (e) {
      _result(false,
          ['Исключение при попытке вызвать функцию solve: ${e.runtimeType}']);
      return;
    }
  }
  _result(true);
}