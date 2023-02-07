import 'package:get/get.dart';
import 'package:getx_clean_architechture/TDD/domain/entities/User.dart';
import 'package:getx_clean_architechture/TDD/domain/usecases/getUserRepository.dart';

class UserController extends GetxController {
  List<User>? listUserNormal;
  List<User> get getListUserListNormal => listUserNormal!;

  String? isError;
  String get getError => isError!;

  GetUserRepository? getUserRepository;
  UserController(this.getUserRepository) : super();

  @override
  onInit() {
    super.onInit();
    getUserData("");
  }

  getUserData(String keyword) async {
    final result = await getUserRepository!.execute(keyword);
    result.fold(
      (failure) {
        isError = failure;
        listUserNormal = [];
      },
      (data) {
        listUserNormal = data;
      },
    );
    update();
  }
}
