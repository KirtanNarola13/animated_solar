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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('lib/Assets/Back_Arrow.png'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  allData.position,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.5),
                    fontStyle: FontStyle.italic,
                    fontSize: 280,
                  ),
                ),
                SizedBox(
                  width: h / 100,
                ),
              ],
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
