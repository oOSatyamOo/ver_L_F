import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        // final currentLocation = currentRoute?.location ?? Routes.face_verification;
        // var currentIndex = 0;
        // if (currentLocation.startsWith(Routes.products) == true) {
        //   currentIndex = 2;
        // }
        // if (currentLocation.startsWith(Routes.face_verification) == true) {
        //   currentIndex = 1;
        // }
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.faceVerification,
            anchorRoute: Routes.home,
            // key: Get.nestedKey(Routes.home),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: currentIndex,
          //   onTap: (value) {
          //     switch (value) {
          //       case 0:
          //         delegate.toNamed(Routes.home);
          //         break;
          //       case 1:
          //         delegate.toNamed(Routes.face_verification);
          //         break;
          //       case 2:
          //         delegate.toNamed(Routes.products);
          //         break;
          //       default:
          //     }
          //   },
          //   items: const [
          //     // _Paths.home + [Empty]
          //   ],
          // ),
        );
      },
    );
  }
}
