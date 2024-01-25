import 'package:animated_solar/Moduls/Screens/DetailScreen/Views/detail_screen.dart';
import 'package:animated_solar/Moduls/Screens/intro_screen/views/intro_screen.dart';
import 'package:flutter/material.dart';

import 'Moduls/Screens/HomeScreen/Veiws/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      'into': (context) => const IntroScreen(),
      '/': (context) => const HomeScreen(),
      'detail_screen': (context) => const DetailScreen(),
    },
  ));
}
