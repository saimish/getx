import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: .5.h),
      child: Text(
        title,
        style: R.textStyle.semiBoldPoppins(),
      ),
    );
  }
}
