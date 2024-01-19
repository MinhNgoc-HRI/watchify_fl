import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Future<void> signOut();

  Future<void> signInWithPhoneNumber(String phone);
}
