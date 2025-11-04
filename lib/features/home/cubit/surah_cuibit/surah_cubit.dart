import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.homeRepo) : super(const SurahState.initial());
  final HomeRepo homeRepo;
  void getSurah() async {
    emit(const SurahState.loading());
    final res = await homeRepo.getSurahs();
    res.fold(
      (l) => emit(SurahState.error(l.errMsg)),
      (r) => emit(SurahState.loaded(r)),
    );
  }

  void getAyah({required int id}) async {
    emit(const SurahState.ayahLoading());
    final res = await homeRepo.getAyahs(id: id);
    res.fold(
      (l) => emit(SurahState.ayahError(l.errMsg)),
      (r) => emit(SurahState.ayahLoaded(r)),
    );
  }
}
