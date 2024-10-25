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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../utils/convert_color_to_hex.dart';

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
  Color highlightColor = const Color(0xFFCC98A2),
  double width = 60,
  Polyhedrals polyhedral = Polyhedrals.poly6,
  double nudgePercent = 0.15,
}) {
  return SizedBox(
    width: width,
    height: width,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.string(
          injectColoursIntoSVG(
            polyhedral.image,
            convertColorToHex(color),
            convertColorToHex(highlightColor),
          ),
          width: width,
          height: width,
        ),
        Positioned(
          top: width * nudgePercent,
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: width * 0.5,
                  shadows: addShadow(color: color)),
            ),
          ),
        ),
      ],
    ),
  );
}

addShadow({
  double width = 1.5,
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
