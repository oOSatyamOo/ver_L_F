import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' show Get, GetxController, Inst;

import '../constants/colors_style.dart';
import '../constants/const.dart';

class FaceVerifyCustoms extends GetxController {
  static FaceVerifyCustoms get to => Get.find<FaceVerifyCustoms>();

  SizedBox button(String text, {bool shrink = true, IconData? icon}) =>
      SizedBox(
        width: shrink
            ? text.length * 12 + (icon == null ? 0 : 80)
            : double.infinity,
        height: 55,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GlobalConstants.textSize1),
            color: const Color(0xff5F69C7),
          ),
          child: Center(
            child: icon == null
                ? Text(text,
                    textAlign: TextAlign.center,
                    style: AppColor.whiteTextStyle1)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      Text(text,
                          textAlign: TextAlign.center,
                          style: AppColor.whiteTextStyle1),
                    ],
                  ),
          ),
        ),
      );

  getTheme() => ThemeData(
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primaryColor: const Color(0xff5F69C7),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 40,
          actionsIconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: Color(0xFFFFFFFF),
          // This will be applied to the "back" icon
          iconTheme: IconThemeData(color: Color(0xFF000000)),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // Only honored in Android M and above
            // statusBarBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
              // fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
              fontSize: 18.0),
          elevation: 0.0,
        ),
      );
}
