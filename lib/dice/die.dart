import 'dart:math';
import 'dart:ui';

import 'default_dice.dart';
import 'dice_widget.dart';

var diceBox = <String, List<Die>>{
  'general': [d4, d6, d8, d10Units, d10Tens, d12, d20],
  'zocchi': [d2, d3, d5, d7, d14, d16, d24, d30],
  'other': [dF],
};

var diceCollections = <String, List<Die>>{
  // DEFAULT SETS
  'General': [d4, d6, d8, d10Units, d10Tens, d12, d20],
  'Zochi': [d2, d3, d5, d7, d14, d16, d24, d30],
  // USER DEFINED
  'fate': [dF],
  'walkingDead': [],
  'electricState': [],
  't2000k': [],
  'achtungCthulhu': [],
  'bladerunner': [],
};

enum Glyph {
  // TODO: Create and add the images to the repo
  // TODO: Add property to describe number placement in relation to Glyph if needed

  // general
  blank('blank.svg'),
  skull('skull.svg'),
  d2('d2.svg'),
  d3('d3.svg'),
  d4('d4.svg'),
  d5('d5.svg'),
  d6('d6.svg'),
  d7('d7.svg'),
  d8('d8.svg'),
  d10Units('d10Units.svg'),
  d10Tens('d10Tens.svg'),
  d12('d12.svg'),
  d14('d14.svg'),
  d16('d16.svg'),
  d20('d20.svg'),
  d24('d24.svg'),
  d30('d30.svg'),
  // walking dead
  walkingDeadLogo('walkingDeadLogo.svg'),
  target('target.svg'),
  bloodyHand('bloodyHand.svg'),
  // electric state
  electricStateLogo('electricStateLogo.svg'),
  sadFace('sadFace.svg'),
  maze('maze.svg'),
  // t2k
  t2kLogo('t2kLogo.svg'),
  crossHair('crossHair.svg'),
  twoCrossHair('twoCrossHair.svg'),
  explosion('explosion.svg'),
  bodyHead('bodyHead.svg'),
  bodyChest('bodyChest.svg'),
  bodyArms('bodyArms.svg'),
  bodyLegs('bodyLegs.svg'),
  // achtung cthulhu
  achtungCthulhuLogo('achtungCthulhuLogo.svg'),
  cthulhu('cthulhu.svg'),
  // bladerunner
  bladerunnerLogo('bladerunnerLogo.svg'),
  eye('eye.svg'),
  unicorn('unicorn.svg'),
  // Fate/Fudge
  fateLogo('fateLogo.svg'),
  fatePlus('fatePlus.svg'),
  fateBlank('fateBlank.svg'),
  fateMinus('fateMinus.svg');

  final String image;
  const Glyph(this.image);
}

enum PolyhedralImage {
  // TODO: Create and add the images to the repo
  fallback('fallback.svg'),
  two('two.svg'),
  four('four.svg'),
  five('five.svg'),
  six('six.svg'),
  seven('seven.svg'),
  eight('eight.svg'),
  ten('ten.svg'),
  twelve('twelve.svg'),
  fourteen('fourteen.svg'),
  sixteen('sixteen.svg'),
  twenty('twenty.svg'),
  twentyFour('twentyFour.svg'),
  thirty('thirty.svg');

  final String image;
  const PolyhedralImage(this.image);
}

class Die {
  late String value;
  late String diceName;
  late Polyhedrals polyhedral;
  late Color color;
  bool? isReversed;
  double? nudgePercent;
  List<DieSide> faces;

  Die({
    required this.value,
    required this.diceName,
    required this.polyhedral,
    required this.color,
    this.isReversed,
    this.nudgePercent,
    required this.faces,
  });
}

class DieRollResult {
  String diceName;
  int? value;
  String label;

  DieRollResult({
    required this.diceName,
    this.value,
    required this.label,
  });
}

class DieSide {
  // label needed for a11y
  late String label;
  Glyph? glyph;
  int? value;
  Color overrideTextColour = const Color(0xFF000000);

  DieSide({
    required this.label,
    this.value,
    this.glyph,
  });
}
