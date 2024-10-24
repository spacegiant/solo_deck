import 'dart:ui';

import 'package:SoloDeck/dice/polyhedrals/inject_colours_into_SVG.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_thirty.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utils/convert_color_to_hex.dart';

class SVGString {}

SvgPicture diceWidget({
  Color color = const Color(0xFF88636A),
  Color highlightColor = const Color(0xFFCC98A2),
  double width = 60,
}) {
  return SvgPicture.string(
    injectColoursIntoSVG(
        p30, convertColorToHex(color), convertColorToHex(highlightColor)),
    width: width,
    height: width,
  );
}
