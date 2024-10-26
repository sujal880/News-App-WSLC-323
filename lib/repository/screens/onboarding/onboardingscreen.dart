import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/repository/screens/login/loginscreen.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomImage(url: "welcome image.png"),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomText(
                text: "Discover Your",
                color: Color(0XFF1F41BB),
                fontsize: 25.sp,
                fontweight: FontWeight.bold),
            UiHelper.CustomText(
                text: "Dream Job here",
                color: Color(0XFF1F41BB),
                fontsize: 25.sp,
                fontweight: FontWeight.bold),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomText(
              text: "Explore all the existing job roles based on your",
              fontsize: 12.sp,
            ),
            UiHelper.CustomText(
                text: "interest and study major", fontsize: 12.sp),
            SizedBox(
              height: 30.h,
            ),
            UiHelper.CustomButton(
                callback: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                text: "Get Started")
          ],
        ),
      ),

    );
  }
}
