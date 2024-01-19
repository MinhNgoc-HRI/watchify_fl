import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:watchify/presentation/common/controllers/auth/auth_bindings.dart';
import 'package:watchify/presentation/routers/app_pages.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: Routes.root,
          getPages: AppPages.page,
          initialBinding: AuthBindings(),
          builder: EasyLoading.init(),
          color: Colors.black,
          theme: ThemeData(
              // useMaterial3: true,
              primaryColor: const Color(0xFFD21F3C),
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(displayColor: Colors.white, bodyColor: Colors.white)),
        );
      },
    );
  }
}
