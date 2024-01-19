import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchify/presentation/common/controllers/onbroad/onbroad_controller.dart';
import 'package:watchify/presentation/routers/app_routes.dart';

class OnbroadPages extends GetView<OnBroadController> {
  const OnbroadPages({Key? key}) : super(key: key);

  Widget _buildDot(bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isSelected ? 20.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFFFFFF)
            : const Color.fromARGB(40, 255, 255, 255),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  Widget _buildTitle(bool isSelected, String title, String description) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isSelected ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 24,
              ),
              Text(description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white))
            ]),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              backgroundColor: const Color(0xFF141414),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: () {
            Get.toNamed(Routes.login);
          },
          child: const Text(
            'Bắt đầu',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GetX(
        init: controller,
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: controller.images.length,
                    itemBuilder: ((context, index) {
                      return Image.asset(
                        key: ValueKey(index),
                        controller.images[index],
                        fit: BoxFit.contain,
                      );
                    })),
              ),
              const SizedBox(height: 16.0),
              Stack(
                  children: List.generate(
                      controller.title.length,
                      (index) => _buildTitle(index == controller.currentPage,
                          controller.title[index], controller.desc[index]))),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.images.length,
                  (index) {
                    return _buildDot(index == controller.currentPage);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              _buildButton(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          );
        },
      ),
    );
  }
}
