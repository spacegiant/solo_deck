import 'package:flutter/cupertino.dart';

CupertinoThemeData baseTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.activeBlue,
    textTheme: CupertinoTextThemeData());

CupertinoThemeData scifiTheme = baseTheme.copyWith(
  scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
);

CupertinoThemeData highFantasyTheme = baseTheme.copyWith(
  scaffoldBackgroundColor: CupertinoColors.activeGreen,
);
