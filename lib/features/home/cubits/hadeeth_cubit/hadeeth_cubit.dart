import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/hadeeths_categories_model.dart';
import '../../data/models/hadeeth_details_model.dart';
import '../../data/models/hadeeths_model.dart';
import '../../data/repo/home_repo.dart';

part 'hadeeth_state.dart';

class HadeethCubit extends Cubit<HadeethState> {
  HadeethCubit(this.homeRepo) : super(HadeethInitial());
  final HomeRepo homeRepo;

  void getHadeethCategories() async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethCategories();
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethsCATELoaded(hadeethCategorieshList: r)),
    );
  }

  void getHadeeths({required String id}) async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethsByCategory(id: int.parse(id));
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethsLoaded(hadeethslList: r)),
    );
  }

  void getHadeethDetails({required String id}) async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethDetails(id: int.parse(id));
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethDetailsLoaded(hadeethDetails: r)),
    );
  }
}
