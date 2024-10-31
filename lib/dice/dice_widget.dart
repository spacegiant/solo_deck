import 'package:SoloDeck/dice/polyhedrals/inject_colours_into_SVG.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_eight.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_five.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_four.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_fourteen.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_seven.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_six.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_sixteen.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_ten.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_thirty.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_twelve.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_twenty.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_twenty_four.dart';
import 'package:SoloDeck/dice/polyhedrals/polyhedral_two.dart';
import 'package:SoloDeck/utils/change_color_lightness.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utils/convert_color_to_hex.dart';
import 'die.dart';

enum Polyhedrals {
  poly2(p2),
  poly4(p4),
  poly5(p5),
  poly6(p6),
  poly7(p7),
  poly8(p8),
  poly10(p10),
  poly12(p12),
  poly14(p14),
  poly16(p16),
  poly20(p20),
  poly24(p24),
  poly30(p30);

  final String image;
  const Polyhedrals(this.image);
}

Widget diceWidget({
  Color color = const Color(0xFF88636A),
  bool isReversed = false,
  double width = 80,
  Polyhedrals polyhedral = Polyhedrals.poly6,
  double? nudgePercent,
  String? diceType,
  Glyph? glyph,
  required String label,
  bool addTextShadow = false,
}) {
  DiceColorSet colorSet = getDiceColors(
    color: color,
    isReversed: isReversed,
  );

  DiceStyle currentStyle = scifiDiceStyle;

  return Column(
    children: [
      SizedBox(
        width: width,
        height: width,
        child: DefaultTextStyle(
          style: currentStyle.textStyle,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.string(
                injectColoursIntoSVG(
                  polyhedral.image,
                  colorSet.diceColor,
                  colorSet.shadowColor,
                ),
                width: width,
                height: width,
                alignment: Alignment.bottomCenter,
              ),
              Positioned(
                bottom: width * (nudgePercent ?? currentStyle.nudgePercent),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      letterSpacing: currentStyle.letterSpacing,
                      color: colorSet.textColor,
                      fontSize: width * currentStyle.textScale,
                      shadows: addTextShadow
                          ? addShadow(color: colorSet.textShadowColor)
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      if (diceType != null)
        Text(
          diceType,
          style: TextStyle(
            color: colorSet.labelColor,
            fontSize: width * 0.2,
          ),
        ),
    ],
  );
}

addShadow({
  double width = 1,
  Color color = const Color(0xFF4A4141),
}) {
  return [
    Shadow(
        // bottomLeft
        offset: Offset(-width, -width),
        color: color),
    Shadow(
// bottomRight
        offset: Offset(width, -width),
        color: color),
    Shadow(
// topRight
        offset: Offset(width, width),
        color: color),
    Shadow(
// topLeft
        offset: Offset(-width, width),
        color: color),
  ];
}

class DiceColorSet {
  late Color diceColor;
  late Color shadowColor;
  late Color textColor;
  late Color textShadowColor;
  late Color labelColor;

  DiceColorSet({
    required this.diceColor,
    required this.shadowColor,
    required this.textColor,
    required this.textShadowColor,
    required this.labelColor,
  });
}

DiceColorSet getDiceColors({
  required Color color,
  bool isReversed = false,
}) {
  return isReversed
      ? DiceColorSet(
          diceColor: color,
          shadowColor: darken(color, 20),
          textColor: darken(color, 50),
          textShadowColor: lighten(color),
          labelColor: darken(color, 60),
        )
      : DiceColorSet(
          diceColor: color,
          shadowColor: darken(color, 15),
          textColor: lighten(color, 90),
          textShadowColor: darken(color, 40),
          labelColor: darken(color),
        );
}

class DiceStyle {
  TextStyle textStyle;
  double textScale;
  double letterSpacing;
  num nudgePercent;

  DiceStyle({
    required this.textStyle,
    required this.textScale,
    this.letterSpacing = 1.0,
    this.nudgePercent = 0.0,
  });
}

DiceStyle scifiDiceStyle = DiceStyle(
  textScale: 0.5,
  nudgePercent: 0.22,
  letterSpacing: -5,
  textStyle: TextStyle(
    fontFamily: 'Geo',
  ),
);

DiceStyle cyberpunkDiceStyle = DiceStyle(
  textScale: 0.35,
  textStyle: TextStyle(
    fontFamily: 'RussoOne',
  ),
  nudgePercent: 0.25,
);
