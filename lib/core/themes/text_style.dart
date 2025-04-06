import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyStyle {
  static TextStyle title12(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onTertiary,
    );
  }

  static TextStyle title14(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title16(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle title18(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  static TextStyle sebha25(BuildContext context) {
    return GoogleFonts.vt323 (
      fontSize: 40,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );
  }

  static TextStyle splash18(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 18,
      fontWeight: FontWeight.w400,

      color: Theme.of(context).colorScheme.onTertiary,
    );
  }

  static TextStyle splash14(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 14,
      fontWeight: FontWeight.w600,

      color: Theme.of(context).colorScheme.onTertiary,
    );
  }

  static TextStyle title20(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle title25(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  static TextStyle title28(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
