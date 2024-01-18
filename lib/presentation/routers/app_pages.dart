import 'package:get/route_manager.dart';
import 'package:watchify/presentation/common/pages/login/login_page.dart';
import 'package:watchify/presentation/common/pages/onbroad/onbroad_pages.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

abstract class AppPages {
  static final page = [
    GetPage(name: Routes.root, page: () => const OnbroadPages()),
    GetPage(name: Routes.login, page: () => const LoginPage())
  ];
}
