import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewsapp/main.dart';
import 'package:mynewsapp/repository/widgets/uihelper.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              UiHelper.CustomSearchTextField(
                  controller: searchController,
                  text: "Search News",
                  callback: () {}),
              SizedBox(
                width: 20.w,
              ),
              Icon(Icons.notification_add_rounded)
            ],
          )
        ],
      ),
    ));
  }
}
