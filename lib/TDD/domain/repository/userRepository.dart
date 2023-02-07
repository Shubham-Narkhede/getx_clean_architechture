import 'package:dartz/dartz.dart';
import 'package:getx_clean_architechture/TDD/domain/entities/User.dart';

abstract class UserRepository {
  Future<Either<dynamic, List<User>>> getUserInfo(String keyword);
}
