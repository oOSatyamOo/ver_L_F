import 'dart:async';

import 'package:async/async.dart';
import 'package:get/get.dart';

class SplashService extends GetxService {
  static SplashService get to => Get.find<SplashService>();

  final welcomeStr = ['GetX', 'Face Verification!'];
  final activeStr = 0.obs;

  /// Mocks a login process
  final isLoggedIn = false.obs;
  final memo = AsyncMemoizer<void>();

  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  void _changeActiveString() {
    activeStr.value = (activeStr.value + 1) % welcomeStr.length;
  }

  Future<void> _initFunction() async {
    final t = Timer.periodic(
      const Duration(milliseconds: 500),
      (t) => _changeActiveString(),
    );
    //simulate some long running operation
    await Future.delayed(const Duration(seconds: 3));
    //cancel the timer once we are done
    t.cancel();
    // isLoggedIn.value = true;
  }

  bool get isLoggedInValue => isLoggedIn.value;

  void loginSuccess() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
