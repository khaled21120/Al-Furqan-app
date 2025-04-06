import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/endpoints.dart';
import 'package:quran/features/home/data/models/ayah_model.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'package:quran/features/home/data/repo/home_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.homeRepo) : super(SurahInitial());
  final HomeRepo homeRepo;
  void getSurah() async {
    emit(SurahLoading());
    final res = await homeRepo.getSurahs(endPoint: Endpoints.surah);
    res.fold((l) => emit(SurahError(l.errMsg)), (r) => emit(SurahLoaded(r)));
  }

  void getAyah({required int path}) async {
    emit(AyahLoading());
    final res = await homeRepo.getAyahs(endPoint: Endpoints.ayah, path: path);
    res.fold((l) => emit(AyahError(l.errMsg)), (r) => emit(AyahLoaded(r)));
  }
}
