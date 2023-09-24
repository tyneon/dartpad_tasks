class TestTaker {
  final String name;
  final int variant;
  TestTaker(this.name, this.variant);
}

List<TestTaker> getTestTakers(List<String> names, int maxVariant) => names
    .map((name) => TestTaker(name, names.indexOf(name) % maxVariant + 1))
    .toList();
/* Используем метод map, чтобы применить действие - создание объекта TestTaker -
 * к каждому элементу списка names.
 * 
 * Используем метод indexOf, чтобы получить индекс имени в списке names,
 * и из индекса вычисляем вариант с использовнием остатка от деления.
 * 
 * Используем метод toList, чтобы привести результат к типу List.
 */