import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManger.primaryColor,

    primaryColorLight: ColorManger.lightPrimary,

    primaryColorDark: ColorManger.darkPrimary,

    disabledColor: ColorManger.grey1,

    cardColor: ColorManger.white,
    
  );
}
