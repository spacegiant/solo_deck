import 'package:SoloDeck/dice/dice_widget.dart';
import 'package:SoloDeck/themes/themes.dart';
import 'package:flutter/cupertino.dart';

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
        fontFamily: 'Geo',
      ),
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Wrap(
            // width: 200,
            children: [
              diceWidget(
                value: 'D2',
                label: 'D2',
                polyhedral: Polyhedrals.poly2,
                color: Color(0xFFFF0000),
              ),
              diceWidget(
                value: 'D4',
                label: 'D4',
                polyhedral: Polyhedrals.poly4,
                nudgePercent: 0.12,
                color: Color(0xFFDEA61A),
              ),
              diceWidget(
                value: 'D5',
                label: 'D5',
                polyhedral: Polyhedrals.poly5,
                nudgePercent: 0.17,
                color: Color(0xFFFFED00),
              ),
              diceWidget(
                value: 'D6',
                label: 'D6',
                polyhedral: Polyhedrals.poly6,
                color: Color(0xFF4DA54A),
              ),
              diceWidget(
                value: 'D7',
                label: 'D7',
                polyhedral: Polyhedrals.poly7,
                color: Color(0xFF006FFF),
              ),
              diceWidget(
                value: 'D8',
                label: 'D8',
                polyhedral: Polyhedrals.poly8,
                color: Color(0xFF4000FF),
              ),
              diceWidget(
                value: 'D10',
                label: 'D10',
                polyhedral: Polyhedrals.poly10,
                color: Color(0xFFC800FF),
              ),
              diceWidget(
                value: 'D12',
                label: 'D12',
                polyhedral: Polyhedrals.poly12,
                color: Color(0xFFB6B6B6),
              ),
              diceWidget(
                value: 'D14',
                label: 'D14',
                polyhedral: Polyhedrals.poly14,
                color: Color(0xFF99FF00),
              ),
              diceWidget(
                value: 'D16',
                label: 'D16',
                polyhedral: Polyhedrals.poly16,
                color: Color(0xFF00FFC4),
              ),
              diceWidget(
                value: 'D20',
                label: 'D20',
                polyhedral: Polyhedrals.poly20,
                color: Color(0xFF00D9FF),
              ),
              diceWidget(
                value: 'D24',
                label: 'D24',
                polyhedral: Polyhedrals.poly24,
                color: Color(0xFFE6E6E6),
              ),
              diceWidget(
                value: 'D30',
                label: 'D30',
                polyhedral: Polyhedrals.poly30,
                color: Color(0xFF5A5A5A),
              ),
              diceWidget(
                value: 'D2',
                label: 'D6',
                polyhedral: Polyhedrals.poly30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
