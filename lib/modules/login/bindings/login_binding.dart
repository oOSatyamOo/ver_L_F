import 'package:get/get.dart';
import '/modules/root/controllers/root_controller.dart';

import '../controllers/login_controller.dart';

// class LoginBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return [
//       Bind.lazyPut(() => LoginController()),
//     ];
//   }
// }

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
