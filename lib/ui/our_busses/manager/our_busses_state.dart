part of 'our_busses_cubit.dart';

@immutable
sealed class OurBussesState {}

final class OurBussesInitial extends OurBussesState {}
final class OurBussesSuccessState extends OurBussesState {}
final class OurBussesFailureState extends OurBussesState {}
