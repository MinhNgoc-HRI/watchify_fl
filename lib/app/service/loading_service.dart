import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingService {
  static void show() {
    EasyLoading.show(
        status: 'loading...',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
