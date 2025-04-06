import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/audio_model.dart';

class AudioBar extends StatelessWidget {
  const AudioBar({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  Stream<PositionData> get _positionStreamData =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position: position,
          bufferedPosition: bufferedPosition,
          duration: duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionStreamData,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        final progress = positionData?.position ?? Duration.zero;
        final buffered = positionData?.bufferedPosition ?? Duration.zero;
        final total = positionData?.duration ?? Duration.zero;

        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) => audioPlayer.seek(duration),
          barHeight: 8,
          baseBarColor: Colors.grey.shade600,
          bufferedBarColor: Colors.grey.shade400,
          progressBarColor: Theme.of(context).colorScheme.primary,
          thumbColor: Theme.of(context).colorScheme.primary,
          timeLabelTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
