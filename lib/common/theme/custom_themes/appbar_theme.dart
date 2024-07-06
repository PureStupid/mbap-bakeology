import "package:flutter/material.dart";

class TAppBarTheme {
  TAppBarTheme._();

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
      toolbarHeight: 90,
      elevation: 4.0,
      scrolledUnderElevation: 4.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ));

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}
