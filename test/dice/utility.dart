import 'package:untitled/dice/die.dart';

Die d4 = Die(
  diceName: 'd4',
  faces: List.generate(
      4, (value) => DieSide(label: '${value + 1}', value: value + 1)),
);
Die d6 = Die(
  diceName: 'd6',
  faces: List.generate(
      6, (value) => DieSide(label: '${value + 1}', value: value + 1)),
);
Die d8 = Die(
  diceName: 'd8',
  faces: List.generate(
      8, (value) => DieSide(label: '${value + 1}', value: value + 1)),
);
Die dF = Die(diceName: 'Fate Die', faces: [
  DieSide(label: '+', value: 1),
  DieSide(label: '0', value: 0),
  DieSide(label: '-', value: -1),
]);
Die d10Units = Die(
  diceName: 'd10 units',
  faces: List.generate(10, (value) => DieSide(label: '$value', value: value)),
);
Die d10Tens = Die(
  diceName: 'd10 tens',
  faces: List.generate(10, (value) {
    int newValue = value * 10;
    return DieSide(
      label: newValue == 0 ? '00' : '$newValue',
      value: newValue,
    );
  }),
);
Die dAtoD = Die(faces: [
  DieSide(label: 'A'),
  DieSide(label: 'B'),
  DieSide(label: 'C'),
  DieSide(label: 'D'),
], diceName: 'dAtoD');
