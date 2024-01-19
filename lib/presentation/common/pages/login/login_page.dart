import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:watchify/app/service/popup_service.dart';
import 'package:watchify/app/util/screen_util.dart';
import 'package:watchify/presentation/common/controllers/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  void _showTerm(BuildContext context, String content) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 10;
            if (details.delta.dy > sensitivity ||
                details.delta.dy < -sensitivity) {
              Navigator.of(context).pop();
            }
          },
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Container(
              color: const Color(0xFF141414),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(children: [
                const Text('Điều khoản sử dụng',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: heightLize(16)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          content,
                          style: const TextStyle(
                              color: Color(0xFF141414), fontSize: 14),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Column(
                  children: [
                    Text('Bằng việc đăng nhập, bạn đã đồng ý với',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF656874))),
                    Text('Điều khoản sử dụng của Watchify',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFFFD130)))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      splashColor: Colors.red,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Đồng ý',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }

  void _showPopupRegister(BuildContext context) {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        context: context,
        transitionBuilder: (ctx, animation, secondaryAnimation, child) {
          return SlideTransition(
              position: Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                  .animate(animation),
              child: child);
        },
        pageBuilder: ((ctx, animation, secondaryAnimation) {
          return Dialog(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: heightLize(24), horizontal: widthLize(28)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: const Color(0xFF141414)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Đăng ký  /  Quên mật khẩu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSizeLize(18),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: heightLize(20),
                          ),
                          Text(
                            'Tính năng này hiện tại lười chưa làm:.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontSizeLize(12),
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: heightLize(20),
                          ),
                          Text(
                            'MK gửi 9999',
                            style: TextStyle(
                                fontSize: fontSizeLize(14),
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: heightLize(20),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF272728),
                                        padding: EdgeInsets.symmetric(
                                            vertical: heightLize(10))),
                                    child: Text(
                                      'Để sau',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSizeLize(16),
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                width: widthLize(16),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // AutoRouter.of(context)
                                      //     .navigateNamed('/account_linking');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        padding: EdgeInsets.symmetric(
                                            vertical: heightLize(10))),
                                    child: Text(
                                      'Soạn tin nhắn',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSizeLize(16),
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: GetX(
        init: controller,
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: FormBuilder(
                key: controller.formKey,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        width: widthLize(64),
                        height: widthLize(64),
                      ),
                      SizedBox(
                        height: heightLize(10),
                      ),
                      Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: fontSizeLize(20),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Watchify và trải nghiệm ${controller.isAuthen ? '' : ''}',
                        style: TextStyle(
                            fontSize: fontSizeLize(20),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: heightLize(24),
                              horizontal: widthLize(32)),
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                key: const Key('email'),
                                name: 'email',
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không được để trống'),
                                  FormBuilderValidators.email(
                                      errorText: 'Không đúng định dạng Email')
                                ]),
                                decoration: const InputDecoration(
                                    label: Text('Email'),
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.white,
                                    fillColor: Color(0xFF141414),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0))),
                              ),
                              SizedBox(
                                height: heightLize(16),
                              ),
                              FormBuilderTextField(
                                key: const Key('password'),
                                name: 'password',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Không được để trống'),
                                  FormBuilderValidators.minLength(6,
                                      errorText: 'Mật khẩu quá ngắn')
                                ]),
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                    label: Text('Mật khẩu'),
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.white,
                                    fillColor: Color(0xFF141414),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0))),
                              ),
                              SizedBox(
                                height: heightLize(16),
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.signIn();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: heightLize(10)),
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      child: Text(
                                        'Đăng nhập',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: fontSizeLize(16)),
                                      ))),
                              SizedBox(
                                height: heightLize(24),
                              ),
                              Text(
                                'hoặc đăng nhập bằng',
                                style: TextStyle(
                                    color: const Color(0xFFB8B8Ba),
                                    fontSize: fontSizeLize(14),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: heightLize(24),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    controller.listIcon.length, (index) {
                                  return Flexible(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: widthLize(12)),
                                      child: ClipOval(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Ink.image(
                                            image: AssetImage(
                                                controller.listIcon[index]),
                                            fit: BoxFit.cover,
                                            width: widthLize(40),
                                            height: widthLize(40),
                                            child: InkWell(onTap: () {
                                              PopupService.showFeaturePopup();
                                            }),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(top: heightLize(90)),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                _showPopupRegister(context);
                              },
                              child: Text(
                                'Đăng ký  /  Quên mật khẩu',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                    'Bằng việc đăng nhập, bạn đã đồng ý với',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF656874))),
                                InkWell(
                                  onTap: () {
                                    _showTerm(context, controller.dummyData);
                                  },
                                  child: const Text(
                                      'Điều khoản sử dụng của Watchify',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFFFD130))),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
