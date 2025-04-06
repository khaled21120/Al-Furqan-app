part of 'hadeeth_cubit.dart';

sealed class HadeethState extends Equatable {
  const HadeethState();

  @override
  List<Object> get props => [];
}

final class HadeethInitial extends HadeethState {}

final class HadeethLoading extends HadeethState {}

final class HadeethsCATELoaded extends HadeethState {
  final List<HadeethCategorieshModel> hadeethCategorieshList;
  const HadeethsCATELoaded({required this.hadeethCategorieshList});
}

final class HadeethError extends HadeethState {
  final String errMsg;
  const HadeethError(this.errMsg);
}

final class HadeethsLoaded extends HadeethState {
  final List<HadeethsModel> hadeethslList;
  const HadeethsLoaded({required this.hadeethslList});
}

final class HadeethDetailsLoaded extends HadeethState {
  final HadeethDetailsModel hadeethDetails;
  const HadeethDetailsLoaded({required this.hadeethDetails});
}
