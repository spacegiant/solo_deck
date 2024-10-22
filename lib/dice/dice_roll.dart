import 'die.dart';

class DiceRoll {
  late List<Die> thrownDice;
  int modifier;
  bool? explode;
  bool? advantage;
  bool? disadvantage;

  DiceRoll({
    required this.thrownDice,
    this.modifier = 0,
  });

  DiceRollResult diceRollResult() {
    List<DieRollResult> results = thrownDice.map((die) => die.roll()).toList();
    Iterable<int?> mapOfValues = results.map((result) => result.value);
    var total = mapOfValues.reduce((a, b) {
      if (a != null && b != null) {
        return a + b;
      } else {
        return a;
      }
    });

    return DiceRollResult(
      results: results,
      total: total != null ? total + modifier : null,
    );
  }
}

class DiceRollResult {
  String sortedBy = 'ascending';
  int? total;
  late List<DieRollResult> results;

  DiceRollResult({
    required this.results,
    this.total,
  });
}
