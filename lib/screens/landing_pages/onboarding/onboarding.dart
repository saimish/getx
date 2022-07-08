import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/resources.dart';
import '../../../resources/sized_box.dart';
import '../../../routes/app_routes.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: R.colors.theme,
              image: DecorationImage(image: AssetImage(R.images.doc1))),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: Get.height * .27,
            width: Get.width,
            decoration: BoxDecoration(
              color: R.colors.theme,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * .01),
                  child: Text(
                    "Select Your Role",
                    style: R.textStyle.boldPoppins(),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [card(0), w3, card(1)]),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget card(int id) {
    return InkWell(
      onTap: () {
        switch (id) {
          case 0:
            Get.offAllNamed(Routes.signupScreen);
            break;
          case 1:
            Get.offAllNamed(Routes.signupScreen);
            break;
        }
      },
      child: Container(
        height: Get.height * .16,
        width: Get.height * .16,
        padding: EdgeInsets.all(Get.height * .02),
        decoration: BoxDecoration(
          color: R.colors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              id == 0 ? R.images.patient : R.images.doctor,
              scale: 4,
            ),
            Text(
              id == 0 ? "Patient" : 'Doctor',
              style:
                  R.textStyle.semiBoldPoppins().copyWith(color: R.colors.theme),
            )
          ],
        ),
      ),
    );
  }
}
