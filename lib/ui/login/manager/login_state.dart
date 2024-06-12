part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccessState extends LoginState {
  final String massage;

  LoginSuccessState(this.massage);
}
class LoginFailureState extends LoginState {
  final String errorMassage;

  LoginFailureState(this.errorMassage);
}
