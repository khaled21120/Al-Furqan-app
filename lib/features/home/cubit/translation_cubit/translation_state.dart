import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/translation_model.dart';

part 'translation_state.freezed.dart';

@freezed
class TranslationState with _$TranslationState {
  const factory TranslationState.initial() = _Initial;
  const factory TranslationState.loading() = _Loading;
  const factory TranslationState.loaded(
    List<SurahTranslationModel> translationList,
  ) = _Loaded;
  const factory TranslationState.error(String errMsg) = _Error;
}
