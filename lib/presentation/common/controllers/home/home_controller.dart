import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _selectTab = 0.obs;

  int get selectTab => _selectTab.value;
  set selectTab(int value) => _selectTab.value = value;

  final List<String> _listTab = [
    'Đề suất',
    'Phim lẻ',
    'Phim bộ',
    'Hoạt hình',
    'TV Shows',
  ];
  List<String> get listTab => _listTab;
}
