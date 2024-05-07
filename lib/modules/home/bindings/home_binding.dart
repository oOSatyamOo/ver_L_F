import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// class HomeBinding extends Binding {
//   @override
//   List<Bind> dependencies() {
//     return [
//       Bind.lazyPut<HomeController>(
//         () => HomeController(),
//       )
//     ];
//   }
// }
class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
