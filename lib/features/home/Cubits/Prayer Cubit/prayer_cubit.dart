import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/data/repo/home_repo.dart';

import '../../data/models/prayer_time_model.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.homeRepo) : super(PrayerInitial());
  final HomeRepo homeRepo;

  void getPrayerTime({required String date}) async {
    emit(PrayerLoading());
    final res = await homeRepo.getPrayerTime(date: date);
    res.fold((l) => emit(PrayerError(l.errMsg)), (r) => emit(PrayerLoaded(r)));
  }
}
