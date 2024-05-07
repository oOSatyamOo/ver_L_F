// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const initial = _Paths.initial;

  static const home = _Paths.home;

  static const faceVerification = _Paths.home + _Paths.faceVerification;
  static const dashboard = _Paths.home + _Paths.dashboard;
  static const login = _Paths.login;

  // static const face_verification = _Paths.face_verification;
  // static const settings = _Paths.settings;
  // static const dashboard = _Paths.dashboard;
  // static const products = _Paths.products;

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  // static String productDetails(String productId) => '$trips/$productId';
}

abstract class _Paths {
  static const initial = '/';
  static const home = '/home';
  static const faceVerification = '/face_verification';
  static const login = '/login';
  static const dashboard = '/dashboard';
}
