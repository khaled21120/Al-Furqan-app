import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';

import '../../data/models/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.homeRepo) : super(AzkarInitial());
  final HomeRepo homeRepo;

  void fetchAzkar({required String azkarType}) async {
    emit(AzkarLoading());
    final azkar = await homeRepo.getAzkar(azkarType: azkarType);
    azkar.fold((l) => emit(AzkarError(l.errMsg)), (r) => emit(AzkarLoaded(r)));
  }
}
