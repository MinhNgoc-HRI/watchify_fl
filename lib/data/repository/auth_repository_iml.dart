import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:watchify/app/service/firebase_auth.dart';
import 'package:watchify/domain/repository/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  final FirebaseAuthService _firebaseAuthService =
      Get.find<FirebaseAuthService>();

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuthService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthService.firebaseAuth.signOut();
  }

  @override
  Future<void> signInWithPhoneNumber(String phone) async {
    await _firebaseAuthService.firebaseAuth.signInWithPhoneNumber(phone);
  }
}
