import 'dart:async';

import 'package:animated_solar/Moduls/Screens/intro_screen/views/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    // TODO: implement onInit

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();

    Timer(
      Duration(seconds: 3),
      () {
        Get.to(() => IntroScreen());
        animationController.dispose();
      },
    );
    update();
    super.onInit();
  }
}
