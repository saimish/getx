import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime daySelected = DateTime.now();

  selectCalendarDate(
    DateTime day,
  ) {
    daySelected = DateTime(
      day.year,
      day.month,
      day.day,
      DateTime.now().hour,
      DateTime.now().minute,
    );
  }
}
