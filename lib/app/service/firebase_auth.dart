import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService extends GetxService {
  late final FirebaseAuth _firebaseAuth;

  Future<FirebaseAuthService> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    return this;
  }

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  // Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }

  // Future<UserCredential?> signInWithEmailAndPassword(
  //     String email, String password) async {
  //   return await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password);
  // }
}
