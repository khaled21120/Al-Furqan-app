import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../data/models/surah_model.dart';

class LastReadCubit extends Cubit<SurahModel?> {
  LastReadCubit() : super(null) {
    loadLastRead();
  }

  Future<void> loadLastRead() async {
    final data = await Helper.getLastReadFromPrefs();
    emit(data);
  }
}
