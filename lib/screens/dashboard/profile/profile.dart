import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';
import '../../../resources/sized_box.dart';
import '../../../widgets/loader.dart';
import '../../auth/controller/auth_controller.dart';
import '../home/home_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  HomeController controller = Get.find<HomeController>();
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
                  Column(
                    children: [
                      h5,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              authController.imagePickerDialog(context, true);
                            },
                            child: Stack(
                              children: [
                                CircularProfileAvatar(
                                  (authController.appUser?.image)!,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeHolder: (context, url) => const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(),
                                  ),
                                  radius: 50.sp,
                                  backgroundColor: Colors.transparent,
                                  borderWidth: 2,
                                  borderColor: R.colors.whiteColor,
                                  imageFit: BoxFit.fill,
                                  elevation: 0,
                                  onTap: () {},
                                  cacheImage: true,
                                  showInitialTextAbovePicture: false,
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 20.sp,
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color:
                                                  Colors.black.withOpacity(.1))
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          h5,
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${authController.appUser?.fullName!}",
                              style: R.textStyle.semiBoldPoppins().copyWith(
                                  fontSize: 8.w, color: R.colors.black2),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${authController.appUser?.email!}",
                              style: R.textStyle
                                  .regularPoppins()
                                  .copyWith(fontSize: 6.w, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          h1,
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget service(int index, String text) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: '$index. ',
              style: R.textStyle
                  .mediumPoppins()
                  .copyWith(fontSize: 12.sp, color: R.colors.theme),
              children: <TextSpan>[
                TextSpan(
                    text: text,
                    style: R.textStyle
                        .regularPoppins()
                        .copyWith(fontSize: 12.sp, color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      })
              ]),
        ),
      ],
    );
  }
}
