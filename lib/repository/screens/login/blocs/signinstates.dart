import 'package:mynewsapp/domain/models/signinmodel.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInLoadedState extends SignInStates {
  SignInModel signInModel;
  SignInLoadedState({required this.signInModel});
}

class SignInErrorState extends SignInStates {
  String error;
  SignInErrorState({required this.error});
}
