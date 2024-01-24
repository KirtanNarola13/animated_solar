import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/allData.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Container(
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
      child: Scaffold(
        backgroundColor: const Color(0x00000000),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('lib/Assets/sun.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hiii !!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Kirtan 👋🏻",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                    child: FutureBuilder(
                  future: rootBundle.loadString('lib/Json/solar.json'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List decodedData = jsonDecode(snapshot.data!);
                      List<AllData> allData = decodedData
                          .map((e) => AllData.fromJson(data: e))
                          .toList();

                      return ListView.builder(
                        itemBuilder: (ctx, i) {
                          return Container(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            margin: const EdgeInsets.all(10),
                            height: h / 2,
                            child: Stack(
                              alignment: const Alignment(0, -0.6),
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: h / 4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Align(
                                      child: Container(
                                        height: h / 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: h / 4.5,
                                  child: Image.asset(allData[i].image),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: allData.length,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
