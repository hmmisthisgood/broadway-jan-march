import 'package:firebase_app/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit() : super(AuthInitial());

  register({required String email, required String password}) async {
    print("register called");

    emit(AuthLoading());

    try {
      final UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          
      print(userCred.user.toString());

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(AuthError(errorMessage: e.message ?? e.toString()));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
