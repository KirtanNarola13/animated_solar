import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/allData.dart';

// Import other packages as needed

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetFirstAnimation;
  late Animation<Offset> offsetSecondAnimation;

  @override
  void initState() {
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

    animationController.addListener(() {
      setState(() {});
    });

    // Start the animation when the widget is created
    animationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              margin: const EdgeInsets.all(10),
                              width: w / 1.2,
                              child: Stack(
                                alignment: const Alignment(0, -0.9),
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 70, left: 20, right: 20),
                                        height: h / 3,
                                        width: w / 1,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Stack(
                                          alignment: const Alignment(0, 1.8),
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: w / 10,
                                                        ),
                                                        Text(
                                                          allData[i].position,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontSize: 180,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Explore",
                                                        style: TextStyle(
                                                            color: Color(int
                                                                .parse(allData[
                                                                        i]
                                                                    .color)),
                                                            fontSize: 35),
                                                      ),
                                                      Text(
                                                        allData[i].name,
                                                        style: TextStyle(
                                                          color: Color(
                                                              int.parse(
                                                                  allData[i]
                                                                      .color)),
                                                          fontSize: 25,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h / 30,
                                                      ),
                                                      Text(
                                                        allData[i].description,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: h / 11,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Image.asset(
                                                    "lib/Assets/Button.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'detail_screen',
                                          arguments: allData[i]);
                                    },
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      child: Hero(
                                        tag: 'h',
                                        child: Container(
                                          height: h / 3.5,
                                          child: Image.asset(allData[i].image),
                                        ),
                                      ),
                                      builder: (context, child) {
                                        return Transform.translate(
                                          offset: offsetFirstAnimation.value,
                                          child: Transform.translate(
                                            offset: offsetSecondAnimation.value,
                                            child: child,
                                          ),
                                        );
                                      },
                                    ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
