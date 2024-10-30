import 'dart:ui';

import 'dice_widget.dart';
import 'die.dart';
import 'die_side.dart';

List<DieSide> generateFaces({required int numberOfFaces, int units = 1}) {
  return List.generate(
    numberOfFaces,
    (value) {
      int increment = (value + 1);
      return DieSide(label: '$increment', value: increment);
    },
  );
}

List<Die> defaultDice = [
  Die(
    value: 'Dx',
    diceName: 'Dx',
    polyhedral: Polyhedrals.poly6,
    color: Color(0xFFFF0000),
    faces: [DieSide(label: 'Heads'), DieSide(label: 'Tails')],
  ),
  Die(
    value: 'D2',
    diceName: 'D2',
    polyhedral: Polyhedrals.poly2,
    color: Color(0xFFFF0000),
    faces: [DieSide(label: 'Heads'), DieSide(label: 'Tails')],
  ),
  Die(
    value: '4',
    diceName: 'D4',
    polyhedral: Polyhedrals.poly4,
    color: Color(0xFFFFA600),
    isReversed: true,
    nudgePercent: 0.15,
    faces: generateFaces(numberOfFaces: 4),
  ),
  Die(
    value: 'D5',
    diceName: 'D5',
    polyhedral: Polyhedrals.poly5,
    color: Color(0xFF4DA54A),
    faces: generateFaces(numberOfFaces: 5),
  ),
  Die(
    value: 'D6',
    diceName: 'D6',
    polyhedral: Polyhedrals.poly6,
    color: Color(0xFF006FFF),
    faces: generateFaces(numberOfFaces: 6),
  ),
  Die(
    value: 'D7',
    diceName: 'D7',
    polyhedral: Polyhedrals.poly7,
    color: Color(0xFFFFED00),
    isReversed: true,
    faces: generateFaces(numberOfFaces: 7),
  ),
  Die(
    value: 'D8',
    diceName: 'D8',
    polyhedral: Polyhedrals.poly8,
    color: Color(0xFF4000FF),
    faces: generateFaces(numberOfFaces: 8),
  ),
  Die(
    value: 'D10',
    diceName: 'D10',
    polyhedral: Polyhedrals.poly10,
    color: Color(0xFFC800FF),
    faces: generateFaces(numberOfFaces: 10),
  ),
  Die(
    value: 'D12',
    diceName: 'D12',
    polyhedral: Polyhedrals.poly12,
    color: Color(0xFFB6B6B6),
    faces: generateFaces(numberOfFaces: 12),
  ),
  Die(
    value: 'D14',
    diceName: 'D14',
    polyhedral: Polyhedrals.poly14,
    color: Color(0xFF99FF00),
    isReversed: true,
    faces: generateFaces(numberOfFaces: 14),
  ),
  Die(
    value: 'D16',
    diceName: 'D16',
    polyhedral: Polyhedrals.poly16,
    color: Color(0xFF00FFC4),
    isReversed: true,
    faces: generateFaces(numberOfFaces: 16),
  ),
  Die(
    value: 'D20',
    diceName: 'D20',
    polyhedral: Polyhedrals.poly20,
    color: Color(0xFF00D9FF),
    isReversed: true,
    faces: generateFaces(numberOfFaces: 20),
  ),
  Die(
    value: 'D24',
    diceName: 'D24',
    polyhedral: Polyhedrals.poly24,
    color: Color(0xFFE6E6E6),
    isReversed: true,
    faces: generateFaces(numberOfFaces: 24),
  ),
  Die(
    value: 'D30',
    diceName: 'D30',
    polyhedral: Polyhedrals.poly30,
    color: Color(0xFF5A5A5A),
    faces: generateFaces(numberOfFaces: 30),
  ),
];
