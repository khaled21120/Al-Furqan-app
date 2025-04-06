import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyColors {
  static const Color primary = Color(0xffA44AFF);
  static const Color primaryDark = Color(0xff240F4F);
  static const Color primaryLight = Color(0xff863ED5);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color bg = Color(0xff5e20a0);
  static const Color darkGrey = Color(0xff343434);
  static const Color lightGrey = Color(0xffBBC4CE);
  static const Color grey = Color(0xff8789A3);
  static const Color accent = Color(0xff81D4FA);
  static const Color gradient1 = Color(0xffDF98FA);
  static const Color gradient2 = Color(0xff9055FF);
  static const Color button = Color(0xFF2D9C8B);
  static const Color icons = Color(0xff8789A3);
  static const Color shadow = Color(0x4D000000);
  static const Color cardBG = Color(0xffF5F5F5);
}

ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: MyColors.primary,
    primaryContainer: MyColors.primaryDark,
    secondary: MyColors.primary,
    secondaryContainer: MyColors.primaryLight,
    tertiary: MyColors.primaryLight,
    onTertiary: MyColors.grey,
    surface: MyColors.white,
    error: Colors.redAccent,
    onPrimary: MyColors.white,
    onSecondary: MyColors.shadow,
    onSurface: MyColors.primaryDark,
    onError: MyColors.white,
    onTertiaryContainer: MyColors.white,
    brightness: Brightness.light,
  ),
  cardTheme: CardTheme(
    color: MyColors.cardBG,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  dialogTheme: const DialogTheme(backgroundColor: MyColors.primary),
  scaffoldBackgroundColor: MyColors.white,
  drawerTheme: const DrawerThemeData(backgroundColor: MyColors.white),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.tajawal(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: MyColors.primary,
    ),
    backgroundColor: MyColors.white,
    foregroundColor: MyColors.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: MyColors.button,
      foregroundColor: MyColors.white,
      textStyle: GoogleFonts.tajawal(
        fontSize: 18,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);
