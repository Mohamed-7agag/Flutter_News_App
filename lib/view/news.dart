// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_news_app/controller/news_controller.dart';
import 'package:flutter_news_app/model/all_articles.dart';
import 'package:flutter_news_app/view/news_detail.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  final String category;
  const NewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff3894a3),
        title: Text(
          category,
          style: const TextStyle(
              fontFamily: 'myfont3', fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 10, right: 7, left: 7, top: 0),
        child: FutureBuilder(
          future: controller.getData(category),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Articles data = snapshot.data;
              return ListView.builder(
                itemCount: data.articles.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => NewsDetail(
                            date: data.articles[index].publishedAt
                                .toString()
                                .substring(0, 10),
                            title: data.articles[index].title.toString(),
                            desc: data.articles[index].description.toString(),
                            imageUrl: data.articles[index].urlToImage
                                        .toString() ==
                                    "null"
                                ? "assets/images/OIP.jpeg"
                                : data.articles[index].urlToImage.toString(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 4, left: 4, top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 3.0)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: data.articles[index].urlToImage
                                          .toString() ==
                                      "null"
                                  ? Image.asset(
                                      "assets/images/OIP.jpeg",
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                            color: const Color.fromARGB(
                                                255, 224, 224, 224),
                                          ),
                                      fit: BoxFit.cover,
                                      imageUrl: data.articles[index].urlToImage
                                          .toString()),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            maxLines: 2,
                            data.articles[index].title.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'myfont3'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff3894a3),
                  strokeWidth: 2.7,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
