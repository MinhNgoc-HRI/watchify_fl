import 'package:flutter/material.dart';
import 'package:watchify/app/util/screen_util.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      width: double.infinity,
      height: 64 + paddingTop,
      color: Colors.transparent,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      SizedBox(
                        width: widthLize(8),
                      ),
                      Text(
                        'Watchify',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeLize(20),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              const Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.cast_connected_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.notifications,
                        size: 24,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.white,
                      ),
                    ]),
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize {
    final paddingTop = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .padding
        .top;
    return Size.fromHeight(64 + paddingTop);
  }
}
