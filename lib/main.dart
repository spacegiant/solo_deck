import 'package:SoloDeck/dice/dice_widget.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: Home(),
      title: 'Solo Deck',
      theme: CupertinoThemeData(),
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
              ),
              diceWidget(
                value: 'D4',
                label: 'D4',
                polyhedral: Polyhedrals.poly4,
                nudgePercent: 0.12,
              ),
              diceWidget(
                value: 'D5',
                label: 'D5',
                polyhedral: Polyhedrals.poly5,
                nudgePercent: 0.17,
              ),
              diceWidget(
                value: 'D6',
                label: 'D6',
                polyhedral: Polyhedrals.poly6,
              ),
              diceWidget(
                value: 'D7',
                label: 'D7',
                polyhedral: Polyhedrals.poly7,
              ),
              diceWidget(
                value: 'D8',
                label: 'D8',
                polyhedral: Polyhedrals.poly8,
              ),
              diceWidget(
                value: 'D10',
                label: 'D10',
                polyhedral: Polyhedrals.poly10,
              ),
              diceWidget(
                value: 'D12',
                label: 'D12',
                polyhedral: Polyhedrals.poly12,
              ),
              diceWidget(
                value: 'D14',
                label: 'D14',
                polyhedral: Polyhedrals.poly14,
              ),
              diceWidget(
                value: 'D16',
                label: 'D16',
                polyhedral: Polyhedrals.poly16,
              ),
              diceWidget(
                value: 'D20',
                label: 'D20',
                polyhedral: Polyhedrals.poly20,
              ),
              diceWidget(
                value: 'D24',
                label: 'D24',
                polyhedral: Polyhedrals.poly24,
              ),
              diceWidget(
                value: 'D30',
                label: 'D30',
                polyhedral: Polyhedrals.poly30,
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
