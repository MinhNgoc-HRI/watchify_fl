import 'package:get/get.dart';
import 'package:watchify/presentation/common/controllers/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
