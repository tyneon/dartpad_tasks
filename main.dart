// Допишите модуль чекера для задачи "Дни рождения 1",
// который проверяет правильность функции getAllBirthdaysForMonth.

// Здесь birthdays это та же самая структура,
// month это строка с названием месяца из этой структуры,
// participantSolution это проверяемая функция getAllBirthdaysForMonth,
// написанная участником,
// jurySolution это корректная функция getAllBirthdaysForMonth от жюри.

// Функция check должна возвращать запись,
// первым элементом которой должно быть булевское значение --
// правильный ответ вернула функция участника или нет.
// Второй элемент это список строковых сообщений, содержание которых
// может быть любым.

// Вопрос для себя:
// Сколькими различными способами вы можете сравнить ответы участника и жюри?

(bool, List<String>) check(
  dynamic birthdays,
  String month,
  Function participantSolution,
  Function jurySolution,
) {
  try {
    // ???
  } catch (e) {
    return (
      false,
      ['Возникло исключение ${e.runtimeType}'],
    );
  }
  return (true, []);
}
