import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'const.dart';

abstract class AppColor {
  // static const black = Color(0xFF000000);
  static const iconColor1 = Color(0xFFe83437);
  static const headerBackgroundColor = Color(0xFFffeae9);
  static const textFieldIconColor = Color(0xFF2b4ad9);
  static const backgroundColor = Color(0xFFf9f9f9);
  static const lightMetalColor4 = Color(0xFFcccccc); //0xFFF2F2F7);
  static const skyBlueColor = Color(0xFF09c7e2);
  static final skyBlueColorOp = const Color(0xFF09c7e2).withOpacity(3.0);
  static const skyBlueColor1 = Color.fromARGB(255, 134, 209, 238);
  static const bluecolor = Color(0xFF2d4ada);

  static const tileshadow = [
    BoxShadow(
      color: AppColor.lightMetalColor4,
      blurRadius: 5.0,
      spreadRadius: 0.0,
      offset: Offset(2.0, 2.0), // shadow direction: bottom right
    )
  ];
  static const TextStyle whiteTextStyle1 =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14);
}
//   static const size1 = SizedBox(
//     height: GlobalConstants.spacingvertical1,
//   );
//   static const size2 = SizedBox(
//     height: GlobalConstants.spacingvertical2,
//   );
//   static const size3 = SizedBox(
//     height: GlobalConstants.subheadingSize,
//   );
//   static const sizewidth1 = SizedBox(
//     width: GlobalConstants.spacingvertical1,
//   );
//   static const sizewidth2 = SizedBox(
//     width: GlobalConstants.spacingvertical2,
//   );

//   static const TextStyle headline1 =
//       TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold);
//   static const headline4 =
//       TextStyle(fontSize: 32.0, fontStyle: FontStyle.normal);
//   static const headline5 =
//       TextStyle(fontSize: 28.0, fontStyle: FontStyle.normal);
//   static const headline6 = TextStyle(
//       fontSize: 22.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal);
//   static const subtitle1 =
//       TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0);
//   static const subtitle2 = TextStyle(
//       fontWeight: FontWeight.w400, fontSize: 20.0, color: Colors.grey);
//   static const subtitle3 = TextStyle(
//       fontWeight: FontWeight.w600, fontSize: 16.0, color: Colors.black);

//   static const bodyText1 = TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 12.0, color: Colors.black54);
//   static const bodyTextBold1 = TextStyle(
//       fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.black);

//   static const TextStyle errorFormFieldStyle = TextStyle(
//       color: AppColor.iconColor1, fontSize: GlobalConstants.textSize4);

//   static const TextStyle whiteTextStyle1 = TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: GlobalConstants.textSize2);

//   //////////Form Border
//   static const InputBorder textFormInputBorder = OutlineInputBorder(
//     borderSide: BorderSide(
//       color: AppColor.backgroundColor,
//     ),
//   );

// //////FOrmatter

//   static final TextInputFormatter nameFormatter =
//       FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));
//   static final TextInputFormatter numberFormatter =
//       FilteringTextInputFormatter.allow(RegExp("[0-9]"));
//   static final TextInputFormatter numberFormatter2 =
//       FilteringTextInputFormatter.allow(RegExp("[0-9.]"));
//   static final TextInputFormatter numberFormatteronlydigits =
//       FilteringTextInputFormatter.digitsOnly;
//   static final TextInputFormatter numberLengthFormatter =
//       LengthLimitingTextInputFormatter(3);

// //////////////
// }

// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }

//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
