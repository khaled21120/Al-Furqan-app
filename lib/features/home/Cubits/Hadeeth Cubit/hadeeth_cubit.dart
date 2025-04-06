import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/endpoints.dart';
import '../../data/models/hadeeth_categories_model.dart';
import '../../data/models/hadeeth_details_model.dart';
import '../../data/models/hadeeths_model.dart';
import '../../data/repo/home_repo.dart';

part 'hadeeth_state.dart';

class HadeethCubit extends Cubit<HadeethState> {
  HadeethCubit(this.homeRepo) : super(HadeethInitial());
  final HomeRepo homeRepo;

  void getHadeethCategories() async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethCategories(
      endPoint: Endpoints.hadeethCategories,
    );
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethsCATELoaded(hadeethCategorieshList: r)),
    );
  }

  void getHadeeths({required String path}) async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethsByCategory(path: path);
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethsLoaded(hadeethslList: r)),
    );
  }

  void getHadeethDetails({required String path}) async {
    emit(HadeethLoading());
    final res = await homeRepo.getHadeethDetails(path: path);
    res.fold(
      (l) => emit(HadeethError(l.errMsg)),
      (r) => emit(HadeethDetailsLoaded(hadeethDetails: r)),
    );
  }
}
