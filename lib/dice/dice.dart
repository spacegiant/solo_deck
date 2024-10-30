/*
* API
*
* - user passes in a list of dice to roll
* - package returns the dice rolls
* */

import 'die.dart';

/*
*  what values will die sides have?
*  - number 1 to 20, or 10, 20 ... 100
*  - +, - or blank equating to 1, -1 and 0
*
* */

// Allows users to set up what dice collections they use for a specific game/campaign
class DiceBag {
  late List<DiceSet> bagContent;
}

// Used only for grouping dice for user settings. Users can toggle dice collections on/off
class DiceSet {
  late String id;
  late List<DieOld> dice;
}

class DiceWidgetSettings {
  bool? animateRolls = true;
}

// TODO: Do we want automation of the outcome or just the result displayed in a useful way?
// You select your dice, your roll your dice, you review your dice
class DiceChallenge {
  int? targetNumber;
  bool? mustRollOver;
  bool? allowReroll;
}
/*
* d&d = generic dice + modifier with optional dis/advantage
* Savage worlds skill check = roll generic dice + modifier and (optional) a wild card dice, explodes
* Savage worlds damage = roll multiple generic, explodes
* SWD6 dice pool
*
* */

void convertSVGStringToObject() {}

void importFromFile() {}

void saveSVGToLibrary() {}
