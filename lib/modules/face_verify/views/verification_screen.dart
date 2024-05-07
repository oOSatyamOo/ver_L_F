import 'package:camera/camera.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hello_orth/components/hello_face_custome.dart';
import 'package:hello_orth/constants/images_path.dart';
import 'package:hello_orth/constants/string_const.dart';

import '../../../routes/app_pages.dart';
import '../controllers/face_verification_controller.dart';

class VerificationView extends GetView<FaceVerificationController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
      return Scaffold(
        body: Obx(() {
          return !controller.controllerInitialized
              ? const Center(child: Text('...'))
              : controller.isPhotoTaken.value && !controller.isImageDark.value
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.file(
                            controller.getImage,
                          ),
                        ),
                        Text(
                          AppStrings.faceVerificationSuccess,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            //DO API REST CALL
                          },
                          child: FaceVerifyCustoms.to
                              .button(AppStrings.submit, shrink: false),
                        )
                      ],
                    )
                  : controller.noofRetry > 5
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Image.file(
                                controller.getImage,
                              ),
                            ),
                            Text(
                              AppStrings.couldntRecognize,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Text(
                                    AppStrings.dontworry,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    AppStrings.gotodashboardMsg,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Divider(),
                                  InkWell(
                                    onTap: () {
                                      controller.logout();
                                    },
                                    child: FaceVerifyCustoms.to.button(
                                        AppStrings.gotodashboard,
                                        shrink: false),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: [
                            Positioned.fill(
                              child: AspectRatio(
                                aspectRatio: controller
                                    .cameraController.value.aspectRatio,
                                child: controller.isPhotoTaken.value &&
                                        controller.isImageDark.value
                                    ? Image.file(
                                        controller.getImage,
                                        fit: BoxFit.cover,
                                      )
                                    : CameraPreview(
                                        controller.cameraController),
                              ),
                              // controller.cameraController.value.aspectRatio),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Text(
                                      controller.currentStatusMsg.value,
                                      style: controller.isPhotoTaken.value &&
                                              controller.isImageDark.value
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.white)
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                    ),
                                  ),
                                  controller.isPhotoTaken.value &&
                                          controller.isImageDark.value
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.sunny,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.restart_alt,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    AppStrings
                                                        .imagelightingisLess,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      : AspectRatio(
                                          aspectRatio: 1.2,
                                          child: Image.asset(
                                              ImagePath.capture_focus)),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 80.0,
                              left: 16.0,
                              right: 16.0,
                              child: Center(
                                child: controller.isPhotoTaken.value
                                    ? InkWell(
                                        onTap: () {
                                          controller.logout();
                                        },
                                        child: FaceVerifyCustoms.to.button(
                                            AppStrings.retakephoto,
                                            icon: Icons.restart_alt),
                                      )
                                    : Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${controller.progressValue}% Scanning',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          LinearProgressIndicator(
                                            backgroundColor: Colors.grey[
                                                300], // Background color of the progress bar
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(Color(0xff5F69C7)),
                                            value: controller.progressValue /
                                                100, // Value of progress between 0.0 and 1.0
                                          ),
                                        ],
                                      ),
                              ),
                            )
                          ],
                        );
        }),
      );
    });
  }
}
