import 'package:get/instance_manager.dart';
import 'package:pikipedia/screens/dashboard/dashboard_controller.dart';
import 'package:pikipedia/screens/dashboard/home/home_controller.dart';

import '../auth/controller/auth_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());

    //* Initialize all the dashboard's widgets/screens controllers here, bacause we will navigate to each screen with the help of PageView, that's why we will not use the routes ways.
    //? So the question becomes, when will we initialize the controller of dashboard's screens/widgets?
    //* because if we initialize when screen will created, then we will not be able to extends GetView<Controller>, and that way we could not follow the proper getx_pattern.
    //* The best place to initialize all the pageview's screens controller is this.

    Get.put(HomeController());
    Get.put(AuthController());
  }
}
