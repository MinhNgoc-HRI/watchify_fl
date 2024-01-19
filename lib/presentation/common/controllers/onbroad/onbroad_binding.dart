import 'package:get/get.dart';
import 'package:watchify/presentation/common/controllers/onbroad/onbroad_controller.dart';

class OnbroadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBroadController());
  }
}
