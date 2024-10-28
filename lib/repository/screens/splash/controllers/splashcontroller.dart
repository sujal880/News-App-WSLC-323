import 'package:flutter/material.dart';
import 'package:mynewsapp/domain/constants/appprefs.dart';
import 'package:mynewsapp/repository/screens/bottom/bottomnav.dart';
import 'package:mynewsapp/repository/screens/onboarding/onboardingscreen.dart';

class SplashController {
  static checklogin(BuildContext context) async {
    bool value = await AppPrefs().getbool();
    if (value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    }
  }
}
