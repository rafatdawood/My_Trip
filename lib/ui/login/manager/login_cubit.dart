import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../core/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final fireAuth = FirebaseAuth.instance;
  bool valuePassword = false;

  login({required String email, required String password}) {

    fireAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(LoginSuccessState('Welcome'));
      PreferenceUtils.setBool(PrefKeys.loggedIn, true);
      PreferenceUtils.setString(PrefKeys.uid, fireAuth.currentUser!.uid);
    }).catchError((e) {
      print(e.code);
      if (e.code == 'invalid-email') {
        emit(LoginFailureState('Invalid email'));
      } else if (e.code == 'invalid-credential') {
        emit(LoginFailureState('Invalid email or password'));
      } else {emit(LoginFailureState(e.code));}
    });
  }

  toggel() {
    valuePassword = !valuePassword;
    emit(LoginInitial());
  }

}
