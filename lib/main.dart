import 'package:flutter/material.dart';

import 'Moduls/Screens/HomeScreen/Veiws/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomeScreen(),
    },
  ));
}
