import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_clean_architechture/TDD/data/repository/userRepositoryImpl.dart';
import 'package:getx_clean_architechture/TDD/domain/usecases/getUserRepository.dart';
import 'package:getx_clean_architechture/TDD/presentation/controllers/userController.dart';

import '../../TDD/data/datasource/networkDataSource.dart';
import '../controllers/AppController.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);

    Get.lazyPut(
        () => UserRepositoryImpl(
            networkDataSource: Get.find<NetworkDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => NetworkDataSourceImpl(), fenix: true);

    Get.lazyPut(() => GetUserRepository(Get.find<UserRepositoryImpl>()),
        fenix: true);
    Get.put(UserController(Get.find<GetUserRepository>()), permanent: true);
  }
}
