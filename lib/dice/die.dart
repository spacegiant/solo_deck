import 'dart:math';
import 'dart:ui';

// TODO: Should any dice roll allow users to reroll some of the dice, just for flexibility?
enum DiceRerollFlag { all, individual, none }

enum Glyph {
  // TODO: Create and add the images to the repo
  // TODO: Add property to describe number placement in relation to Glyph if needed
  blank('blank.svg'),
  skull('skull.svg'),
  // walking dead
  target('target.svg'),
  bloodyHand('bloodyHand.svg'),
  // electric state
  sadFace('sadFace.svg'),
  maze('maze.svg'),
  // t2000k
  crossHair('crossHair.svg'),
  twoCrossHair('twoCrossHair.svg'),
  explosion('explosion.svg'),
  bodyHead('bodyHead.svg'),
  bodyChest('bodyChest.svg'),
  bodyArms('bodyArms.svg'),
  bodyLegs('bodyLegs.svg'),
  // achtung cthulhu
  cthulhu('cthulhu.svg'),
  // bladerunner
  eye('eye.svg'),
  unicorn('unicorn.svg');

  final String image;
  const Glyph(this.image);
}

enum PolyhedralImage {
  // TODO: Create and add the images to the repo
  fallback('fallback.svg'),
  two('two.svg'),
  three('three.svg'),
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
  String id = '${DateTime.now().millisecondsSinceEpoch}';
  String diceName;
  List<DieSide> faces;
  late PolyhedralImage? polyhedralImage = PolyhedralImage.fallback;
  // Users can specify dice of certain colours. E.g. red d6, black d6 and white d6 with different meanings attached to each colour
  late Color colour = const Color(0xff000000);
  DiceRerollFlag? rerollFlag = DiceRerollFlag.none;

  Die({
    required this.diceName,
    required this.faces,
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
  String? glyph;
  int? value;
  Color overrideColour = const Color(0xFFCCCCCC);
  Color overrideTextColour = const Color(0xFF000000);

  DieSide({
    required this.label,
    this.value,
  });
}
