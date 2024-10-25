import 'package:SoloDeck/dice/dice_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                value: '2',
                label: 'd2',
                polyhedral: Polyhedrals.poly2,
              ),
              diceWidget(
                value: '4',
                label: 'd4',
                polyhedral: Polyhedrals.poly4,
                nudgePercent: 0.12,
              ),
              diceWidget(
                value: '5',
                label: 'd5',
                polyhedral: Polyhedrals.poly5,
                nudgePercent: 0.17,
              ),
              diceWidget(
                value: '6',
                label: 'd6',
                polyhedral: Polyhedrals.poly6,
              ),
              diceWidget(
                value: '7',
                label: 'd7',
                polyhedral: Polyhedrals.poly7,
              ),
              diceWidget(
                value: '8',
                label: 'd8',
                polyhedral: Polyhedrals.poly8,
              ),
              diceWidget(
                value: '10',
                label: 'd10',
                polyhedral: Polyhedrals.poly10,
              ),
              diceWidget(
                value: '12',
                label: 'd12',
                polyhedral: Polyhedrals.poly12,
              ),
              diceWidget(
                value: '14',
                label: 'd14',
                polyhedral: Polyhedrals.poly14,
              ),
              diceWidget(
                value: '16',
                label: 'd16',
                polyhedral: Polyhedrals.poly16,
              ),
              diceWidget(
                value: '20',
                label: 'd20',
                polyhedral: Polyhedrals.poly20,
              ),
              diceWidget(
                value: '24',
                label: 'd24',
                polyhedral: Polyhedrals.poly24,
              ),
              diceWidget(
                value: '30',
                label: 'd30',
                polyhedral: Polyhedrals.poly30,
              ),
              diceWidget(
                value: '2',
                label: 'd6',
                polyhedral: Polyhedrals.poly30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
