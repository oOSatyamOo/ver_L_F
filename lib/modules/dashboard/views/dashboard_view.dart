import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        // final currentLocation = currentRoute?.location ?? Routes.face_verification;
        // final currentIndex =
        //     getDrwaerItemIndex(path: currentRoute?.location ?? Routes.home);
        // if (currentLocation.startsWith(Routes.products) == true) {
        //   currentIndex = 2;
        // }
        // if (currentLocation.startsWith(Routes.face_verification) == true) {
        //   currentIndex = 1;
        // }
        // void myOnTap({required String page}) {
        //   // delegate.toNamed(page);
        //   //to close the drawer
        // }
        return Center(
            child: Center(
          child: Text('DashBoard'),
        )
            // body: InkWell(
            //     onTap: () {

            //     },
            //     child: FaceVerifyCustoms.to.button(AppStrings.verify)),
            );
        // rreturn GridView.builder(
        //   // physics: NeverScrollableScrollPhysics(),
        //   scrollDirection: Axis.vertical,
        //   itemCount: controller.dashBoardItemsList.length,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 0.85,
        //   ),
        //   itemBuilder: (
        //     context,
        //     index,
        //   ) {
        //     return InkWell(
        //       onTap: () async {
        //         myOnTap(page: controller.dashBoardItemsPath[index]);
        //       },
        //       child: Container(
        //         // color: AppColor.iconColor1,
        //         margin: const EdgeInsets.all(GlobalConstants.textSize4),
        //         //  height: 160,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             CircleAvatar(
        //               maxRadius: GlobalConstants.radius3,
        //               minRadius: GlobalConstants.radius1,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(
        //                   GlobalConstants.spacing3,
        //                 ),
        //                 // child: Image.asset(
        //                 //   controller.dashBoardItemsImagesList[index],
        //                 //   fit: BoxFit.contain,
        //                 // ),
        //               ),
        //               backgroundColor: AppColor
        //                   .headerBackgroundColor, //AppColor.pink, //.withOpacity(0.2),
        //               // radius: GlobalConstants.radius3,
        //             ),
        //             // Image.asset(ImagePath.defaultImage),
        //             AppColor.size2,
        //             Text(
        //               controller.dashBoardItemsList[index],
        //               style: AppColor.subtitle1,
        //               textAlign: TextAlign.center,
        //             ),
        //             AppColor.size2,
        //           ],
        //         ),
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           boxShadow: AppColor.tileshadow,
        //           // color: HexColor(
        //           //     categories[index]
        //           //         .colorhaxCode),
        //           borderRadius:
        //               BorderRadius.circular(GlobalConstants.spacingvertical2),
        //         ),
        //         // margin: EdgeInsets.symmetric(
        //         //   horizontal: GlobalConstants.commonpadding,
        //         // ),
        //       ),
        //     );
        //   },
        // );
      }),
    );
  }
}
