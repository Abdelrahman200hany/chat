import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> SignIn({required String email, required String password}) async {
    emit(SignInLoading());

    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'invalid-credential') {
        emit(
          SignInFailure(errorMessage: 'wrong password'),
        );
      } else if (ex.code == 'user-not-found') {
        emit(
          SignInFailure(errorMessage: 'user not found'),
        );
      } else if (ex.code == 'invalid-email') {
        emit(
          SignInFailure(errorMessage: 'invalid Email'),
        );
      } else if (ex.code == 'network-request-failed') {
        emit(
          SignInFailure(errorMessage: 'check your network'),
        );
      }
    } catch (e) {
      emit(
        SignInFailure(
            errorMessage: 'sorry there was a problem please tyr later !'),
      );
    }
  }
}
