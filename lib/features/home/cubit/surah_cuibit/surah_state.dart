import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/ayah_model.dart';
import '../../data/models/surah_model.dart';

part 'surah_state.freezed.dart';

@freezed
class SurahState with _$SurahState {
  const factory SurahState.initial() = _SurahInitial;
  const factory SurahState.loading() = _SurahLoading;
  const factory SurahState.loaded(List<SurahModel> surah) = _SurahLoaded;
  const factory SurahState.error(String message) = _SurahError;
  const factory SurahState.ayahLoading() = _AyahLoading;
  const factory SurahState.ayahLoaded(AyahModel ayahs) = _AyahLoaded;
  const factory SurahState.ayahError(String errMsg) = _AyahError;
}
