import 'dart:ui';

import 'die.dart';

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
