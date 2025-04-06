import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran/core/services/prefs_service.dart';
import 'package:quran/core/utils/constants.dart';

import '../../features/home/data/models/surah_model.dart';

abstract class Helper {
  static void showAlert({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) async {
    await showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog.adaptive(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(title),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'اغلاق',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onTap();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'التفسير',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  static String getUrl({required String name, required int id}) =>
      'https://cdn.islamic.network/quran/audio-surah/128/$name/$id.mp3';

  static String getAudioUrl({required String name, required int id}) {
    late String server;

    switch (name) {
      case 'basit_mjwd':
        server = 'server13.mp3quran.net';
        break;
      case 'maher':
        server = 'server12.mp3quran.net';
        break;
      case 'afs':
        server = 'server8.mp3quran.net';
        break;
      case 'sds':
        server = 'server11.mp3quran.net';
        break;
      case 'tblawi':
        server = 'server12.mp3quran.net';
        break;
      case 'lhdan':
        server = 'server8.mp3quran.net';
        break;
      case 'minsh':
        server = 'server10.mp3quran.net';
        break;
      case 'husr':
        server = 'server13.mp3quran.net';
        break;
      case 'bna':
        server = 'server8.mp3quran.net';
        break;
      case 'qtm':
        server = 'server6.mp3quran.net';
        break;
      case 'yasser':
        server = 'server11.mp3quran.net';
        break;
      case 's_gmd':
        server = 'server7.mp3quran.net';
        break;
      default:
        throw Exception('Unknown reciter name: $name');
    }

    final formattedId = id.toString().padLeft(3, '0');
    return 'http://$server/$name/$formattedId.mp3';
  }

  static String getPrayerTimeEndPoint({
    required double lat,
    required String date,
    required double long,
    required String timeZone,
  }) =>
      'https://api.aladhan.com/v1/timings/$date?latitude=$lat&longitude=$long&method=3&timezone=$timeZone';

  static showSnackBar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  static String convertNumberToArabic(int number) {
    const englishToArabic = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    return number
        .toString()
        .split('')
        .map((e) => englishToArabic[e] ?? e)
        .join();
  }

  static String getHadeethsEndPoint({required String path}) =>
      'https://hadeethenc.com/api/v1/hadeeths/list/?language=ar&category_id=$path';

  static String getHadeethDetailsEndPoint({required String path}) =>
      'https://hadeethenc.com/api/v1/hadeeths/one/?language=ar&id=$path';

  static DateTime? parse24HourTime(String time) {
    try {
      // Check if the time is not empty or null
      if (time.isNotEmpty) {
        // Parse the string as a 24-hour time format
        return DateFormat('HH:mm', 'en').parse(time);
      }
    } catch (e) {
      // Handle any parsing errors
    }
    return null; // Return null if parsing fails
  }

  static saveLastReadToPrefs(SurahModel surahModel) async {
    final lastRead = jsonEncode(surahModel.toJson());
    await PrefsService.saveLastRead(lastRead);
  }

  static String removeDiacritics(String input) {
    const diacritics = [
      '\u064B', // Tanween Fath
      '\u064C', // Tanween Damm
      '\u064D', // Tanween Kasr
      '\u064E', // Fatha
      '\u064F', // Damma
      '\u0650', // Kasra
      '\u0651', // Shadda
      '\u0652', // Sukun (السكون)
      '\u0653', // Maddah
      '\u0654', // Hamza Above
      '\u0655', // Hamza Below
      '\u0671', // Hamzah Wasla (ٱ)
    ];

    return input.replaceAll(RegExp('[${diacritics.join()}]'), '');
  }

  static String normalizeArabic(String input) {
    const diacriticsRegex = r'[\u0610-\u061A\u064B-\u065F\u0670\u06D6-\u06ED]';

    return input
        .replaceAll(RegExp(diacriticsRegex), '')
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ى', 'ي')
        .replaceAll('ئ', 'ي')
        .replaceAll(RegExp(r'\s+'), ' ') // normalize multiple spaces to one
        .trim()
        .toLowerCase();
  }

  static String getSurahTrasnlationsEndPoint({required int path}) =>
      'https://quranenc.com/api/v1/translation/sura/arabic_moyassar/$path';

  static Future<SurahModel?> getLastReadFromPrefs() async {
    final lastRead = PrefsService.loadLocation(Constants.lastRead);
    if (lastRead != null) {
      return SurahModel.fromJson(jsonDecode(lastRead));
    }
    return null;
  }
}
