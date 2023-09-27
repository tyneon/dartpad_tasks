List<num> progression({
  int n = 1,
  num first = 1,
  required num Function(num) func,
}) {
  if (n == 1) {
    return [first];
  }
  return [first, ...progression(n: n - 1, first: func(first), func: func)];
}

void testProgression() {
  // Текущее использование функции progression:
  // progression(n: 5, func: (x) => x + 2);

  // Желаемый вид использования функции progression:
  List<num> results = progression(n: 5, func: (x) => x + 2);
  print(results);
}
