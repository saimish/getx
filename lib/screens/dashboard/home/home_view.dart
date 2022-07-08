import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pikipedia/widgets/my_button.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';
import '../../../resources/sized_box.dart';
import '../../../widgets/loader.dart';
import '../../auth/controller/auth_controller.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.find<HomeController>();
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return ModalProgressHUD(
        inAsyncCall: authController.isLoading,
        progressIndicator: MyLoader(),
        child: Scaffold(
          backgroundColor: R.colors.theme,
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                color: R.colors.lite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h1,
                  Text(
                    'Hello ${authController.appUser?.fullName}',
                    style:
                        R.textStyle.mediumPoppins().copyWith(fontSize: 15.sp),
                  ),
                  h1,
                  Text(
                    'Welcome back',
                    style: R.textStyle
                        .boldPoppins()
                        .copyWith(color: R.colors.blackColor),
                  ),
                  if (authController.pickedFile != null)
                    Image.file((authController.pickedFile)!)
                  else
                    Image.asset(R.images.graph),
                  h5,
                  MyButton(
                      onTap: () {
                        authController.imagePickerDialog(context, false);
                      },
                      buttonText: "pick image"),
                  h5,
                  MyButton(onTap: () {

                    authController.uploadImage();

                  }, buttonText: "Search"),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
