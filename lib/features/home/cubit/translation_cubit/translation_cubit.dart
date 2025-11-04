import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';
import 'translation_state.dart';


class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit(this.homeRepo) : super(const TranslationState.initial());
  final HomeRepo homeRepo;

  void getSurahTranslation({required int surahID}) async {
    emit(const TranslationState.loading());
    final res = await homeRepo.getSurahTranslations(id: surahID);
    res.fold(
      (l) => emit(TranslationState.error(l.errMsg)),
      (r) => emit(TranslationState.loaded(r)),
    );
  }
}
