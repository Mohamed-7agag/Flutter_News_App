import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/news.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  List<String> category = [
    "business",
    "general",
    "health",
    "science",
    "sports",
    "technology",
    "entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Choose A Category Of News",
              style: TextStyle(
                  fontFamily: 'myfont3',
                  fontSize: 25,
                  color: Color(0xff3894a3),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisExtent: 120),
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => NewsScreen(category: category[index]));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 3)
                          ]),
                      child: Text(
                        category[index],
                        style: const TextStyle(
                            fontFamily: 'myfont3',
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
