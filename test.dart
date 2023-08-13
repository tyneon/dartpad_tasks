// Жаль что здесь нельзя импортировать solution.dart
Set<String> juryGetAllBirthdaysForDay(dynamic birthdays, String month, int day) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  return data[month]![day] ?? <String>{};
}

Set<String> juryGetAllBirthdaysForMonth(dynamic birthdays, String month) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  var results = <String>{};
  for (final item in data[month]!.values) {
    results.addAll(item);
  }
  return results;
}

void main() {
  const _birthdays = {
    "Jan": {
      10: {"Anastasia"},
      15: {"Anton"},
    },
    "Feb": {
      4: {"Alexei"},
      22: {"Nancy"},
    },
    "Mar": {
      12: {"Val"},
    },
    "Apr": {
      28: {"Nicola"},
      25: {"Sergei"},
    },
    "May": {
      8: {"Margo"},
      10: {"Alex"},
      29: {"Russ"},
    },
    "Jun": {
      24: {"Nik"},
      25: {"Kira", "Sandra"},
    },
    "Jul": {
      14: {"Love"},
      19: {"Dmytro"},
      24: {"Gleb"},
    },
    "Aug": {
      1: {"Elija"},
      19: {"Ty", "Lewis"},
      28: {"Tim"},
    },
    "Sep": {
      17: {"Daria"},
    },
    "Oct": {
      16: {"Miguel"},
      23: {"Halina"},
    },
    "Nov": {},
    "Dec": {
      1: {"Svyat"},
      18: {"Marina"},
    },
  };
  final testCasesDay = <(String, int)>[
    ("Jan", 15),
    ("Jan", 13),
    ("Aug", 19),
    ("Nov", 1),
    ("Dec", 1),
    ("Jun", 25),
    ("May", 29),
    ("May", 28),
    ("Feb", 30),
  ];
  for (final test in testCasesDay) {
    try {
      final (month, day) = test;
      final part = getAllBirthdaysForDay(_birthdays, month, day);
      final jury = juryGetAllBirthdaysForDay(_birthdays, month, day);
      if (!part.containsAll(jury)) {
        _result(false, [
          'Функция getAllBirthdaysForDay возвращает неверный ответ',
          '$part != $jury'
        ]);
        return;
      }
    } catch (e) {
      _result(false, [
        'Исключение при попытке вызвать функцию getAllBirthdaysForDay: ${e.runtimeType}'
      ]);
      return;
    }
  }
  for (final test in _birthdays.keys) {
    try {
      final part = getAllBirthdaysForMonth(_birthdays, test);
      final jury = juryGetAllBirthdaysForMonth(_birthdays, test);
      if (!part.containsAll(jury)) {
        _result(false, [
          'Функция getAllBirthdaysForMonth возвращает неверный ответ',
          '$part != $jury'
        ]);
        return;
      }
    } catch (e) {
      _result(false, [
        'Исключение при попытке вызвать функцию getAllBirthdaysForMonth: ${e.runtimeType}'
      ]);
      return;
    }
  }
  _result(true);
}
