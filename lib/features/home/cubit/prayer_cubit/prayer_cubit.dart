import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.homeRepo) : super(const PrayerState.initial());
  final HomeRepo homeRepo;

  void getPrayerTime({required String date}) async {
    emit(const PrayerState.loading());
    final res = await homeRepo.getPrayerTime(date: date);
    res.fold(
      (l) => emit(PrayerState.error(l.errMsg)),
      (r) => emit(PrayerState.loaded(r)),
    );
  }
}
