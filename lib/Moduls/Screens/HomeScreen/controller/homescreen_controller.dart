import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetFirstAnimation;
  late Animation<Offset> offsetSecondAnimation;

  @override
  void onInit() {
    // TODO: implement onInit

    animationController = AnimationController(
      reverseDuration: const Duration(seconds: 1),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 5),
    );
    animationController.forward();

    offsetFirstAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -30),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0, // Change this value for different start times
          1.0, // Change this value for different end times
          curve: Curves.bounceIn,
        ),
      ),
    );
    offsetSecondAnimation = Tween<Offset>(
      begin: const Offset(0, -30),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0, // Change this value for different start times
          1.0, // Change this value for different end times
          curve: Curves.bounceOut,
        ),
      ),
    );

    // Start the animation when the widget is created
    animationController.repeat();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
