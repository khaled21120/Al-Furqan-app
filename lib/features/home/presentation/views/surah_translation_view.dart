import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/features/home/Cubits/Translation%20Cubit/translation_cubit.dart';

import '../../../../core/themes/light_theme.dart';

class SurahTranslationView extends StatelessWidget {
  const SurahTranslationView({super.key, required this.surahName});
  final String surahName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName, style: GoogleFonts.amiri(fontSize: 25)),
      ),
      body: BlocBuilder<TranslationCubit, TranslationState>(
        builder: (context, state) {
          if (state is TranslationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TranslationError) {
            return Center(child: Text(state.message));
          } else if (state is TranslationLoaded) {
            return ListView.builder(
              itemCount: state.translationList.length,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemBuilder: (context, index) {
                final translation = state.translationList[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ayah Number
                        Text(
                          'الآية: ${translation.aya}',
                          style: MyStyle.splash14(context),
                        ),

                        // Arabic Text
                        Text(
                          translation.arabicText!,
                          style: GoogleFonts.amiri(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const Divider(thickness: 1, color: MyColors.lightGrey),

                        // Translation
                        Text(
                          translation.translation!,
                          textAlign: TextAlign.justify,
                          style: MyStyle.title18(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
