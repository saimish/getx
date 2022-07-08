import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final double? height;
  final String? text;
  final String? buttonText;

  final Color? color;
  final Function? onConfirm;
  const AppDialog(
      {Key? key,
      required this.title,
      required this.text,
      this.color,
      this.height,
      this.buttonText,
      this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 90.w,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Material(
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  title!,
                  style: R.textStyle.boldPoppins().copyWith(
                        color: R.colors.theme,
                        fontSize: 20.sp,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    text!,
                    style: R.textStyle
                        .semiBoldPoppins()
                        .copyWith(color: Colors.grey, fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    color: R.colors.whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 75),
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "OK",
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
