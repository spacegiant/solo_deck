import 'die.dart';

class DiceRoll {
  late List<Die> thrownDice;
  bool? explode;
  bool? advantage;
  bool? disadvantage;

  DiceRoll({required this.thrownDice});

  DiceResult diceRollResult() {
    List<DieRollResult> results = thrownDice.map((die) => die.roll()).toList();
    Iterable<int?> mapOfValues = results.map((result) => result.value);
    var total = mapOfValues.reduce((a, b) {
      if (a != null && b != null) {
        return a + b;
      } else {
        return a;
      }
    });

    return DiceResult(
      results: results,
      total: total,
    );
  }
}

class DiceResult {
  String sortedBy = 'ascending';
  int? total;
  late List<DieRollResult> results;

  DiceResult({
    required this.results,
    this.total,
  });
}
