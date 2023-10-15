// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_news_app/controller/news_controller.dart';
import 'package:flutter_news_app/model/all_articles.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  final String category;
  const NewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: Colors.black,
        title: Text(
          category,
          style: const TextStyle(
              fontFamily: 'myfont', fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 7,right: 7,left: 7),
        child: FutureBuilder(
          future: controller.getData(category),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Articles data = snapshot.data;
              return ListView.builder(
                itemCount: data.articles.length,
                itemBuilder: (context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(40, 0, 0, 0),
                              blurRadius: 2.5)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: data.articles[index].urlToImage.toString() ==
                                    "null"
                                ? Image.asset(
                                    "assets/images/OIP.jpeg",
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    data.articles[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          data.articles[index].title.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'myfont'),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
