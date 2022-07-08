import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/resources.dart';
import '../../../auth/controller/auth_controller.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1400),
    vsync: this,
  );

  Animation<double>? scale;
  Animation<Offset>? position;
  bool isFirstScreen = true;
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await _controller.forward();
    });
    Future.delayed(
      const Duration(seconds: 6),
      () async {
        await Get.put(AuthController()).getCurrentUser();
      },
    );
    scale = Tween<double>(begin: 0.1, end: 0.8).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.7)));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: R.colors.theme, body: page2());
  }

  Widget page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          R.images.logo,
        )),
      ],
    );
  }
}
