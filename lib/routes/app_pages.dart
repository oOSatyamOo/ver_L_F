import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/face_verify/bindings/face_verify_binding.dart';
import '../modules/face_verify/views/face_veification_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.initial;

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      unknownRoute: GetPage(
        middlewares: [
          //only enter this route when authed
          EnsureAuthMiddleware(),
        ],
        name: _Paths.login,
        page: () => LoginView(),
        title: 'Login',
        transition: Transition.size,
        bindings: [LoginBinding()],
      ),
      children: [
        GetPage(
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
          name: _Paths.login,
          page: () => LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          bindings: [
            HomePageBinding(),
          ],
          title: null,
          children: [
            //trips
            // GetPage(
            //   name: _Paths.trips,
            //   page: () => const TripsView(),
            //   title: 'Trips',
            //   transition: Transition.zoom,
            //   bindings: [TripsBinding()],
            //   // children: [
            //   //   GetPage(
            //   //     name: _Paths.productDetails,
            //   //     page: () => const ProductDetailsView(),
            //   //     bindings: [ProductDetailsBinding()],
            //   //     middlewares: [
            //   //       //only enter this route when authed
            //   //       EnsureAuthMiddleware(),
            //   //     ],
            //   //   ),
            //   // ],
            // ),
            // //vaccination
            // GetPage(
            //   name: _Paths.vaccination,
            //   page: () => const VaccinationView(),
            //   bindings: [
            //     VaccinationBinding(),
            //   ],
            // ),
            //profile
            GetPage(
              name: _Paths.dashboard,
              page: () => const DashboardView(),
              bindings: [
                DashboardBinding(),
              ],
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.faceVerification,
              page: () => const FaceVeiryView(),
              title: 'Face Verification',
              transition: Transition.size,
              bindings: [FaceVerificationBinding()],
            ),
          ],
        ),
      ],
    ),
  ];
}
