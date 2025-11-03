import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/ayah_model.dart';
import '../../data/models/surah_model.dart';
import '../../data/repo/home_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.homeRepo) : super(SurahInitial());
  final HomeRepo homeRepo;
  void getSurah() async {
    emit(SurahLoading());
    final res = await homeRepo.getSurahs();
    res.fold((l) => emit(SurahError(l.errMsg)), (r) => emit(SurahLoaded(r)));
  }

  void getAyah({required int id}) async {
    emit(AyahLoading());
    final res = await homeRepo.getAyahs(id: id);
    res.fold((l) => emit(AyahError(l.errMsg)), (r) => emit(AyahLoaded(r)));
  }
}
