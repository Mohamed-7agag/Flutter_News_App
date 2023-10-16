import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String date;
  const NewsDetail(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff3894a3),
        title: const Text(
          "Details",
          style: TextStyle(
              fontFamily: 'myfont3', fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: imageUrl == "assets/images/OIP.jpeg"
                  ? Image.asset(
                      "assets/images/OIP.jpeg",
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      placeholder: (context, url) => Container(
                            color: const Color.fromARGB(255, 211, 211, 211),
                          ),
                      fit: BoxFit.cover,
                      imageUrl: imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'myfont3',
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "PublishedAt : $date",
                    style: TextStyle(
                        fontFamily: 'myfont3',
                        fontSize: 18,
                        color: Colors.grey[900]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        fontFamily: 'myfont3',
                        fontSize: 19,
                        color: Colors.grey[700]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
