import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final fireAuth = FirebaseAuth.instance;
  bool valuePassword = false;

  createAccount(
      {required String name, required String phone, required String email, required String password}) {

    fireAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(RegisterSuccessState('Done'));
    })
        .catchError((e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState('Email already in use'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailureState('Invalid email'));
      } else {
        emit(RegisterFailureState(e.code));

      }
    });
  }
  toggal(){
      valuePassword = !valuePassword;
      emit(RegisterInitial());
  }
}
