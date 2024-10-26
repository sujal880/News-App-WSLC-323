import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinbloc.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinevents.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class SignInController {
  static signIn(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (email == "" || password == "") {
      return UiHelper.CustomSnackBar(
          text: "Enter Required Field's", context: context);
    } else {
      BlocProvider.of<SignInBloc>(context)
          .add(SignInUserEvents(email: email, password: password));
    }
  }
}
