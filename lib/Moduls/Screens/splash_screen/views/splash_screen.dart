import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'intro_screen');
        animationController.dispose();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Transform.rotate(
                angle: animationController.value,
                child: Image.asset('lib/Assets/splash.png'),
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
