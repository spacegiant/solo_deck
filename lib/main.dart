import 'package:SoloDeck/dice/dice_widget.dart';
import 'package:SoloDeck/themes/themes.dart';
import 'package:flutter/cupertino.dart';

import 'dice/default_dice.dart';

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
            children: defaultDice
                .map(
                  (die) => diceWidget(
                    label: die.roll().label,
                    diceType: die.diceName,
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
