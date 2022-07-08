import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class DashboardController extends GetxController {
  // * instances
  // final NotificationProvider _notificationProvider = NotificationProvider();
  // final UserProvider _userProvider = UserProvider();
  // * set initial index 2 so the dashboard starts from home screen.
  DashboardController() : pageController = PageController(initialPage: 0);

  // * varaibles
  final GlobalKey<ConvexAppBarState> bottomBarKey =
      GlobalKey<ConvexAppBarState>();

  //* Use this variable to navigate the pages of PageView.
  final PageController pageController;

  // * observable varaible for storing app bar title
  final _appbarTitle = "Home".obs;
  get appbarTitle => _appbarTitle.value;
  set appbarTitle(value) => _appbarTitle.value = value;

  // * methods
  @override
  onInit() async {
    super.onInit();
    // _notificationProvider.setForegroundNotificationSettingIOS();
    // _notificationProvider.listenInitialMessage();
    // _notificationProvider.listenForegroundNotification();
    // _notificationProvider.listenBackgroundNotification();

    // String? token = await FirebaseMessaging.instance.getToken();
    // if (kDebugMode) {
    //   print(token);
    // }
  }

  onSearchTap() {
    Get.toNamed(Routes.searchScreen);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // * drawer things start from here

  // * observable

  // * methods
  onSettingsTap() {
    Get.toNamed(Routes.settingsScreen);
  }

  onPrivacyPolicyTap() {
    Get.toNamed(Routes.privacyPolicyScreen);
  }

  onAboutUsTap() {
    Get.toNamed(Routes.aboutUsScreen);
  }

  onFAQTap() {
    Get.toNamed(Routes.fAQScreen);
  }

  // onLogoutTap() {
  //   Get.find<AuthController>().logout();
  // }

// * drawer things ends here.
}
