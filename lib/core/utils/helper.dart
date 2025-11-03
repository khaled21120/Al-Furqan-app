import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/prefs_service.dart';
import 'constants.dart';

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
    // Handle special cases that use islamic.network CDN
    const islamicNetworkReciters = {
      'ar.abdulbasitmujawwad',
      'ar.muhammadsiddiqalminshawimujawwad',
      'ar.yasseraldossari',
    };

    if (islamicNetworkReciters.contains(name)) {
      return 'https://cdn.islamic.network/quran/audio-surah/128/$name/$id.mp3';
    }

    // Handle standard mp3quran.net cases
    final formattedId = id.toString().padLeft(3, '0');
    final server = _getServerForReciter(name);
    return 'http://$server/$name/$formattedId.mp3';
  }

  static String _getServerForReciter(String name) {
    const serverMapping = {
      'maher': 'server12.mp3quran.net',
      'afs': 'server8.mp3quran.net',
      'sds': 'server11.mp3quran.net',
      'tblawi': 'server12.mp3quran.net',
      'lhdan': 'server8.mp3quran.net',
      'husr': 'server13.mp3quran.net',
      'bna': 'server8.mp3quran.net',
      'qtm': 'server6.mp3quran.net',
      's_gmd': 'server7.mp3quran.net',
    };

    if (!serverMapping.containsKey(name)) {
      throw ArgumentError('Unknown reciter name: $name');
    }

    return serverMapping[name]!;
  }

  static String getPrayerTimeEndPoint({
    required double lat,
    required String date,
    required double long,
    required String timeZone,
  }) =>
      'https://api.aladhan.com/v1/timings/$date?latitude=$lat&longitude=$long&method=3&timezone=$timeZone&iso8601=true';

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

  static saveLastReadToPrefs(SurahModel surahModel) async {
    final lastRead = jsonEncode(surahModel.toJson());
    await PrefsService.saveLastRead(lastRead);
  }

  static String removeDiacritics(String input) {
    if (input.isEmpty) return input;

    // Arabic diacritics and marks: harakat, shadda, sukun, maddah, etc.
    const diacriticsPattern =
        r'[\u0610-\u061A\u064B-\u065F\u0670\u06D6-\u06ED\u0640]';

    return input.replaceAll(RegExp(diacriticsPattern), '');
  }

  static String normalizeArabic(String input) {
    if (input.isEmpty) return input;

    // Remove Arabic diacritics (harakat, tashkeel, etc.)
    const diacriticsRegex = r'[\u0610-\u061A\u064B-\u065F\u0670\u06D6-\u06ED]';

    return input
        // Remove diacritics
        .replaceAll(RegExp(diacriticsRegex), '')
        // Normalize common Arabic letter variants
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .replaceAll('ى', 'ي')
        .replaceAll('ئ', 'ي')
        .replaceAll('ؤ', 'و')
        // Convert Arabic digits to English (if needed for number search)
        .replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9')
        // Normalize spacing
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim()
        // Lowercase for consistent search
        .toLowerCase();
  }

  static Future<SurahModel?> getLastReadFromPrefs() async {
    final lastRead = PrefsService.loadLocation(Constants.lastRead);
    if (lastRead != null) {
      return SurahModel.fromJson(jsonDecode(lastRead));
    }
    return null;
  }
}
