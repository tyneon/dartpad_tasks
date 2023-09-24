class TestTaker {
  final String name;
  final int variant;
  TestTaker(this.name, this.variant);
}

List<TestTaker> getTestTakers(List<String> names, int maxVariant) => names
    .map((name) => TestTaker(name, names.indexOf(name) % maxVariant + 1))
    .toList();
