
Set<String> juryGetAllBirthdaysForMonth(dynamic birthdays, String month) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  if (data[month]!.isEmpty) {
    return <String>{};
  }
  var results = <String>{};
  for (final item in data[month]!.values) {
    results.addAll(item);
  }
  return results;
}

Set<String> wrongGetAllBirthdaysForMonth(dynamic birthdays, String month) {
  final data = birthdays as Map<String, Map<dynamic, dynamic>>;
  if (data[month]!.isEmpty) {
    return <String>{};
  }
  var results = <String>{};
  for (final item in data[month]!.values) {
    results.addAll(item);
  }
  var falseResults = <String>{};
  for (int i = 0; i < results.length; i++) {
    falseResults.add(i.toString());
  }
  return falseResults;
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
    "Sep": {},
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

  for (final test in _birthdays.keys) {
    try {
      var (bool checkResult, List<String> messages) = check(
        _birthdays,
        test,
        juryGetAllBirthdaysForMonth,
        juryGetAllBirthdaysForMonth,
      );
      if (!checkResult) {
        _result(false, [
          "Ваш чекер выдаёт ложноотрицательные вердикты:",
          ...messages,
        ]);
        return;
      }

      if (_birthdays[test]!.isNotEmpty) {

        (checkResult, messages) = check(
          _birthdays,
          test,
          wrongGetAllBirthdaysForMonth,
          juryGetAllBirthdaysForMonth,
        );
        if (checkResult) {
          _result(false, [
            "Ваш чекер выдаёт ложноположительные вердикты",
            ...messages,
          ]);
          return;
        }
        (checkResult, messages) = check(
          _birthdays,
          test,
          () => <String>{},
          juryGetAllBirthdaysForMonth,
        );
        if (checkResult) {
          _result(false, [
            "Ваш чекер считает пустой сет равным непустому?.. :",
            ...messages,
          ]);
          return;
        }
      }
    } catch (e) {
      _result(false,
          ['Исключение при попытке вызвать функцию check: ${e.runtimeType}']);
      return;
    }
  }
  _result(true);
}
