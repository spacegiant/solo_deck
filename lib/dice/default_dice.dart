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

Die d2 = Die(
  dieTypeGlyph: Glyph.d2,
  diceName: 'Coin',
  faces: [DieSide(label: 'Heads'), DieSide(label: 'Tails')],
  polyhedralImage: PolyhedralImage.two,
);

Die d3 = Die(
  dieTypeGlyph: Glyph.d3,
  diceName: 'd3',
  faces: generateFaces(numberOfFaces: 3),
  polyhedralImage: PolyhedralImage.six,
);

Die d4 = Die(
  dieTypeGlyph: Glyph.d4,
  diceName: 'd4',
  faces: generateFaces(numberOfFaces: 4),
  polyhedralImage: PolyhedralImage.four,
);

Die d5 = Die(
  dieTypeGlyph: Glyph.d5,
  diceName: 'd5',
  faces: generateFaces(numberOfFaces: 5),
  polyhedralImage: PolyhedralImage.five,
);

Die d6 = Die(
  dieTypeGlyph: Glyph.d6,
  diceName: 'd6',
  faces: generateFaces(numberOfFaces: 6),
  polyhedralImage: PolyhedralImage.six,
);

Die d7 = Die(
  dieTypeGlyph: Glyph.d7,
  diceName: 'd7',
  faces: generateFaces(numberOfFaces: 7),
  polyhedralImage: PolyhedralImage.seven,
);

Die d8 = Die(
  dieTypeGlyph: Glyph.d8,
  diceName: 'd8',
  faces: generateFaces(numberOfFaces: 8),
  polyhedralImage: PolyhedralImage.eight,
);

Die d10Units = Die(
  dieTypeGlyph: Glyph.d10Units,
  diceName: 'd10 units',
  faces: generateFaces(numberOfFaces: 10),
  polyhedralImage: PolyhedralImage.ten,
);

Die d10Tens = Die(
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

Die d12 = Die(
  dieTypeGlyph: Glyph.d12,
  diceName: 'd12',
  faces: generateFaces(numberOfFaces: 12),
  polyhedralImage: PolyhedralImage.twelve,
);

Die d14 = Die(
  dieTypeGlyph: Glyph.d14,
  diceName: 'd14',
  faces: generateFaces(numberOfFaces: 14),
  polyhedralImage: PolyhedralImage.fourteen,
);

Die d16 = Die(
  dieTypeGlyph: Glyph.d16,
  diceName: 'd16',
  faces: generateFaces(numberOfFaces: 16),
  polyhedralImage: PolyhedralImage.sixteen,
);

Die d20 = Die(
  dieTypeGlyph: Glyph.d20,
  diceName: 'd20',
  faces: generateFaces(numberOfFaces: 20),
  polyhedralImage: PolyhedralImage.twenty,
);

Die d24 = Die(
  dieTypeGlyph: Glyph.d24,
  diceName: 'd24',
  faces: generateFaces(numberOfFaces: 24),
  polyhedralImage: PolyhedralImage.twentyFour,
);

Die d30 = Die(
  dieTypeGlyph: Glyph.d30,
  diceName: 'd30',
  faces: generateFaces(numberOfFaces: 30),
  polyhedralImage: PolyhedralImage.thirty,
);

Die dF = Die(
  dieTypeGlyph: Glyph.fateLogo,
  diceName: 'Fate Die',
  faces: [
    DieSide(label: '+', value: 1, glyph: Glyph.fatePlus),
    DieSide(label: '0', value: 0, glyph: Glyph.fateBlank),
    DieSide(label: '-', value: -1, glyph: Glyph.fateMinus),
  ],
  polyhedralImage: PolyhedralImage.six,
);

Die dAtoD = Die(
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
