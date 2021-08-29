import 'package:flutter/material.dart';
import 'package:popup_dialog_sample/helpers/styles/app_color.dart';
import 'package:popup_dialog_sample/helpers/styles/app_text_style.dart';


class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline6: AppTextStyle.kNormalBlack20,
    headline2: AppTextStyle.kNormalBlack20,
    button: AppTextStyle.kBoldTrinidad26,
    headline4: AppTextStyle.kNormalBlack20,
    headline3: AppTextStyle.kBoldMidnightBue26,
    bodyText2: AppTextStyle.kNormalBlack20,
  );

}

