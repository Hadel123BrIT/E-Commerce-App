import 'dart:async';
import 'package:ecommerce_app/Routes/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import '../Const/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.toNamed(AppRoutes.root);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/Animation - 1740390505128.json',
              fit: BoxFit.cover,
              repeat: true,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Welcome to  ",
                style: TextStyle(
                 // color: color_title,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "shopping online",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 // color: springYellow,
                ),
              ),
            ])),
            Lottie.asset(
              'assets/images/Animation - 1740348375718.json',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
              repeat: true,
            ),
          ],
        ),
      ),
    );
  }
}