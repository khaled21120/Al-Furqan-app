import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_state.freezed.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _Initial;
  const factory AudioState.loading() = _Loading;
  const factory AudioState.playing() = _Playing;
  const factory AudioState.paused() = _Paused;
  const factory AudioState.completed() = _Completed;
  const factory AudioState.stopped() = _Stopped;
  const factory AudioState.downloading() = _Downloading;
  const factory AudioState.error(String message) = _Error;
}
