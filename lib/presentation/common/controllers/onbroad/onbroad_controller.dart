import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBroadController extends GetxController {
  final RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;
  final PageController pageController = PageController(initialPage: 0);
  final List<String> images = [
    'assets/images/splash_1.png',
    'assets/images/splash_2.png',
    'assets/images/splash_3.png',
  ];
  final List<String> title = [
    'Xem hàng triệu video đặc sắc hấp dẫn',
    'Phát sóng trực tiếp các sự kiện giải trí hot',
    'Đăng tải và chia sẻ video mọi lúc mọi nơi'
  ];
  final List<String> desc = [
    'Đa dạng chủ đề Nhạc, Phim, TVShow, Tin Tức, Sao',
    'Hội tụ top streamers, KOLs và giải đấu Esport đỉnh cao',
    'Dễ dàng lưu trữ và chia sẻ video với bạn bè'
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      _currentPage.value = pageController.page!.round();
    });
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
