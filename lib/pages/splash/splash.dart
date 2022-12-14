import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karyana_wala/config/routes.dart';
import 'package:lottie/lottie.dart';

import '../../constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if(user == null){
          Get.offAllNamed(MyRoutes.getWelcome());
        }
        else{
          Get.offAllNamed(MyRoutes.getHomeRoute());
        }
      });

            },
    );
  }
  @override
  Widget build(BuildContext context) {
    /// making the app responsive with MediaQuery... well for app its less stress ... to do responsiveness...
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
          ),
          child:  Lottie.asset(splashLottie),
        ),
      ),
    );
  }
}
