import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_orth/constants/string_const.dart';
import 'package:hello_orth/modules/splash/controllers/splash_service.dart';
import 'package:web_socket_channel/io.dart';
import 'package:image/image.dart' as img;
import 'package:web_socket_channel/web_socket_channel.dart';

enum DetectionStatus { noFace, fail, success }

class FaceVerificationController extends GetxController {
  late CameraController cameraController;

  late WebSocketChannel channel;

  Rx<DetectionStatus> status = DetectionStatus.noFace.obs;

  PageController pageController = PageController();
  final Rx<int> _pageIndex = 0.obs;
  int get pageNo => _pageIndex.value;

  void onChange(index) async {
    pageController.jumpToPage(index);
    _pageIndex(index);
  }

  static int _tryCount = 0;
  int get noofRetry => _tryCount;
  Rx<bool> controllerInitializedStatus = false.obs;
  bool get controllerInitialized => controllerInitializedStatus.value;
  Rx<String> currentStatusMsg = ''.obs;
  String get currentStatus => currentStatusMsg.value;
  late CameraDescription cameraDescription;

  Rx<double> _progressValue = 0.0.obs;
  double get progressValue => _progressValue.value;

  Rx<bool> isImageDark = true.obs;
  double _brightnessThreshold = 360; // Adjust threshold as needed

  late XFile image;
  File get getImage => File(image.path);

  Rx<bool> isPhotoTaken = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeCamera();
    // initializeWebSocket();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cameraController.dispose();
    // channel.sink.close();
    super.onClose();
  }

  Color get currentstatusColor {
    switch (status.value) {
      case DetectionStatus.noFace:
        return Colors.grey;
      case DetectionStatus.fail:
        return Colors.red;
      case DetectionStatus.success:
        return Colors.greenAccent;
    }
  }

  void startTimer() {
    const oneSec = Duration(milliseconds: 50);
    Timer.periodic(oneSec, (Timer timer) {
      if (_progressValue.value >= 100) {
        timer.cancel();
        //RetakePHOTO
      } else {
        _progressValue.value += 2; // Adjust the increment value as needed
      }
    });
  }

  Future<int> _getTotalIntensity(XFile imageFile) async {
    Uint8List bytes = await imageFile.readAsBytes();
    img.Image image = img.decodeImage(bytes)!;
    int totalIntensity = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        img.Pixel pixel = image.getPixel(x, y);
        // totalIntensity += pixel.r + pixel.g + pixel.b; // Sum of red, green, and blue channels
        totalIntensity += (pixel.r + pixel.g + pixel.b).toInt();
      }
    }

    return totalIntensity;
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (cameraController.value.hasError) {
        debugPrint('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      startTimer();
      await cameraController.initialize();
      controllerInitializedStatus.value = true;
      await Future.wait(<Future<Object?>>[
        // The exposure mode is currently not supported on the web.
        ...<Future<Object?>>[],
        // cameraController
        //     .getMaxZoomLevel()
        //     .then((double value) => _maxAvailableZoom = value),
        // cameraController
        //     .getMinZoomLevel()
        //     .then((double value) => _minAvailableZoom = value),
      ]);
      // Timer.periodic(const Duration(seconds: 5), (timer) async {
      Future.delayed(const Duration(seconds: 5), () async {
        try {
          image = await cameraController.takePicture();
          isPhotoTaken.value = true;
          final compressedImageBytes = compressImage(image.path);
          // img.Image vimage =image;//img.decodeImage(compressedImageBytes);
          // final timage =await decodeImageFromList(compressedImageBytes);
          // Convert image to grayscale
          img.Image grayscaleImage =
              img.grayscale(img.decodeImage(compressedImageBytes)!);

          // Calculate average pixel intensity
          int totalIntensity = 0;
          totalIntensity = await _getTotalIntensity(image);
          double averageIntensity =
              totalIntensity / (grayscaleImage.width * grayscaleImage.height);
          _tryCount++;
          debugPrint('aVG  $averageIntensity $totalIntensity $noofRetry');
          // Check if image is dark or dull based on brightness threshold
          // setState(() {
          isImageDark.value = averageIntensity < _brightnessThreshold;

          if (isImageDark.value) {
            currentStatusMsg.value = AppStrings.batterLightning;
          }
          // });

          // channel.sink.add(compressedImageBytes);
        } catch (e) {
          debugPrint('Timer ERROR $e');
        }
      });
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          debugPrint('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          debugPrint('Please go to Settings app to enable camera access.');
          break;
        case 'AudioAccessDenied':
          debugPrint('You have denied audio access.');
          break;
        default:
          debugPrint("CAMERA EX P $e");
      }
    }

    // if (mounted) {
    //   setState(() {});
    // }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    // if (cameraController != null) {
    //   return cameraController!.setDescription(cameraDescription);
    // } else {
    _initializeCameraController(cameraDescription);
    // }
  }

  Future<void> initializeCamera() async {
    try {
      currentStatusMsg.value = AppStrings.lookintoCamera;
      final cameras = await availableCameras();
      final ca = cameras[1];
      debugPrint('Initializ $ca');

      cameraDescription = ca;

      // cameraController = CameraController(firstCamera, ResolutionPreset.medium,
      //     enableAudio: false);

      // await cameraController!.initialize();
    } catch (e) {
      debugPrint('Initialize Camera Ex $e');
      controllerInitializedStatus(false);
    }
  }

  void initializeWebSocket() {
    channel = IOWebSocketChannel.connect("ws://10.0.2.2:8756");
    channel.stream.listen(
        (event) {
          debugPrint(event);
          final data = jsonDecode(event);
          if (data['data'] == null) {
            debugPrint("Server Error Occured in Recognizing Face");
          }
          switch (data['data']) {
            case 0:
              status.value = DetectionStatus.noFace;
              currentStatusMsg.value =
                  "Please look into the camera and hold still";
              break;
            case 1:
              status.value = DetectionStatus.fail;
              currentStatusMsg.value = "We couldnt recognize your face";

              break;
            case 2:
              status.value = DetectionStatus.success;
              currentStatusMsg.value = "Face Verified Successfully";

              break;
            default:
              status.value = DetectionStatus.noFace;
          }
        },
        onError: (e) {},
        onDone: () {
          debugPrint('Websocket Connection Lost');
        });
  }

  Uint8List compressImage(String imagePath, {int quality = 85}) {
    final image =
        img.decodeImage(Uint8List.fromList(File(imagePath).readAsBytesSync()))!;
    final compressedImage = img.encodeJpg(image, quality: quality);
    return compressedImage;
  }

  void logout() {
    Get.find<SplashService>().logout();
  }
}
