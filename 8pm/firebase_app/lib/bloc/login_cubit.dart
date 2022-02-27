import 'package:firebase_app/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // final auth = await googleUser!.authentication;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseException catch (e) {
      emit(AuthError(errorMessage: e.message ?? "Error occurred"));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      print(loginResult.status);
// loginResult.status;
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e);
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
