import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hello_orth/components/hello_face_custome.dart';
import 'package:hello_orth/constants/string_const.dart';

import '../../../constants/images_path.dart';
import '../controllers/face_verification_controller.dart';

class InitialFaceVerification extends GetView<FaceVerificationController> {
  const InitialFaceVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 2.1,
                  child: Image.asset(ImagePath.person_capture),
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage(ImagePath.person_capture)),
                  // ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    AppStrings.initiateVerificationMsg,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap: () {},
                  child: Text(
                    'Privacy Notice',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor),
                  )),
              const Divider(),
              InkWell(
                  onTap: () {
                    // if (controller.cameraDescription.hashCode) {
                    controller
                        .onNewCameraSelected(controller.cameraDescription);
                    // }

                    controller.onChange(1);
                  },
                  child: FaceVerifyCustoms.to
                      .button(AppStrings.verify, shrink: false)),
            ],
          ),
        ),
      ],
    ));
  }
}
