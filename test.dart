void main() {
  final names = [
    "Alice",
    "Bob",
    "Carl",
    "David",
    "Emma",
    "Frank",
    "Gerard",
    "Holly"
  ];
  final tests = <(List<String>, int)>[
    (names, 11),
    (names, 8),
    (names, 3),
    (names, 1),
    ([], 5),
  ];

  for (final (List<String> names, int v) in tests) {
    late List<TestTaker> part;
    try {
      part = getTestTakers(names, v);
    } catch (e) {
      _result(false, [
        "Исключение при попытке вызвать функцию getTestTakers: ${e.runtimeType}"
      ]);
      return;
    }

    if (part.length != names.length) {
      _result(false, ["Некорректная длина возвращаемого списка"]);
      return;
    }
    for (int i = 0; i < part.length; ++i) {
      if (part[i].name != names[i]) {
        _result(false, [
          "Имя в возвращаемом значении не совпадает с именем в списке на той же позиции"
        ]);
        return;
      }
      if (part[i].variant > v || part[i].variant < 0) {
        _result(false, ["Найден некорректный номер варианта"]);
        return;
      }
      if (i > 0 &&
          !(part[i].variant == part[i - 1].variant + 1 ||
              part[i].variant == part[i - 1].variant % v + 1)) {
        _result(false, ["Последовательность назначения вариантов нарушена"]);
        return;
      }
    }
  }
  _result(true, []);
}
