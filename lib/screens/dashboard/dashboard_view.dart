import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikipedia/screens/dashboard/home/home_view.dart';
import 'package:pikipedia/screens/dashboard/profile/profile.dart';

import '../../resources/resources.dart';
import '../../routes/app_routes.dart';
import 'dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: R.colors.theme,
        elevation: 0,
        title: Text(
          "Pikipedia",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
                color: Colors.black, letterSpacing: .5, fontSize: 40),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.signupScreen);
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        // onPageChanged: controller.onPageChanged,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        key: controller.bottomBarKey,
        backgroundColor: R.colors.theme,
        items: const [
          TabItem(icon: FontAwesomeIcons.home, title: 'Home'),
          TabItem(icon: FontAwesomeIcons.userCircle, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int index) => {
          controller.pageController.jumpToPage(index),
        },
      ),
    );
  }
}
