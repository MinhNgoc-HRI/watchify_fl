import 'package:get/get.dart';
import 'package:watchify/presentation/common/controllers/auth/auth_controller.dart';
import 'package:watchify/presentation/common/controllers/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(Get.find<AuthController>()));
  }
}
