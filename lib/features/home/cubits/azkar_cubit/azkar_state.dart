part of 'azkar_cubit.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<AzkarModel> azkarList;
  const AzkarLoaded(this.azkarList);
}

final class AzkarError extends AzkarState {
  final String message;
  const AzkarError(this.message);
}
