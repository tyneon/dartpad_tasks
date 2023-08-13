(bool, List<String>) check(
  dynamic birthdays,
  String month,
  Function participantSolution,
  Function jurySolution,
) {
  try {
    final part = participantSolution(birthdays, month);
    final jury = jurySolution(birthdays, month);
    
    // Тут я использую метод containsAll, который проверяет,
    // все ли объекты второго сета содержатся в первом.
    // Если множество A включает B и B включает A, они совпадают.
    if (!part.containsAll(jury) || !jury.containsAll(part)) {
      return (false, ["$part != $jury"]);
    }
    
    // Используя встренные методы сетов,
    // можно было также проверить, что union этих двух сетов
    // совпадает по размеру с обоими сетами.
    
    // Также можно было указать в начале файла
    // import "package:collection/collection.dart";
    // и использовать SetEquality() для сравнения сетов.
  } catch (e) {
    return (
      false,
      ['Возникло исключение ${e.runtimeType}'],
    );
  }
  return (true, []);
}
