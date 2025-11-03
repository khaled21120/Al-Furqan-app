import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../Cubits/audio_cubit/audio_cubit.dart';
import '../../../Cubits/audio_cubit/audio_state.dart';
import '../../../data/models/surah_model.dart';
import 'widgets/audio_bar.dart';
import 'widgets/audio_controls.dart';

class AudioView extends StatefulWidget {
  const AudioView({
    super.key,
    required this.name,
    required this.surahModel,
    required this.endPoint,
  });
  final String name, endPoint;
  final SurahModel surahModel;

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  late final AudioCubit audioCubit;

  @override
  void initState() {
    super.initState();
    audioCubit = getIt<AudioCubit>();

    final url = Helper.getAudioUrl(
      name: widget.endPoint,
      id: widget.surahModel.number!,
    );

    // Load only if not already playing same surah
    audioCubit.loadAndPlay(
      url: url,
      surahName: widget.surahModel.name ?? 'Surah',
      reciter: widget.name,
      id: widget.surahModel.number!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      bloc: audioCubit,
      builder: (context, state) {
        final player = audioCubit.player;
        final isLoading = state.whenOrNull(loading: () => true) ?? false;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              widget.surahModel.name!,
              style: GoogleFonts.amiri(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              SvgPicture.asset(Constants.splash, fit: BoxFit.cover),

              // Glass overlay
              Container(color: Colors.black.withValues(alpha: .6)),

              // Content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _glassCard(
                        child: Column(
                          children: [
                            Text(
                              widget.surahModel.name!,
                              style: GoogleFonts.amiri(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "عدد الآيات: ${widget.surahModel.numberOfAyahs}",
                              style: MyStyle.title18(
                                context,
                              ).copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (isLoading)
                        const CircularProgressIndicator(color: Colors.white)
                      else ...[
                        _glassCard(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "وَرَتِّلِ ٱلْقُرْءَانَ تَرْتِيلًا ﴿٤﴾",
                                style: GoogleFonts.amiri(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "And recite the Quran with measured recitation. (Al-Muzzammil 73:4)",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 30),
                        AudioBar(audioPlayer: player),
                        const SizedBox(height: 30),
                        AudioControls(
                          audioPlayer: player,
                          dio: getIt(),
                          name: widget.name,
                          surahName: widget.surahModel.name!,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _glassCard({required Widget child, EdgeInsets? padding}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
