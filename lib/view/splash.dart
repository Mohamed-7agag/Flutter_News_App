import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/category.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/icon.png",width: 95,),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Akhbar",
              style: TextStyle(
                  fontSize: 45,
                  letterSpacing: 1.5,
                  fontFamily: 'myfont3',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3894a3)),
            ),
          ],
        ),
      ),
    );
  }
}
