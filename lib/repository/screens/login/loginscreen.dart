import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/repository/screens/signup/signupscreen.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomText(
                text: "Login here",
                fontsize: 25.sp,
                fontweight: FontWeight.w700,
                color: Color(0XFF1F41BB)),
            SizedBox(
              height: 5.h,
            ),
            UiHelper.CustomText(
              text: "Welcome back you’ve",
              fontsize: 20.sp,
              fontweight: FontWeight.w700,
            ),
            UiHelper.CustomText(
              text: "been missed!",
              fontsize: 20.sp,
              fontweight: FontWeight.w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            UiHelper.CustomTextField(
                controller: emailController,
                text: "Email",
                toHide: false,
                textinput: TextInputType.emailAddress),
            SizedBox(
              height: 15.h,
            ),
            UiHelper.CustomTextField(
                controller: passwordController,
                text: "Password",
                toHide: true,
                textinput: TextInputType.text),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UiHelper.CustomTextButton(
                      callback: () {},
                      text: "Forgot your password?",
                      fontsize: 13.sp,
                      color: Color(0XFF1F41BB))
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomButton(callback: () {}, text: "Sign In")
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomTextButton(
        callback: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        text: "Create new account?",
        fontsize: 14.sp,
        color: Color(0XFF000000),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
