import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home.dart';

class Entertainment extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(
      title: "Entertainmnet",
      category: "entertainmnet",
    );
  }
}
