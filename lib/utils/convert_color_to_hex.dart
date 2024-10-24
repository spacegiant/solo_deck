import 'dart:ui';

String convertColorToHex(Color color) {
  String red = color.red.toRadixString(16).padLeft(2, '0');
  String green = color.green.toRadixString(16).padLeft(2, '0');
  String blue = color.blue.toRadixString(16).padLeft(2, '0');

  return red + green + blue;
}
