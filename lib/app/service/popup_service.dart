import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupService {
  static void showFeaturePopup() {
    Get.defaultDialog(
        backgroundColor: const Color(0xFF141414),
        confirmTextColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        titlePadding: const EdgeInsets.only(top: 16),
        buttonColor: const Color(0xFFD21F3C),
        textConfirm: 'Đóng',
        onConfirm: () => Get.back(),
        title: 'Thông báo',
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Color(0xFFD21F3C)),
        content: const Text(
          'Tính năng này đang trong quá trình phát triển. Xin lỗi vì sự bất tiện này.',
          textAlign: TextAlign.center,
        ));
  }
}
