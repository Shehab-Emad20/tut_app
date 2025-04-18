// I need to you comment in lines bcuese underdatand
import 'package:flutter/material.dart';
import 'color_manger.dart';
import 'font_manger.dart';
import 'styles_manger.dart';
import 'values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // primary color
    primaryColor: ColorManger.primaryColor,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.lightPrimary,

    // Card Theme
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.grey,
      elevation: AppSize.s4,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManger.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManger.lightPrimary,
      titleTextStyle: getRegularStyle(
        color: ColorManger.white,
        fontSize: FontSize.s16,
      ),
    ),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primaryColor,
      splashColor: ColorManger.lightPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManger.white,
          fontSize: FontSize.s17,
        ),

        backgroundColor: ColorManger.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      displayLarge: getLightStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16,
      ),

      headlineMedium: getRegularStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16,
      ),
      titleMedium: getMediumStyle(
        color: ColorManger.primaryColor,
        fontSize: FontSize.s16,
      ),

      bodyLarge: getRegularStyle(color: ColorManger.grey1),

      bodySmall: getRegularStyle(color: ColorManger.grey),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16,
      ),
      errorStyle: getRegularStyle(color: ColorManger.error),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primaryColor,
          width: AppSize.s1_5,
        ),
      ),
    ),
  );
}
