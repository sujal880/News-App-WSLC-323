import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/repository/screens/signup/blocs/signupbloc.dart';
import 'package:mynewsapp/repository/screens/signup/blocs/signupevents.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class SignUpController {
  static signup(
      {required String email,
      required String password,
      required String username,
      required BuildContext context}) {
    if (email == "" || password == "" || username == "") {
      return UiHelper.CustomSnackBar(
          text: "Enter Required Field's", context: context);
    } else {
      BlocProvider.of<SignUpBloc>(context).add(SignUpUserEvents(
          email: email, password: password, username: username));
    }
  }
}
