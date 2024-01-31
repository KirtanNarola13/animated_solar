import 'package:animated_solar/Moduls/Screens/DetailScreen/Views/detail_screen.dart';
import 'package:animated_solar/Moduls/Screens/HomeScreen/Veiws/home_screen.dart';
import 'package:animated_solar/Moduls/Screens/intro_screen/views/intro_screen.dart';
import 'package:animated_solar/Moduls/Screens/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/intro_screen', page: () => IntroScreen()),
      GetPage(name: '/home_screen', page: () => HomeScreen()),
      GetPage(name: '/detail_screen', page: () => DetailScreen()),
    ],
  ));
}
