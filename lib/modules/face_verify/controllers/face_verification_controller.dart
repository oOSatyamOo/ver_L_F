import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:image/image.dart' as img;
import 'package:web_socket_channel/web_socket_channel.dart';

enum DetectionStatus { noFace, fail, success }

class FaceVerificationController extends GetxController {
  CameraController? cameraController;

  late WebSocketChannel channel;

  DetectionStatus? status;

  PageController pageController = PageController();
  final Rx<int> _pageIndex = 0.obs;
  int get pageNo => _pageIndex.value;
  void onChange(index) async {
    pageController.jumpToPage(index);
    _pageIndex(index);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initializeCamera();
    initializeWebSocket();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cameraController?.dispose();
    channel.sink.close();
    super.onClose();
  }

  Color get currentstatusColor {
    if (status == null) {
      return Colors.grey;
    }
    switch (status!) {
      case DetectionStatus.noFace:
        return Colors.grey;
      case DetectionStatus.fail:
        return Colors.red;
      case DetectionStatus.success:
        return Colors.greenAccent;
    }
  }

  String get currentStatus {
    if (status == null) {
      return "initializing...";
    }
    switch (status) {
      case DetectionStatus.noFace:
        return "No Face Detected in the screen";
      case DetectionStatus.fail:
        return "Unrecognized Face Detected";
      default:
        return "Face Detected";
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras[1];

    cameraController = CameraController(firstCamera, ResolutionPreset.medium,
        enableAudio: false);

    await cameraController!.initialize();

    Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final XFile image = await cameraController!.takePicture();

        final compressedImageBytes = compressImage(image.path);
        channel.sink.add(compressedImageBytes);
      } catch (e) {}
    });
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
              status = DetectionStatus.noFace;
              break;
            case 1:
              status = DetectionStatus.fail;
              break;
            case 2:
              status = DetectionStatus.success;
              break;
            default:
              status = DetectionStatus.noFace;
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
}
