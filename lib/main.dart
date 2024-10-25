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
    return const MaterialApp(home: Home());
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
        fontFamily: 'OxygenMono',
      ),
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Row(
            // width: 200,
            children: [
              diceWidget(polyhedral: Polyhedrals.poly12),
              diceWidget(polyhedral: Polyhedrals.poly20),
              diceWidget(polyhedral: Polyhedrals.poly4, nudgePercent: 0.275),
            ],
          ),
        ),
      ),
    );
  }
}
