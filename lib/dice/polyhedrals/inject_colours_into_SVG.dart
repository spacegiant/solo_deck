String injectColoursIntoSVG(
  String svgString,
  String hexColor,
  String highlightColor,
) {
  String newString = svgString
      .replaceFirst('{{hexColor}}', hexColor)
      .replaceFirst('{{highlightHexColor}}', highlightColor);
  return newString;
}
