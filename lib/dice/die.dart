import 'dart:math';
import 'dart:ui';

import 'default_dice.dart';

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
  String? id = '${DateTime.now().millisecondsSinceEpoch}';
  String diceName;
  List<DieSide> faces;
  Glyph dieTypeGlyph;
  late PolyhedralImage polyhedralImage = PolyhedralImage.fallback;
  // Users can specify dice of certain colours. E.g. red d6, black d6 and white d6 with different meanings attached to each colour
  late Color? colour = const Color(0xff000000);

  Die({
    this.id,
    required this.diceName,
    required this.faces,
    required this.polyhedralImage,
    required this.dieTypeGlyph,
    this.colour,
  });

  DieRollResult roll() {
    var randomIndex = Random().nextInt(faces.length);
    return DieRollResult(
        diceName: diceName,
        value: faces[randomIndex].value,
        label: faces[randomIndex].label);
  }
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
