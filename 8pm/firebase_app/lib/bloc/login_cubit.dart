import 'package:firebase_app/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(AuthInitial());

  login({required String email, required String password}) async {
    print("login called");

    emit(AuthLoading());

    try {
      FirebaseAuth.instance.signOut();

      final UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(userCred.toString());

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(AuthError(errorMessage: e.toString()));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
