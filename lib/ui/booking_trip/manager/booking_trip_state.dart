part of 'booking_trip_cubit.dart';

@immutable
abstract class BookingTripState {}

class BookingTripInitial extends BookingTripState {}
class BookingTripSuccessState extends BookingTripState {}
class BookingTripFailureState extends BookingTripState {}
class BookingTripAddSuccessState extends BookingTripState {}
class BookingTripAddFailureState extends BookingTripState {}
class BookingTripRemoveSuccessState extends BookingTripState {}
class BookingTripRemoveFailureState extends BookingTripState {}
class BookingTripHaveSeatsSuccessState extends BookingTripState {}
class BookingTripNotCompletedState extends BookingTripState {
  final String massage;

  BookingTripNotCompletedState(this.massage);
}
class BookingTripHaveSeatsFailureState extends BookingTripState {
  final String massage;

  BookingTripHaveSeatsFailureState(this.massage);
}
