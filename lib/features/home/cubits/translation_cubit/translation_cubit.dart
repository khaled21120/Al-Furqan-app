import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/translation_model.dart';
import '../../data/repo/home_repo.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit(this.homeRepo) : super(TranslationInitial());
  final HomeRepo homeRepo;

  void getSurahTranslation({required int surahID}) async {
    emit(TranslationLoading());
    final res = await homeRepo.getSurahTranslations(id: surahID);
    res.fold(
      (l) => emit(TranslationError(l.errMsg)),
      (r) => emit(TranslationLoaded(r)),
    );
  }
}
