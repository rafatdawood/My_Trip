part of 'my_trips_cubit.dart';

@immutable
sealed class MyTripsState {}

final class MyTripsInitial extends MyTripsState {}
final class MyTripsSuccessState extends MyTripsState {}
final class MyTripsFailureState extends MyTripsState {}
