import 'dart:ui';

import 'package:SoloDeck/dice/polyhedrals/inject_colours_into_SVG.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_six.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/convert_color_to_hex.dart';

class SVGString {}

SvgPicture diceWidget({
  Color color = const Color(0xFFFFC0CB),
  Color highlightColor = const Color(0xFFFFFF00),
  double width = 60,
}) {
  return SvgPicture.string(
    injectColoursIntoSVG(
        p6, convertColorToHex(color), convertColorToHex(highlightColor)),
    width: width,
    height: width,
  );
}
