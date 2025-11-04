import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.homeRepo) : super(const AzkarState.initial());
  final HomeRepo homeRepo;

  void fetchAzkar({required String azkarType}) async {
    emit(const AzkarState.loading());
    final azkar = await homeRepo.getAzkar(azkarType: azkarType);
    azkar.fold(
      (l) => emit(AzkarState.error(l.errMsg)),
      (r) => emit(AzkarState.loaded(r)),
    );
  }
}
