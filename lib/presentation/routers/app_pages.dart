import 'package:get/route_manager.dart';
import 'package:watchify/presentation/common/controllers/home/home_bindings.dart';
import 'package:watchify/presentation/common/controllers/login/login_bindings.dart';
import 'package:watchify/presentation/common/controllers/onbroad/onbroad_binding.dart';
import 'package:watchify/presentation/common/pages/blank/blank_page.dart';
import 'package:watchify/presentation/common/pages/home/home_page.dart';
import 'package:watchify/presentation/common/pages/login/login_page.dart';
import 'package:watchify/presentation/common/pages/onbroad/onbroad_pages.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

abstract class AppPages {
  static final page = [
    GetPage(
        name: Routes.root,
        page: () => const OnbroadPages(),
        binding: OnbroadBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(name: Routes.blank, page: () => const BlankPage())
  ];
}
