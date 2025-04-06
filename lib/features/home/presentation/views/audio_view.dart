import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran/core/services/get_it_service.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/core/utils/constants.dart';
import 'package:quran/core/utils/helper.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'package:quran/features/home/presentation/widgets/audio_controls.dart';

import '../widgets/audio_bar.dart';

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
  final _player = AudioPlayer();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      int id = widget.surahModel.number!; // Surah number
      String name = widget.name; // Reciter name
      String url = Helper.getAudioUrl(
        name: widget.endPoint,
        id: id,
      ); // URL for audio file

      // Set the audio source for the player
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: id.toString(),
            album: widget.surahModel.englishName,
            title: widget.surahModel.name ?? "Surah", // Use the Surah name
            artist: name, // Reciter name
          ),
        ),
      );

      // Ensure that the player is ready and then update UI to indicate it's not loading
      setState(() {
        _isLoading = false;
      });

      // Play the audio after it's ready
      await _player.play();
    } catch (e) {
      setState(() {
        _isLoading = false; // Handle loading state
      });
      debugPrint("Audio load error: $e"); // Log error message
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.surahModel.name!,
          style: GoogleFonts.amiri(fontSize: 26, fontWeight: FontWeight.bold),
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
                  if (_isLoading)
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
                    AudioBar(audioPlayer: _player),
                    const SizedBox(height: 30),
                    AudioControls(
                      audioPlayer: _player,
                      dio: getIt<Dio>(),
                      name: widget.name, surahName: widget.surahModel.name!,
                    ),
                  ],
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
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
