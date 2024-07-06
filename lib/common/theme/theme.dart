import 'package:bakeology/common/theme/custom_themes/appbar_theme.dart';
import 'package:bakeology/common/theme/custom_themes/text_theme.dart';
import 'package:bakeology/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: TColors.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: TColors.primary),
    scaffoldBackgroundColor: TColors.lightBackground,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
