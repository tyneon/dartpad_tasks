import "dart:math";

// Возвращаемый тип данных должен поддерживать
// случай, когда мы возвращаем (null, null)
(double?, double?) solve(
  double a,
  double b,
  double c,
) {
  // Дискриминант
  double d = b * b - 4 * a * c;
  // Отрицательный -- нет ответов
  if (d < 0) {
    return (null, null);
  }
  // Равен нулю -- один ответ
  if (d == 0) {
    double x = -b / (2 * a);
    return (x, x);
  }
  // Иначе ответа два
  double x1 = (-b + sqrt(d)) / (2 * a);
  double x2 = (-b - sqrt(d)) / (2 * a);
  return (x1, x2);
}
