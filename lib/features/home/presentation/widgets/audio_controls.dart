// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/helper.dart';

class AudioControls extends StatefulWidget {
  const AudioControls({
    super.key,
    required this.audioPlayer,
    required this.dio,
  });
  final AudioPlayer audioPlayer;
  final Dio dio;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  bool _downloading = false;

  Future<void> _downloadAudio() async {
    try {
      setState(() => _downloading = true);

      final source = widget.audioPlayer.audioSource;
      if (source is! UriAudioSource) {
        Helper.showSnackBar(context: context, message: "Invalid audio source");
        return;
      }

      final url = source.uri.toString();
      final dir = await getApplicationDocumentsDirectory();
      final fileName = url.split('/').last;
      final filePath = '${dir.path}/$fileName';

      await widget.dio.download(url, filePath);

      Helper.showSnackBar(context: context, message: 'Download completed 🎉');
    } catch (e) {
      Helper.showSnackBar(context: context, message: 'Download failed 😢');
    } finally {
      setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final playing = playerState?.playing ?? false;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _downloading
                  ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : _buildIconButton(
                    icon: FontAwesomeIcons.download,
                    onPressed: _downloadAudio,
                  ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap:
                    playing
                        ? widget.audioPlayer.pause
                        : widget.audioPlayer.play,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Icon(
                    playing ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              _buildIconButton(
                icon: FontAwesomeIcons.backwardStep,
                onPressed: () => widget.audioPlayer.seek(Duration.zero),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.black87, size: 22),
        ),
      ),
    );
  }
}
