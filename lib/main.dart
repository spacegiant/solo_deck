import 'package:SoloDeck/dice/dice_widget.dart';
import 'package:SoloDeck/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class DiceConfig {
  late String value;
  late String label;
  late Polyhedrals polyhedral;
  late Color color;
  bool? isReversed;
  double? nudgePercent;

  DiceConfig({
    required this.value,
    required this.label,
    required this.polyhedral,
    required this.color,
    this.isReversed,
    this.nudgePercent,
  });
}

List<DiceConfig> diceConfig = [
  DiceConfig(
    value: 'D2',
    label: 'D2',
    polyhedral: Polyhedrals.poly2,
    color: Color(0xFFFF0000),
  ),
  DiceConfig(
    value: 'D4',
    label: 'D4',
    polyhedral: Polyhedrals.poly4,
    color: Color(0xFFFFA600),
    isReversed: true,
    nudgePercent: 0.1,
  ),
  DiceConfig(
    value: 'D6',
    label: 'D6',
    polyhedral: Polyhedrals.poly6,
    color: Color(0xFFFFED00),
    isReversed: true,
  ),
  DiceConfig(
    value: 'D5',
    label: 'D5',
    polyhedral: Polyhedrals.poly5,
    color: Color(0xFF4DA54A),
  ),
  DiceConfig(
    value: 'D6',
    label: 'D6',
    polyhedral: Polyhedrals.poly6,
    color: Color(0xFF006FFF),
  ),
  DiceConfig(
    value: 'D8',
    label: 'D8',
    polyhedral: Polyhedrals.poly8,
    color: Color(0xFF4000FF),
  ),
  DiceConfig(
    value: 'D10',
    label: 'D10',
    polyhedral: Polyhedrals.poly10,
    color: Color(0xFFC800FF),
  ),
  DiceConfig(
    value: 'D12',
    label: 'D12',
    polyhedral: Polyhedrals.poly12,
    color: Color(0xFFB6B6B6),
  ),
  DiceConfig(
    value: 'D14',
    label: 'D14',
    polyhedral: Polyhedrals.poly14,
    color: Color(0xFF99FF00),
    isReversed: true,
  ),
  DiceConfig(
    value: 'D16',
    label: 'D16',
    polyhedral: Polyhedrals.poly16,
    color: Color(0xFF00FFC4),
    isReversed: true,
  ),
  DiceConfig(
    value: 'D20',
    label: 'D20',
    polyhedral: Polyhedrals.poly20,
    color: Color(0xFF00D9FF),
    isReversed: true,
  ),
  DiceConfig(
    value: 'D24',
    label: 'D24',
    polyhedral: Polyhedrals.poly24,
    color: Color(0xFFE6E6E6),
    isReversed: true,
  ),
  DiceConfig(
    value: 'D30',
    label: 'D30',
    polyhedral: Polyhedrals.poly30,
    color: Color(0xFF5A5A5A),
  ),
];

void main() async {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: const Home(),
      title: 'Solo Deck',
      theme: scifiTheme,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        decoration: TextDecoration.none,
        // fontFamily: 'RussoOne',
        // fontFamily: 'Geo',
      ),
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Wrap(
            // width: 200,
            children: diceConfig
                .map(
                  (die) => diceWidget(
                    value: die.value,
                    label: die.label,
                    polyhedral: die.polyhedral,
                    color: die.color,
                    isReversed: die.isReversed ?? false,
                    nudgePercent: die.nudgePercent,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
