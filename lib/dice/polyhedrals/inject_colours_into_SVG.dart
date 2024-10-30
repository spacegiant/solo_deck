String injectColoursIntoSVG(
  String svgString,
  String hexColor,
  String shadowColor,
) {
  String newString = svgString
      .replaceFirst('{{hexColor}}', shadowColor)
      .replaceFirst('{{highlightHexColor}}', hexColor);
  return newString;
}
