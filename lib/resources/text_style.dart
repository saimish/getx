import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';

class AppTextStyle {
  ///textstyles
  TextStyle regularPoppins() {
    return TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Poppins',
      letterSpacing: 0.05,
      color: R.colors.whiteColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle semiBoldPoppins() {
    return TextStyle(
      fontSize: 12.sp,
      letterSpacing: 0,
      fontFamily: 'Poppins',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle boldPoppins() {
    return TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Poppins',
      letterSpacing: 0,
      color: R.colors.whiteColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mediumPoppins() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle lightPoppins() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle regularNunito() {
    return TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Nunito Sans',
      color: R.colors.whiteColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle semiBoldNunito() {
    return TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Nunito Sans',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle boldNunito() {
    return TextStyle(
      fontSize: 29.sp,
      fontFamily: 'Nunito Sans',
      color: R.colors.blackColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mediumNunito() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Nunito Sans',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle lightNunito() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle regularInter() {
    return TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Inter',
      letterSpacing: 0.05,
      color: R.colors.whiteColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle semiBoldInter() {
    return TextStyle(
      fontSize: 20.sp,
      letterSpacing: 0,
      fontFamily: 'Inter',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle boldInter() {
    return TextStyle(
      fontSize: 29.sp,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mediumInter() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle lightInter() {
    return TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      color: R.colors.blackColor,
      fontWeight: FontWeight.w300,
    );
  }
}
