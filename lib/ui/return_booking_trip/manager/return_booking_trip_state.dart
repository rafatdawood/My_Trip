part of 'return_booking_trip_cubit.dart';

@immutable
abstract class ReturnBookingTripState {}

class ReturnBookingTripInitial extends ReturnBookingTripState {}
class ReturnBookingTripSuccessState extends ReturnBookingTripState {}
class ReturnBookingTripFailureState extends ReturnBookingTripState {}
class ReturnBookingTripAddSuccessState extends ReturnBookingTripState {}
class ReturnBookingTripAddFailureState extends ReturnBookingTripState {}
class ReturnBookingTripRemoveSuccessState extends ReturnBookingTripState {}
class ReturnBookingTripRemoveFailureState extends ReturnBookingTripState {}
class ReturnBookingTripHaveSeatsSuccessState extends ReturnBookingTripState {}
class ReturnBookingTripNotCompletedState extends ReturnBookingTripState {
  final String massage;

  ReturnBookingTripNotCompletedState(this.massage);
}
class ReturnBookingTripHaveSeatsFailureState extends ReturnBookingTripState {
  final String massage;

  ReturnBookingTripHaveSeatsFailureState(this.massage);
}

