import 'package:get/get.dart';

import '../domain/controllers/AppController.dart';

class Utils {
  static AppController appController = Get.find();

  MyApplication() {
    if (appController == null) {
      appController = Get.find();
    }
  }

  static AppController get getAppController {
    return appController;
  }
}
