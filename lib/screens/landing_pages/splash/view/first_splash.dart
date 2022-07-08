import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pikipedia/screens/landing_pages/splash/view/splash.dart';

import '../../../../resources/resources.dart';

class FirstSplash extends StatefulWidget {
  static String route = "/firstSplash";

  const FirstSplash({Key? key}) : super(key: key);
  @override
  _FirstSplashState createState() => _FirstSplashState();
}

class _FirstSplashState extends State<FirstSplash>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  );
  Animation<double>? scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Timer(Duration(milliseconds: 1000), () {
        setState(() {
          _opacity = 1.0;
          _value = false;
        });
      });
      await scaleController.forward();
    });

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          Splash2(
            route: const Splash(),
          ),
        );
        // Get.off(OnBoardingScreen());
      },
    );
    scaleAnimation = Tween<double>(begin: Get.width, end: 1.0).animate(
        CurvedAnimation(
            parent: scaleController, curve: const Interval(0.1, 0.7)));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.whiteColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 5,
              height: 5,
              decoration:
                  BoxDecoration(color: R.colors.theme, shape: BoxShape.circle),
              child: AnimatedBuilder(
                animation: scaleAnimation!,
                builder: (c, child) => Transform.scale(
                  scale: scaleAnimation!.value,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: R.colors.theme,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Splash2 extends PageRouteBuilder {
  final Widget? page;
  final Widget route;

  Splash2({this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
