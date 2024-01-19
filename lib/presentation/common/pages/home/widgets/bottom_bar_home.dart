import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

class BottomBarHome extends StatelessWidget implements PreferredSizeWidget {
  const BottomBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      height: 64 + paddingBottom,
      width: double.infinity,
      color: Colors.black.withOpacity(0.8),
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 24,
                  color: Color(0xFFD21F3C),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Color(0xFFD21F3C)),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.blank);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_book,
                  size: 24,
                  color: Color(0xFFB0B0B8),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Manga')
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.blank);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.music_note,
                  size: 24,
                  color: Color(0xFFB0B0B8),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Nhạc')
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.blank);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_rounded,
                  size: 24,
                  color: Color(0xFFB0B0B8),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Yêu thích')
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.blank);
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 24,
                  color: Color(0xFFB0B0B8),
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Tài khoản')
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize {
    final paddingBottom = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .padding
        .bottom;
    return Size.fromHeight(64 + paddingBottom);
  }
}
