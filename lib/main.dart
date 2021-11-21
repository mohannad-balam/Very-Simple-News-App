import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/bottmoNavigationBar/entertainment.dart';
import 'package:news_app/view/bottmoNavigationBar/health.dart';
import 'package:news_app/view/bottmoNavigationBar/science.dart';
import 'package:news_app/view/bottmoNavigationBar/sports.dart';
import 'package:news_app/view/bottmoNavigationBar/technology.dart';
import 'package:news_app/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    List<Widget> screens = [
      Sports(),
      Science(),
      Health(),
      Entertainment(),
      Technology()
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: GetX<NewsController>(
              builder: (newsController) =>
                  screens[newsController.currentIndex.value]),
          bottomNavigationBar: GetX<NewsController>(
            builder: (newsController) => BottomNavigationBar(
              backgroundColor: Colors.blueAccent,
              selectedItemColor: Colors.red,
              currentIndex: newsController.currentIndex.value,
              onTap: (value) {
                newsController.currentIndex.value = value;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: "sports",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science),
                  label: "science",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety_outlined),
                  label: "health",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.games),
                  label: "entertainments",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.computer),
                  label: "technology",
                ),
              ],
            ),
          )),
    );
  }
}
