part of 'surah_cubit.dart';

sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class SurahLoaded extends SurahState {
  final List<SurahModel> surah;
  SurahLoaded(this.surah);
}

final class SurahError extends SurahState {
  final String message;
  SurahError(this.message);
}

final class SurahLoading extends SurahState {}

final class AyahLoading extends SurahState {}

final class AyahLoaded extends SurahState {
  final AyahModel ayahs;
  AyahLoaded(this.ayahs);
}

final class AyahError extends SurahState {
  final String errMsg;
  AyahError(this.errMsg);
}
