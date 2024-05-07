import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_orth/constants/string_const.dart';
import 'package:hello_orth/components/hello_face_custome.dart';
// import '/constants/colors_style.dart';
import '/constants/const.dart';
import '/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  // final LoginController _tabx = Get.put(LoginController());
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _passController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _ischeckbox = false;
  Widget circleTabBarIcon() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: GlobalConstants.textSize2 + 1,
      width: GlobalConstants.textSize2 + 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GlobalConstants.textSize2),
        // color: AppColor.iconColor1,
        // border: Border.all(color: AppColor.iconColor1, width: 1),
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        // controller.isChecked.value ? AppColor.iconColor1 : AppColor.white,
        size: GlobalConstants.textSize2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
      // void myOnTap({required String page}) {
      //   delegate.toNamed(page);
      // }

      return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
              child: InkWell(
            onTap: () {
              controller.loginSuccess();
            },
            child: FaceVerifyCustoms.to.button(
              AppStrings.faceVrification,
            ),
          )));
    });
  }
}
