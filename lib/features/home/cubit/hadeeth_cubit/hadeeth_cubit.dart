import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';
import 'hadeeth_state.dart';

class HadeethCubit extends Cubit<HadeethState> {
  HadeethCubit(this.homeRepo) : super(const HadeethState.initial());
  final HomeRepo homeRepo;

  void getHadeethCategories() async {
    emit(const HadeethState.loading());
    final res = await homeRepo.getHadeethCategories();
    res.fold(
      (l) => emit(HadeethState.error(l.errMsg)),
      (r) => emit(HadeethState.hadeethsCategoriesLoaded(r)),
    );
  }

  void getHadeeths({required String id}) async {
    emit(const HadeethState.loading());
    final res = await homeRepo.getHadeethsByCategory(id: int.parse(id));
    res.fold(
      (l) => emit(HadeethState.error(l.errMsg)),
      (r) => emit(HadeethState.loaded(r)),
    );
  }

  void getHadeethDetails({required String id}) async {
    emit(const HadeethState.loading());
    final res = await homeRepo.getHadeethDetails(id: int.parse(id));
    res.fold(
      (l) => emit(HadeethState.error(l.errMsg)),
      (r) => emit(HadeethState.hadeethDetailsLoaded(r)),
    );
  }
}
