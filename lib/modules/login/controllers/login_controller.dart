import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '/modules/splash/controllers/splash_service.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  loginSuccess() async {
    Get.find<SplashService>().loginSuccess();
    // bool _status = await getrCatpchaCodeV3();
    // try {
    //   final result = await InternetAddress.lookup('www.google.com');
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     _status = true;
    //     debugPrint('InterNaet is on');
    //   }
    // } on SocketException catch (_) {
    //   _status = false;
    //   debugPrint('Internet is off');
    // }
    // return _status;
  }

  List<String> dashBoardItemsPath = const [
    Routes.faceVerification,
    Routes.dashboard
    // Routes.settings
  ];
}
