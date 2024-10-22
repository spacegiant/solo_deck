import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/dice/die.dart';

import 'utility.dart';

void main() {
  group('Test Die class', () {
    test('Die receives an ID', () {
      expect(d6.id, isA<String>());
    });

    test('Die can override fallback polyhedral image', () {
      expect(d6.polyhedralImage, PolyhedralImage.fallback);

      d6.polyhedralImage = PolyhedralImage.six;
      expect(d6.polyhedralImage, PolyhedralImage.six);
    });

    test('Die can override default colour', () {
      expect(d6.colour, const Color(0xFF000000));

      d6.colour = const Color(0xFFFFFFFF);
      expect(d6.colour, const Color(0xFFFFFFFF));
    });
  });

  group('Test DieSide class', () {
    test('DieSide takes a label', () {
      DieSide dieSide = DieSide(label: '6');

      expect(dieSide.label, '6');
    });

    test('DieSide takes an optional glyph string', () {
      DieSide dieSide = DieSide(label: '6');
      expect(dieSide.glyph, null);

      dieSide.glyph = Glyph.skull;
      expect(dieSide.glyph, Glyph.skull);
    });

    test('DieSide takes an optional value int', () {
      DieSide dieSide = DieSide(label: '6');
      expect(dieSide.value, null);

      dieSide.value = 6;
      expect(dieSide.value, 6);
    });

    test('DieSide has a default overrideColour that can be overridden', () {
      DieSide dieSide = DieSide(label: '6');
      expect(dieSide.overrideColour, const Color(0xFFCCCCCC));

      dieSide.overrideColour = const Color(0xFFFFFFFF);
      expect(dieSide.overrideColour, const Color(0xFFFFFFFF));
    });

    test('DieSide has a default overrideTextColour that can be overridden', () {
      DieSide dieSide = DieSide(label: '6');
      expect(dieSide.overrideTextColour, const Color(0xFF000000));

      dieSide.overrideTextColour = const Color(0xFFCCCCCC);
      expect(dieSide.overrideTextColour, const Color(0xFFCCCCCC));
    });
  });
}
