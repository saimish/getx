import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pikipedia/routes/app_pages.dart';
import 'package:pikipedia/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState>? navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Pikipedia",
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 320,
            defaultName: MOBILE,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(320,
                  name: MOBILE, scaleFactor: 1.0),
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(850, name: TABLET),
              const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
          );
        },
        theme: ThemeData(
          // * Create your own palette, because black is not a material color.
          primarySwatch: const MaterialColor(
            0xFF03A9F4,
            <int, Color>{
              50: Color(0xFF03A9F4),
              100: Color(0xFF03A9F4),
              200: Color(0xFF03A9F4),
              300: Color(0xFF03A9F4),
              400: Color(0xFF03A9F4),
              500: Color(0xFF03A9F4),
              600: Color(0xFF03A9F4),
              700: Color(0xFF03A9F4),
              800: Color(0xFF03A9F4),
              900: Color(0xFF03A9F4),
            },
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        getPages: AppPages.pages,
        initialRoute: Routes.initialSplash,
      );
    });
  }
}
