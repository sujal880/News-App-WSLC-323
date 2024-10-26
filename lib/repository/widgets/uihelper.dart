import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static CustomImage({required String url}) {
    return Image.asset("assets/images/$url");
  }

  static CustomText(
      {required String text,
      Color? color,
      String? fontfamily,
      FontWeight? fontweight,
      double? fontsize}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize ?? 12.sp,
          color: color ?? const Color(0XFF0000000),
          fontFamily: fontfamily ?? "regular",
          fontWeight: fontweight ?? FontWeight.normal),
    );
  }

  static CustomButton(
      {required VoidCallback callback,
      Color? textcolor,
      double? height,
      double? width,
      Color? buttoncolor,
      required String text}) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? 325.w,
      child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w)),
              backgroundColor: buttoncolor ?? const Color(0XFF1F41BB)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "regular",
                color: textcolor ?? const Color(0XFFFFFFFF)),
          )),
    );
  }

  static CustomTextField(
      {required TextEditingController controller,
      required String text,
      required bool toHide,
      required TextInputType textinput}) {
    return Container(
      height: 50.h,
      width: 330.w,
      decoration: BoxDecoration(
          color: const Color(0XFFF1F4FF),
          border: Border.all(color: const Color(0XFF1F41BB)),
          borderRadius: BorderRadius.circular(7.w)),
      child: Padding(
        padding: EdgeInsets.only(left: 14.w, top: 5.h),
        child: TextField(
          keyboardType: textinput,
          controller: controller,
          obscureText: toHide,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(
                  color: const Color(0XFF626262),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none),
        ),
      ),
    );
  }

  static CustomTextButton(
      {required VoidCallback callback,
      required String text,
      required double fontsize,
      Color? color}) {
    return TextButton(
        onPressed: () {
          callback();
        },
        child: Text(text,
            style: TextStyle(
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
              fontFamily: "bold",
              color: color ?? const Color(0XFF000000),
            )));
  }

  static CustomSnackBar({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Color(0XFF1F41BB),
    ));
  }
}
