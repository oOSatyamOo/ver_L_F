import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_orth/constants/string_const.dart';
import '/modules/splash/controllers/splash_service.dart';
import '../../../../routes/app_pages.dart';

class RootView extends GetView<SplashService> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          body: Obx(() {
            return controller.isLoggedIn.value
                ? Scaffold(
                    appBar: AppBar(
                      centerTitle: false,
                      leading: IconButton(
                          onPressed: () => controller.logout(),
                          icon: const Icon(Icons.arrow_back_ios_new)),
                      title: Text(
                        AppStrings.face_verification,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    body: GetRouterOutlet(
                      initialRoute: Routes.home,
                      anchorRoute: '/',
                    ),
                  )
                : GetRouterOutlet(
                    initialRoute: Routes.login,
                    anchorRoute: '/',
                  );
          }),
        );
      },
    );
  }
}
