import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/data/remote/apihelper.dart';
import 'package:mynewsapp/data/remote/urls.dart';
import 'package:mynewsapp/domain/constants/appprefs.dart';
import 'package:mynewsapp/domain/models/signinmodel.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinevents.dart';
import 'package:mynewsapp/repository/screens/login/blocs/signinstates.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  ApiHelper apiHelper;
  SignInBloc({required this.apiHelper}) : super(SignInInitialState()) {
    on<SignInUserEvents>((event, emit) async {
      emit(SignInLoadingState());
      try {
        final responsedata = await apiHelper.postapi(
            url: BaseUrls.signin,
            bodyparams: {"email": event.email, "password": event.password});
        await AppPrefs().setbool();
        String token = responsedata['token'];
        await AppPrefs().setToken(token);
        log(token);
        final signinModel = SignInModel.fromJson(responsedata);
        emit(SignInLoadedState(signInModel: signinModel));
      } catch (ex) {
        emit(SignInErrorState(error: ex.toString()));
      }
    });
  }
}
