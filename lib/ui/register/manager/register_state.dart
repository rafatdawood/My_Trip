part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  final String massage;

  RegisterSuccessState(this.massage);
}
class RegisterFailureState extends RegisterState {
  final String errorMassage;

  RegisterFailureState(this.errorMassage);
}
