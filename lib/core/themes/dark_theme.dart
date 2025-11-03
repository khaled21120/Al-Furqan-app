import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyColors {
  static const Color primary = Color(0xffA44AFF);
  static const Color primaryDark = Color(0xff091945);
  static const Color primaryMid = Color(0xffA44AFF);
  static const Color scaffold = Color(0xff1D2233); // Dark background
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffBEBEBE);
  static const Color darkGrey = Color(0xff343434);
  static const Color accent = Color(0xffA19CC5);
  static const Color darkGradient1 = Color(0xff4A148C); // Deep Purple
  static const Color darkGradient2 = Color(0xff120E43); // Dark Blue
  static const Color button = Color(0xFF00BFA5);
  static const Color icons = Color(0xff8789A3);
  static const Color shadow = Color(0x66FFFFFF);
  static const Color cardBG = Color(0xff323B54);
}

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: MyColors.primary,
    primaryContainer: MyColors.primaryDark,
    secondary: MyColors.white,
    secondaryContainer: MyColors.primaryMid,
    tertiary: MyColors.primaryMid,
    onTertiary: MyColors.accent,
    surface: MyColors.cardBG,
    error: Colors.redAccent,
    onPrimary: MyColors.white,
    onSecondary: MyColors.shadow,
    onSurface: MyColors.white,
    onTertiaryContainer: MyColors.black,
    onError: MyColors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      backgroundColor: MyColors.button,
      foregroundColor: MyColors.white,
      textStyle: GoogleFonts.tajawal(
        fontSize: 18,
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 3,
      side: const BorderSide(color: MyColors.white),
    ),
  ),
  dialogTheme: const DialogThemeData(backgroundColor: MyColors.primary),
  scaffoldBackgroundColor: MyColors.scaffold,
  cardTheme: CardThemeData(
    color: MyColors.cardBG,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: MyColors.scaffold),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.tajawal(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: MyColors.white,
    ),
    backgroundColor: MyColors.scaffold,
    foregroundColor: MyColors.white,
  ),
);
