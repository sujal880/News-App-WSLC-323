import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/data/remote/apihelper.dart';
import 'package:mynewsapp/repository/screens/onboarding/onboardingscreen.dart';
import 'package:mynewsapp/repository/screens/signup/blocs/signupbloc.dart';

import 'repository/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignUpBloc(apiHelper: ApiHelper()))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              fontFamily: "regular",
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0XFF1F41BB)),
              useMaterial3: false,
            ),
            home: SplashScreen()),
      ),
    );
  }
}
