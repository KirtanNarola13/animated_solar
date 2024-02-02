import 'package:animated_solar/Moduls/Screens/HomeScreen/Model/allData.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllData allData = ModalRoute.of(context)?.settings.arguments as AllData;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(allData.name),
        centerTitle: true,
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
            flex: 3,
            child: Stack(
              alignment: const Alignment(0.9, -1),
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: w / 20,
                    ),
                    Hero(
                      tag: 'text',
                      child: Text(
                        allData.position,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                          fontSize: 350,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                  ],
                ),
                Hero(
                  tag: 'planet',
                  child: Image.asset(allData.image),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allData.name,
                    style: TextStyle(
                      fontSize: 52,
                      color: Color(
                        int.parse(allData.color),
                      ),
                    ),
                  ),
                  Text(
                    allData.description,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Distance",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(
                          int.parse(allData.color),
                        ),
                      ),
                    ),
                    Text(
                      allData.distance,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(0, -1),
                  child: Container(
                    width: 1,
                    height: h / 15,
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(allData.color),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Velocity",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(
                          int.parse(allData.color),
                        ),
                      ),
                    ),
                    Text(
                      allData.velocity,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
