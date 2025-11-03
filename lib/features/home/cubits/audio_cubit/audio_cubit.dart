import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _player = AudioPlayer();
  int? _currentSurahId;
  Duration? _lastPosition;

  AudioCubit() : super(const AudioState.initial()) {
    _listenToPlayerState();
    _player.positionStream.listen((pos) {
      _lastPosition = pos;
    });
  }

  AudioPlayer get player => _player;

  void _listenToPlayerState() {
    _player.playerStateStream.listen((state) {
      switch (state.processingState) {
        case ProcessingState.loading:
        case ProcessingState.buffering:
          emit(const AudioState.loading());
          break;
        case ProcessingState.ready:
          if (_player.playing) {
            emit(const AudioState.playing());
          } else {
            emit(const AudioState.paused());
          }
          break;
        case ProcessingState.completed:
          emit(const AudioState.completed());
          break;
        case ProcessingState.idle:
          emit(const AudioState.stopped());
          break;
      }
    });
  }

  Future<void> loadAndPlay({
    required String url,
    required String surahName,
    required String reciter,
    required int id,
  }) async {
    try {
      if (_currentSurahId == id) {
        if (_lastPosition != null) {
          await _player.seek(_lastPosition!);
        }
        await _player.play();
        return;
      }

      emit(const AudioState.loading());
      _currentSurahId = id;

      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: id.toString(),
            album: surahName,
            title: surahName,
            artist: reciter,
          ),
        ),
      );

      await _player.play();
    } catch (e) {
      emit(AudioState.error(e.toString()));
    }
  }

  Future<void> pause() async => await _player.pause();
  Future<void> stop() async => await _player.stop();
  Future<void> seek(Duration position) async => await _player.seek(position);
  Future<void> resume() async => await _player.play();
}
