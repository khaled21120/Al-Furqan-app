import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/helper.dart';
import '../../../cubit/surah_cuibit/surah_cubit.dart';
import '../../../cubit/surah_cuibit/surah_state.dart';
import 'widgets/details_appbar.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahCubit, SurahState>(
        builder:
            (context, state) => state.maybeWhen(
              orElse: () => const Center(child: Text('No Data Available')),
              ayahLoading:
                  () =>
                      const Center(child: CircularProgressIndicator.adaptive()),
              ayahError: (message) => Center(child: Text(message)),
              ayahLoaded:
                  (surahDetails) => CustomScrollView(
                    slivers: [
                      DetailsSliverAppBar(
                        title: surahDetails.name ?? '',
                        engName: surahDetails.englishName ?? '',
                        type: surahDetails.revelationType ?? '',
                        juz: surahDetails.ayahs?.first.juz ?? 0,
                        onTap:
                            () => GoRouter.of(context).push(
                              '/surahTranslation/${surahDetails.number}',
                              extra: surahDetails.name,
                            ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text.rich(
                            TextSpan(
                              children:
                                  surahDetails.ayahs?.map((ayah) {
                                    final number = Helper.convertNumberToArabic(
                                      ayah.numberInSurah ?? 0,
                                    );
                                    final cleanText = ayah.text!.replaceAll(
                                      '\n',
                                      '',
                                    );

                                    return TextSpan(
                                      text: '$cleanText ',
                                      style: GoogleFonts.amiri(
                                        fontSize: 22,
                                        height: 2,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
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
                  ),
            ),
      ),
    );
  }
}
