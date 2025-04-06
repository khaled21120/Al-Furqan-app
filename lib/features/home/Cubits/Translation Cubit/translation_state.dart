part of 'translation_cubit.dart';

sealed class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object> get props => [];
}

final class TranslationInitial extends TranslationState {}

final class TranslationLoading extends TranslationState {}

final class TranslationLoaded extends TranslationState {
  final List<TranslationModel> translationList;
  const TranslationLoaded(this.translationList);
}

final class TranslationError extends TranslationState {
  final String message;
  const TranslationError(this.message);
}
