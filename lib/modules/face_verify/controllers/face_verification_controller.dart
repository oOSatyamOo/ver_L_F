import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceVerificationController extends GetxController {
  PageController pageController = PageController();
  final Rx<int> _pageIndex = 0.obs;
  int get pageNo => _pageIndex.value;
  void onChange(index) async {
    pageController.jumpToPage(index);
    _pageIndex(index);
  }
}
