import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/repository/screens/login/loginscreen.dart';
import 'package:mynewsapp/repository/screens/signup/blocs/signupbloc.dart';
import 'package:mynewsapp/repository/screens/signup/blocs/signupstates.dart';
import 'package:mynewsapp/repository/screens/signup/controllers/signupcontroller.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomText(
                text: "Create Account",
                fontsize: 25.sp,
                fontweight: FontWeight.w700,
                color: const Color(0XFF1F41BB)),
            SizedBox(
              height: 5.h,
            ),
            UiHelper.CustomText(
              text: "Create an account so you can explore all the",
              fontsize: 14.sp,
              fontweight: FontWeight.w700,
            ),
            UiHelper.CustomText(
              text: "existing jobs",
              fontsize: 14.sp,
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
              height: 15.h,
            ),
            UiHelper.CustomTextField(
                controller: passwordController,
                text: "Username",
                toHide: true,
                textinput: TextInputType.text),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<SignUpBloc, SignUpStates>(
              listener: (context, state) {
                if (state is SignUpLoadedStates) {
                  UiHelper.CustomSnackBar(
                      text: state.signUpModel.message.toString(),
                      context: context);
                } else if (state is SignUpErrorStates) {
                  UiHelper.CustomSnackBar(
                      text: state.error.toString(), context: context);
                }
              },
              builder: (context, state) {
                if (state is SignUpLoadingStates) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return UiHelper.CustomButton(
                    callback: () {
                      SignUpController.signup(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                          username: usernameController.text.toString(),
                          context: context);
                    },
                    text: "Sign Up");
              },
            )
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomTextButton(
        callback: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        text: "Already have an account?",
        fontsize: 14.sp,
        color: const Color(0XFF000000),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
