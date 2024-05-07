import 'package:get/get.dart';

import '../../face_verify/controllers/face_verification_controller.dart';
import '../controllers/dashboard_controller.dart';

// class DashboardBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return [
//       Bind.lazyPut<DashboardController>(
//         () => DashboardController(),
//       )
//     ];
//   }
// }
class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<FaceVerificationController>(() => FaceVerificationController());
  }
}
