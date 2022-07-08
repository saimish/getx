import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/my_button.dart';

class RegistrationSuccessFull extends StatefulWidget {
  const RegistrationSuccessFull({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessFull> createState() =>
      _RegistrationSuccessFullState();
}

class _RegistrationSuccessFullState extends State<RegistrationSuccessFull> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(R.images.thanks),
              Text(
                "Please verify your email through the link sent to your email address.",
                style: R.textStyle.semiBoldPoppins(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: () {
                  Get.offAllNamed(Routes.signupScreen);
                },
                buttonText: "Go to Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
