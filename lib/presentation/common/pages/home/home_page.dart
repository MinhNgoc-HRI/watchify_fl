import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchify/app/util/screen_util.dart';
import 'package:watchify/presentation/common/controllers/home/home_controller.dart';
import 'package:watchify/presentation/common/pages/home/screen/suggest_screen.dart';
import 'package:watchify/presentation/common/pages/home/widgets/app_bar_home.dart';
import 'package:watchify/presentation/common/pages/home/widgets/bottom_bar_home.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppBarHome(),
      extendBody: true,
      bottomNavigationBar: const BottomBarHome(),
      body: GetX(
        init: controller,
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTabBar(controller),
              IndexedStack(index: controller.selectTab, children: const [
                SuggestScreen(),
                SuggestScreen(),
                SuggestScreen(),
                SuggestScreen()
              ]),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabBar(HomeController controller) {
    return SizedBox(
      height: heightLize(30),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.explore_outlined,
                size: widthLize(24),
                color: Colors.white,
              ),
              SizedBox(
                width: widthLize(8),
              ),
              Text('Khám phá',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeLize(14),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listTab.length,
                itemBuilder: (context, index) {
                  final isSelected = controller.selectTab == index;
                  return InkWell(
                    onTap: () {
                      controller.selectTab = index;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: widthLize(8)),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              bottom: BorderSide(
                                  width: 1,
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent))),
                      child: Center(
                        child: Text(
                          controller.listTab[index],
                          style: TextStyle(
                              fontSize: fontSizeLize(14),
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFFB0B0B8)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
