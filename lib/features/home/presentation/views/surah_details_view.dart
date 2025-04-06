import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/utils/helper.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'package:quran/features/home/presentation/widgets/details_appbar.dart';
import 'package:quran/features/home/Cubits/Surah%20Cuibit/surah_cubit.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key, required this.ayahModel});
  final SurahModel ayahModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is AyahLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AyahError) {
            return Center(child: Text(state.errMsg));
          } else if (state is AyahLoaded) {
            return Column(
              children: [
                DetailsAppbar(
                  title: ayahModel.name!,
                  engName: ayahModel.englishName!,
                  type: ayahModel.revelationType!,
                  juz: state.ayahs.first.juz!,
                  hizbQuarter: state.ayahs.first.hizbQuarter!,
                  onTap: () {
                    GoRouter.of(context).pushNamed(
                      'surahTranslation',
                      extra: {'id': ayahModel.number, 'title': ayahModel.name},
                    );
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Text.rich(
                      TextSpan(
                        children:
                            state.ayahs.asMap().entries.map((entry) {
                              final index = entry.key;
                              final ayah = entry.value;
                              final number = Helper.convertNumberToArabic(
                                index + 1,
                              );
                              final cleanText = ayah.text!.replaceAll('\n', '');

                              return TextSpan(
                                text: '$cleanText ',
                                style: GoogleFonts.amiri(
                                  fontSize: 22,
                                  height: 2,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                children: [
                                  TextSpan(
                                    text: '\uFD3F$number\uFD3E ',
                                    style: GoogleFonts.amiri(
                                      fontSize: 25,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(1.5, 1.5),
                                          blurRadius: 3,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onSecondary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                      textAlign: TextAlign.justify,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
