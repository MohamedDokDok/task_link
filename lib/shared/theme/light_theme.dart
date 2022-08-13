import 'package:flutter/material.dart';

import '../app_color/app_color.dart';
import '../app_fonts.dart';
import '../app_values.dart';
import '../styles/montserrat_style.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: AppColor.primary,
    primaryColorLight: AppColor.lightPrimary,
    primaryColorDark: AppColor.darkPrimary,
    disabledColor: AppColor.grey1,
    cardTheme: CardTheme(
      color: AppColor.white,
      shadowColor: AppColor.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColor.primary,
      elevation: AppSize.s4,
      shadowColor: AppColor.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontsSizeManager.s16,
        textColor: AppColor.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          textColor: AppColor.white,
          fontSize: FontsSizeManager.s17,
        ),
        primary: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColor.grey1,
      buttonColor: AppColor.primary,
      splashColor: AppColor.lightPrimary,
    ),
    textTheme: TextTheme(
      displayLarge: getLightStyle(
        textColor: AppColor.white,
        fontSize: FontsSizeManager.s22,
      ),
      headlineLarge: getSemiBoldStyle(
        textColor: AppColor.darkGrey,
        fontSize: FontsSizeManager.s16,
      ),
      titleMedium: getMediumStyle(
        textColor: AppColor.lightGrey,
        fontSize: FontsSizeManager.s14,
      ),
      bodyLarge: getRegularStyle(
        textColor: AppColor.grey1,
      ),
      bodyMedium: getRegularStyle(
        textColor: AppColor.grey,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularStyle(
        textColor: AppColor.grey,
        fontSize: FontsSizeManager.s14,
      ),
      labelStyle: getMediumStyle(
        textColor: AppColor.grey,
        fontSize: FontsSizeManager.s14,
      ),
      errorStyle: getRegularStyle(
        textColor: AppColor.error,
      ),

      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
    indicatorColor: AppColor.primary,
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.primary, refreshBackgroundColor: AppColor.lightPrimary),
  );
}
