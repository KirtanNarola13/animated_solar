import 'package:animated_solar/Moduls/Screens/HomeScreen/Model/allData.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    AllData allData = ModalRoute.of(context)?.settings.arguments as AllData;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(allData.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Hero(
                tag: 'h',
                child: Container(
                  height: h / 3.5,
                  child: Image.asset(allData.image),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
