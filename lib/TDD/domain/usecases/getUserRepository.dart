import 'package:dartz/dartz.dart';
import 'package:getx_clean_architechture/TDD/domain/entities/User.dart';
import 'package:getx_clean_architechture/TDD/domain/repository/userRepository.dart';

class GetUserRepository {
  late UserRepository userRepository;
  GetUserRepository(this.userRepository);

  Future<Either<dynamic, List<User>>> execute(String keyword) {
    return userRepository.getUserInfo(keyword);
  }
}
