import 'package:animated_solar/Moduls/Screens/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff000000),
              Color(0xff000040),
              Color(0xff000000),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<SplashController>(
                builder: (controller) => Transform.rotate(
                  angle: controller.animationController.value ?? 0.0,
                  child: Image.asset('lib/Assets/splash.png'),
                ),
              ),
            ),
            Text(
              "SUNSPARK",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
