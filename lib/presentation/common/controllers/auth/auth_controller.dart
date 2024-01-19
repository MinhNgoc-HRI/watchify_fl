import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:watchify/app/service/firebase_auth.dart';
import 'package:watchify/app/service/loading_service.dart';
import 'package:watchify/app/util/util.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = Get.find<FirebaseAuthService>();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    LoadingService.show();
    try {
      UserCredential userCredential = await _authService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      LOG.d(userCredential);
      EasyLoading.showSuccess('Đăng nhập thành công',
          duration: const Duration(seconds: 2));
      Get.toNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      LOG.d(e);
      EasyLoading.showError('Tài khoản hoặc mật khẩu không đúng',
          duration: const Duration(seconds: 2));
    } finally {
      LoadingService.dismiss();
    }
  }
}
