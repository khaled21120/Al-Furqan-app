import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/hadeeth_details_model.dart';
import '../../data/models/hadeeths_categories_model.dart';
import '../../data/models/hadeeths_model.dart';

part 'hadeeth_state.freezed.dart';

@freezed
class HadeethState with _$HadeethState {
  const factory HadeethState.initial() = _HadeethInitial;

  const factory HadeethState.loading() = _HadeethLoading;

  const factory HadeethState.error(String errMsg) = _HadeethError;

  const factory HadeethState.loaded(List<HadeethsModel> hadeethslList) =
      _HadeethsLoaded;

  const factory HadeethState.hadeethsCategoriesLoaded(
    List<HadeethsCategoriesModel> hadeethCategorieshList,
  ) = _HadeethsCATELoaded;

  const factory HadeethState.hadeethDetailsLoaded(
    HadeethDetailsModel hadeethDetails,
  ) = _HadeethDetailsLoaded;
}
