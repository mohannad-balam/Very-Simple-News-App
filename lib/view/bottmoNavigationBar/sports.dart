import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../home.dart';

class Sports extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(
      title: "Sports",
      category: "sports",
    );
  }
}
