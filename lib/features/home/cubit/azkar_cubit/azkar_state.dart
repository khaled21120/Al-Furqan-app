import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/azkar_model.dart';

part 'azkar_state.freezed.dart';

@freezed
class AzkarState with _$AzkarState {
  const factory AzkarState.initial() = _Initial;
  const factory AzkarState.loading() = _Loading;
  const factory AzkarState.loaded(List<AzkarModel> azkarList) = _Loaded;
  const factory AzkarState.error(String message) = _Error;
}
