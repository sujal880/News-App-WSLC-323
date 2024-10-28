import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/repository/screens/bottom/bottomnav.dart';
import 'package:mynewsapp/repository/screens/home/homescreen.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinbloc.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinstates.dart';
import 'package:mynewsapp/repository/screens/login/controllers/signincontroller.dart';
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
                color: const Color(0XFF1F41BB)),
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
                      color: const Color(0XFF1F41BB))
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<SignInBloc, SignInStates>(
              listener: (context, state) {
                if (state is SignInLoadedState) {
                  UiHelper.CustomSnackBar(
                      text: state.signInModel.message.toString(),
                      context: context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const BottomNavScreen()));
                } else if (state is SignInErrorState) {
                  UiHelper.CustomSnackBar(
                      text: state.error.toString(), context: context);
                }
              },
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return UiHelper.CustomButton(
                    callback: () {
                      SignInController.signIn(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                          context: context);
                    },
                    text: "Sign In");
              },
            )
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
        color: const Color(0XFF000000),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
