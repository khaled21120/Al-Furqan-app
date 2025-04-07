// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/helper.dart';

class AudioControls extends StatefulWidget {
  const AudioControls({
    super.key,
    required this.audioPlayer,
    required this.dio,
    required this.name,
    required this.surahName,
  });
  final AudioPlayer audioPlayer;
  final Dio dio;
  final String name, surahName;

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  bool _downloading = false;

  // Request storage permission
  Future<bool> _requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    return status.isGranted;
  }

  // Function to download audio
  Future<void> _downloadAudio() async {
    try {
      setState(() => _downloading = true);

      // Request storage permission
      bool permissionGranted = await _requestPermission();
      if (!permissionGranted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '😢 فشل الحصول على إذن الوصول للتخزين',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            action: SnackBarAction(
              backgroundColor: Theme.of(context).colorScheme.surface,
              textColor: Theme.of(context).colorScheme.onSurface,
              label: 'حاول مرة اخرى',
              onPressed: () async {
                await _downloadAudio();
              },
            ),
          ),
        );
        return;
      }

      final source = widget.audioPlayer.audioSource;
      if (source is! UriAudioSource) {
        return;
      }

      final url = source.uri.toString();
      // Set the path for the system-wide Downloads folder
      final downloadsDir =
          '/storage/emulated/0/Download'; // Path to Downloads folder
      final fileName = '${widget.name}/${widget.surahName}.mp3';
      final filePath =
          '$downloadsDir/$fileName'; // Full file path in Downloads folder

      // Ensure the directory exists
      final directory = Directory(downloadsDir);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Download the file
      await widget.dio.download(url, filePath);

      Helper.showSnackBar(
        context: context,
        message: '🎉 تم التحميل بنجاح',
        title: 'ابدأ في الأستماع الآن',
      );
    } catch (e) {
      Helper.showSnackBar(
        context: context,
        message: '😢 فشل التحميل',
        title: 'حاول مرة أخرى',
      );
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
