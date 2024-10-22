import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/dice/dice_roll.dart';

import 'utility.dart';

void main() {
  group('Test DiceRoll.diceRollResult', () {
    test('returns a result on a single dice thrown  with range', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d4]);

      expect(diceRoll.diceRollResult(), isA<DiceRollResult>());
      expect(diceRoll.diceRollResult().total, inInclusiveRange(1, 4));
    });

    test('returns a result on multiple dice thrown', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d4, d6, d8]);

      expect(diceRoll.diceRollResult(), isA<DiceRollResult>());
    });

    test('returns a result on four Fate dice thrown with range', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [dF, dF, dF, dF]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, inInclusiveRange(-4, 4));
    });

    test('returns a result on d10_units thrown with range', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d10Units]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, inInclusiveRange(0, 9));
    });

    test('returns a result on d10_tens thrown with range', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d10Tens]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, inInclusiveRange(0, 90));
    });

    test(
        'returns a d100 result when rolling a d10_tens and d10_units with range',
        () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d10Tens, d10Units]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, inInclusiveRange(0, 99));
    });

    test('dice without values returns a total of Null', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [dAtoD]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, isNull);
    });

    test('dice roll ignores dice without values when creating a total', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d4, d6, dAtoD]);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, isA<int>());
    });

    test('Die add modifier to result', () {
      DiceRoll diceRoll = DiceRoll(thrownDice: [d4], modifier: 10);
      DiceRollResult diceRollResult = diceRoll.diceRollResult();

      expect(diceRollResult.total, greaterThan(4));
    });

    // test('', () {});

    // test('', () {});

    // test('', () {});

    // test('', () {});

    // test('', () {});

    // test('', () {});

    // test('', () {});
  });
}
