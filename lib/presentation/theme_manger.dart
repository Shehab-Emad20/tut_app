import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manger.dart';
import 'package:tut_app/presentation/font_manger.dart';
import 'package:tut_app/presentation/styles_manger.dart';
import 'package:tut_app/presentation/values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
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
    
  );
}
