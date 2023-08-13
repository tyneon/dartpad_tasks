// Функция возвращает всех именинников из заданной структуры
// за заданный день в году
Set<String> getAllBirthdaysForDay(dynamic birthdays, String month, int day) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  return data[month]![day] ?? <String>{};
}

// Функция возвращает именинников из заданной структуры
// за заданный месяц
Set<String> getAllBirthdaysForMonth(dynamic birthdays, String month) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  var results = <String>{};
  for (final item in data[month]!.values) {
    results.addAll(item);
  }
  return results;
}
