import 'dart:convert';
import 'package:flutter_news_app/model/all_articles.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  Future getData(String cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=20e9236b07c44e5e8cd6c3403c274958");

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (ex) {
        Get.snackbar("error", ex.toString());
      }
    }
  }
}
