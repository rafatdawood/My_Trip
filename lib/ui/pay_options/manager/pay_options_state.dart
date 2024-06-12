part of 'pay_options_cubit.dart';

@immutable
abstract class PayOptionsState {}

class PayOptionsInitial extends PayOptionsState {}
class PayOptionsSuccessState extends PayOptionsState {}
class PayOptionsFailureState extends PayOptionsState {}
class PaymentMethodFailureState extends PayOptionsState {
  final String massage;
  PaymentMethodFailureState(this.massage);
}
class PaymentMethodSuccessState extends PayOptionsState {
  final String massage;
  PaymentMethodSuccessState(this.massage);
}
