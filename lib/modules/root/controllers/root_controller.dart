import 'package:get/get.dart';

class RootController extends GetxController {
  final auth = false.obs;
  // =  AuthService.to.isLoggedInValue ;
  // bool get isLoggedInValue => AuthService.to.isLoggedInValue;

  final count = 0.obs;
  loggedIn() {
    auth.value = true;
    update();
  }

  loggedOut() {
    auth.value = false;
    update();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
  void increment() => count.value++;
}
