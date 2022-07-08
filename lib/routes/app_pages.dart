import 'package:get/route_manager.dart';
import 'package:pikipedia/screens/dashboard/dashboard_view.dart';

import '../screens/auth/auth_binding.dart';
import '../screens/auth/view/auth_view.dart';
import '../screens/auth/view/registration_successfull.dart';
import '../screens/dashboard/dashboard_binding.dart';
import '../screens/landing_pages/splash/view/first_splash.dart';
import '../screens/landing_pages/splash/view/splash.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.initialSplash,
      page: () => const FirstSplash(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.registrationSuccessFull,
      page: () => const RegistrationSuccessFull(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
