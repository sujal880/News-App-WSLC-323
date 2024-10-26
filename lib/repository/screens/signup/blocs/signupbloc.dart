import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/data/remote/apihelper.dart';
import 'package:mynewsapp/data/remote/urls.dart';
import 'package:mynewsapp/domain/models/signupmodel.dart';
import 'signupevents.dart';
import 'signupstates.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  ApiHelper apiHelper;
  SignUpBloc({required this.apiHelper}) : super(SignUpInitialStates()) {
    on<SignUpUserEvents>((event, emit) async {
      emit(SignUpLoadingStates());
      try {
        final responsedata = await apiHelper.postapi(
            url: BaseUrls.signup,
            bodyparams: {
              "email": event.email,
              "password": event.password,
              "username": event.username
            });
        final signupModel = SignUpModel.fromJson(responsedata);
        emit(SignUpLoadedStates(signUpModel: signupModel));
      } catch (ex) {
        emit(SignUpErrorStates(error: ex.toString()));
      }
    });
  }
}
