part of 'prayer_cubit.dart';

sealed class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object> get props => [];
}

final class PrayerInitial extends PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerLoaded extends PrayerState {
  final PrayerTimeModel prayerTime;
  const PrayerLoaded(this.prayerTime);
}

final class PrayerError extends PrayerState {
  final String errMsg;
  const PrayerError(this.errMsg);
}
