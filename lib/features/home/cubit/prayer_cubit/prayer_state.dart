import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/prayer/prayer_model.dart';

part 'prayer_state.freezed.dart';

@freezed
sealed class PrayerState with _$PrayerState {
  const factory PrayerState.initial() = _PrayerInitial;
  const factory PrayerState.loading() = _PrayerLoading;
  const factory PrayerState.loaded(PrayerModel prayerTime) = _PrayerLoaded;
  const factory PrayerState.error(String errMsg) = _PrayerError;
}

