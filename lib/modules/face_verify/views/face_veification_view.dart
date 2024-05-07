import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_orth/modules/face_verify/views/initialScreen.dart';
import 'package:hello_orth/modules/face_verify/views/verification_screen.dart';

import '../controllers/face_verification_controller.dart';

class FaceVeiryView extends GetView<FaceVerificationController> {
  const FaceVeiryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onChange,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              InitialFaceVerification(),
              VerificationView(),
            ],
          ),
        ],
      ),
    );
  }
}
