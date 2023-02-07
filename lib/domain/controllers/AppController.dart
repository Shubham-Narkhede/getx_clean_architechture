import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/ModelUser.dart';
import '../../data/resource/getUserData.dart';

class AppController extends GetxController {
  late Worker worker;

  dynamic listUser = <ModelUser>[].obs;
  RxBool checkIsLoading = true.obs;
  List<ModelUser> get getListUser => listUser.value;

  RxBool get isLoading => checkIsLoading;

  List<ModelUser> listUserNormal = <ModelUser>[];
  List<ModelUser> get getListUserListNormal => listUserNormal;

  bool isLoadingNormal = true;
  bool get getIsLoadingNormal => isLoadingNormal;

  @override
  void onInit() {
    getData();
    getDataTemp();
    super.onInit();
  }

  void getData() async {
    await UserData.instance.getUserData().then((value) {
      dynamic data = jsonDecode(value.body);
      if (data.isEmpty) {
        checkIsLoading.value = false;
        listUser = [];
      } else {
        checkIsLoading.value = false;
        data.forEach((v) {
          listUser.add(ModelUser.fromJson(v));
        });
      }
    });
  }

  void getDataTemp() async {
    await UserData.instance.getUserData().then((value) {
      dynamic data = jsonDecode(value.body);
      if (data.isEmpty) {
        isLoadingNormal = false;
        listUserNormal = [];
      } else {
        isLoadingNormal = false;
        data.forEach((v) {
          listUserNormal.add(ModelUser.fromJson(v));
        });
      }
      update();
    });
  }

  void postData() async {
    await UserData.instance.postUserData().then((value) {
      dynamic data = jsonDecode(value.body);
    }).catchError((onError) {
      Get.showSnackbar(const GetSnackBar(
        title: "Test",
        message: "Test",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      ));
    });
  }

  void disposeWorker() {
    worker.dispose();
  }
}
