part of 'return_available_trip_cubit.dart';

@immutable
abstract class ReturnAvailableTripState {}

class ReturnAvailableTripInitial extends ReturnAvailableTripState {}
class ReturnAvailableTripSuccessState extends ReturnAvailableTripState {}
class ReturnAvailableTripFailureState extends ReturnAvailableTripState {}
