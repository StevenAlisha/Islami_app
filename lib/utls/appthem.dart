import 'package:flutter/material.dart';
import 'package:islami/utls/appcolors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    canvasColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: AppColors.primaryColor,
      //  type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.WhiteColor,
      unselectedItemColor: AppColors.blackColor,
      // showUnselectedLabels: true,
    ),
    textTheme: TextTheme(),
  );
}
