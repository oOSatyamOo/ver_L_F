import 'package:get/get.dart';

import '../controllers/face_verification_controller.dart';

class FaceVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceVerificationController>(() => FaceVerificationController(),
        fenix: true);
  }
}
