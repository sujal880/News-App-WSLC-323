import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/repository/screens/onboarding/onboardingscreen.dart';
import 'package:mynewsapp/repository/screens/splash/controllers/splashcontroller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      SplashController.checklogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.newspaper,
          color: Color(0XFF1F41BB),
          size: 60.h,
        ),
      ),
    );
  }
}
