import 'package:get/get.dart';
import 'package:watchify/presentation/common/controllers/auth/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
