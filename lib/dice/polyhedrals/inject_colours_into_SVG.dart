import 'dart:ui';

import 'package:SoloDeck/utils/convert_color_to_hex.dart';

String injectColoursIntoSVG(
  String svgString,
  Color hexColor,
  Color shadowColor,
) {
  String newString = svgString
      .replaceFirst('{{hexColor}}', convertColorToHex(shadowColor))
      .replaceFirst('{{highlightHexColor}}', convertColorToHex(hexColor));
  return newString;
}
