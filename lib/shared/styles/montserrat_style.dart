import 'package:flutter/material.dart';

import '../app_fonts.dart';


TextStyle _montserratTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color textColor,
}) {
  return TextStyle(
      fontFamily: AppFonts.montserratFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor);
}

// to get regular style
TextStyle getRegularStyle({
  required Color textColor,
  double fontSize = FontsSizeManager.s12,
}) {
  return _montserratTextStyle(
    fontSize: fontSize,
    fontWeight: FontsWeightManager.regular,
    textColor: textColor,
  );
}

TextStyle getMediumStyle({
  required Color textColor,
  double fontSize = FontsSizeManager.s12,
}) {
  return _montserratTextStyle(
    fontSize: fontSize,
    fontWeight: FontsWeightManager.medium,
    textColor: textColor,
  );
}

TextStyle getLightStyle({
  required Color textColor,
  double fontSize = FontsSizeManager.s12,
}) {
  return _montserratTextStyle(
    fontSize: fontSize,
    fontWeight: FontsWeightManager.light,
    textColor: textColor,
  );
}

TextStyle getBoldStyle({
  required Color textColor,
  double fontSize = FontsSizeManager.s12,
}) {
  return _montserratTextStyle(
    fontSize: fontSize,
    fontWeight: FontsWeightManager.bold,
    textColor: textColor,
  );
}

TextStyle getSemiBoldStyle({
  required Color textColor,
  double fontSize = FontsSizeManager.s12,
}) {
  return _montserratTextStyle(
    fontSize: fontSize,
    fontWeight: FontsWeightManager.semiBold,
    textColor: textColor,
  );
}
