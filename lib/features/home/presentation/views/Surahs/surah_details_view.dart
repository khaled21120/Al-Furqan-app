import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/helper.dart';
import 'widgets/details_appbar.dart';
import '../../../Cubits/surah_cuibit/surah_cubit.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});

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
            final surahDetails = state.ayahs;
            final ayahs = state.ayahs.ayahs ?? [];
            return Column(
              children: [
                DetailsAppbar(
                  title: surahDetails.name ?? '',
                  engName: surahDetails.englishName ?? '',
                  type: surahDetails.revelationType ?? '',
                  juz: ayahs.first.juz ?? 0,
                  hizbQuarter: ayahs.first.hizbQuarter ?? 0,
                  onTap: () {
                    GoRouter.of(context).push(
                      '/surahTranslation/${surahDetails.number}',
                      extra: surahDetails.name,
                    );
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Text.rich(
                      TextSpan(
                        children:
                            state.ayahs.ayahs?.map((ayah) {
                              final number = Helper.convertNumberToArabic(
                                ayah.numberInSurah ?? 0,
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
