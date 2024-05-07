import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NoInternetView extends GetView<NoInternetView> {
  const NoInternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return const Scaffold(
      body: Center(
        child: Text('InterNetIsOff'),
      ),
    );
  }
}
