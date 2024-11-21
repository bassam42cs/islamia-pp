part of 'radios_cubit.dart';

@immutable
sealed class RadiosState {}

final class RadiosInitial extends RadiosState {}

final class RadiosSuccess extends RadiosState {
  // final List<RadiosModel> radios;
  // RadiosSuccess(this.radios);
}

final class RadiosError extends RadiosState {
  final String error;
  RadiosError(this.error);
}
