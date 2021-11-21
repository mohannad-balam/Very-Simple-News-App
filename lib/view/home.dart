import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

//we are using GetWidget instead of stateLess and sateFull ones !
//getX is one of the methods used to manage the states
class HomePage extends GetWidget {
  final String category;
  final String title;

  HomePage({this.category, this.title});
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: FutureBuilder<Article>(
        future: newsController.getData(category),
        builder: (context, AsyncSnapshot<Article> snapshot) {
          if (snapshot.hasData) {
            Article data = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.network(
                          data.articles[index].urlToImage.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        data.articles[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        data.articles[index].description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: data.articles.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
