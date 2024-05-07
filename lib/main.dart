import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/splash/controllers/splash_service.dart';
import 'modules/splash/views/splash_view.dart';
import 'routes/app_pages.dart';
import 'components/hello_face_custome.dart';

void main() async {
  Get.put<FaceVerifyCustoms>(FaceVerifyCustoms(), permanent: true);
  //  Get.lazyPut<NetworkInfoImpl>(() => NetworkInfoImpl(),fenix: true);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp.router(
      enableLog: true,
      defaultTransition: Transition.zoom,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      theme: FaceVerifyCustoms.to.getTheme(),
      // theme: ThemeData(
      //   primaryColor: const Color(0xff5F69C7),
      // ),
      darkTheme: ThemeData(
        canvasColor: Colors.white,
        brightness: Brightness.dark,
      ),
      title: 'Face Verification',
      initialBinding: BindingsBuilder(
        () {
          Get.put(SplashService());
        },
      ),
      getPages: AppPages.routes,
      builder: (context, child) {
        return FutureBuilder<void>(
          key: const ValueKey('init'),
          future: Get.find<SplashService>().init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child ?? const SizedBox.shrink();
            }
            return const SplashView();
          },
        );
      },
    ),
  );
}
