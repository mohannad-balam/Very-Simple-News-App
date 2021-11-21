import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  //this function is gonna fetch data from API and retrun it as an object of dart after decoding it from string to json
  //and the turn it to dart object by using fromJosn() method
  Future<Article> getData(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=jp&category=${category}&apiKey=e8921c5d33044e92a1b0f54419363fd6");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //ok
      //returning dart object form json url

      //or jsonDecode()
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
  //end function
}
