import 'die.dart';

List<DieSide> generateFaces({required int numberOfFaces, int units = 1}) {
  return List.generate(
    numberOfFaces,
    (value) {
      int increment = (value + 1);
      return DieSide(label: '$increment', value: increment);
    },
  );
}

DieOld d2 = DieOld(
  dieTypeGlyph: Glyph.d2,
  diceName: 'Coin',
  faces: [DieSide(label: 'Heads'), DieSide(label: 'Tails')],
  polyhedralImage: PolyhedralImage.two,
);

DieOld d3 = DieOld(
  dieTypeGlyph: Glyph.d3,
  diceName: 'd3',
  faces: generateFaces(numberOfFaces: 3),
  polyhedralImage: PolyhedralImage.six,
);

DieOld d4 = DieOld(
  dieTypeGlyph: Glyph.d4,
  diceName: 'd4',
  faces: generateFaces(numberOfFaces: 4),
  polyhedralImage: PolyhedralImage.four,
);

DieOld d5 = DieOld(
  dieTypeGlyph: Glyph.d5,
  diceName: 'd5',
  faces: generateFaces(numberOfFaces: 5),
  polyhedralImage: PolyhedralImage.five,
);

DieOld d6 = DieOld(
  dieTypeGlyph: Glyph.d6,
  diceName: 'd6',
  faces: generateFaces(numberOfFaces: 6),
  polyhedralImage: PolyhedralImage.six,
);

DieOld d7 = DieOld(
  dieTypeGlyph: Glyph.d7,
  diceName: 'd7',
  faces: generateFaces(numberOfFaces: 7),
  polyhedralImage: PolyhedralImage.seven,
);

DieOld d8 = DieOld(
  dieTypeGlyph: Glyph.d8,
  diceName: 'd8',
  faces: generateFaces(numberOfFaces: 8),
  polyhedralImage: PolyhedralImage.eight,
);

DieOld d10Units = DieOld(
  dieTypeGlyph: Glyph.d10Units,
  diceName: 'd10 units',
  faces: generateFaces(numberOfFaces: 10),
  polyhedralImage: PolyhedralImage.ten,
);

DieOld d10Tens = DieOld(
  dieTypeGlyph: Glyph.d10Tens,
  diceName: 'd10 tens',
  faces: List.generate(10, (value) {
    int newValue = value * 10;
    return DieSide(
      label: newValue == 0 ? '00' : '$newValue',
      value: newValue,
    );
  }),
  polyhedralImage: PolyhedralImage.ten,
);

DieOld d12 = DieOld(
  dieTypeGlyph: Glyph.d12,
  diceName: 'd12',
  faces: generateFaces(numberOfFaces: 12),
  polyhedralImage: PolyhedralImage.twelve,
);

DieOld d14 = DieOld(
  dieTypeGlyph: Glyph.d14,
  diceName: 'd14',
  faces: generateFaces(numberOfFaces: 14),
  polyhedralImage: PolyhedralImage.fourteen,
);

DieOld d16 = DieOld(
  dieTypeGlyph: Glyph.d16,
  diceName: 'd16',
  faces: generateFaces(numberOfFaces: 16),
  polyhedralImage: PolyhedralImage.sixteen,
);

DieOld d20 = DieOld(
  dieTypeGlyph: Glyph.d20,
  diceName: 'd20',
  faces: generateFaces(numberOfFaces: 20),
  polyhedralImage: PolyhedralImage.twenty,
);

DieOld d24 = DieOld(
  dieTypeGlyph: Glyph.d24,
  diceName: 'd24',
  faces: generateFaces(numberOfFaces: 24),
  polyhedralImage: PolyhedralImage.twentyFour,
);

DieOld d30 = DieOld(
  dieTypeGlyph: Glyph.d30,
  diceName: 'd30',
  faces: generateFaces(numberOfFaces: 30),
  polyhedralImage: PolyhedralImage.thirty,
);

DieOld dF = DieOld(
  dieTypeGlyph: Glyph.fateLogo,
  diceName: 'Fate Die',
  faces: [
    DieSide(label: '+', value: 1, glyph: Glyph.fatePlus),
    DieSide(label: '0', value: 0, glyph: Glyph.fateBlank),
    DieSide(label: '-', value: -1, glyph: Glyph.fateMinus),
  ],
  polyhedralImage: PolyhedralImage.six,
);

DieOld dAtoD = DieOld(
  dieTypeGlyph: Glyph.d2,
  faces: [
    DieSide(label: 'A'),
    DieSide(label: 'B'),
    DieSide(label: 'C'),
    DieSide(label: 'D'),
  ],
  diceName: 'dAtoD',
  polyhedralImage: PolyhedralImage.four,
);
