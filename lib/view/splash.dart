import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/category.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      Get.off(() => CategoryScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Text(
          "News",
          style: TextStyle(
              fontSize: 70,
              fontFamily: 'myfont',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }
}
