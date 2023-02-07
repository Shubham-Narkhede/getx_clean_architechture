import 'package:dartz/dartz.dart';
import 'package:getx_clean_architechture/TDD/data/datasource/networkDataSource.dart';
import 'package:getx_clean_architechture/TDD/domain/entities/User.dart';
import 'package:getx_clean_architechture/TDD/domain/repository/userRepository.dart';

class UserRepositoryImpl implements UserRepository {
  NetworkDataSource networkDataSource;
  UserRepositoryImpl({required this.networkDataSource});
  @override
  Future<Either<dynamic, List<User>>> getUserInfo(String keyword) async {
    try {
      final response = await networkDataSource.getUserData(keyword);
      List<User> list = [];

      response.forEach((element) {
        list.add(element.toEntity());
      });

      return Right(list);
    } catch (error) {
      return Left("$error");
    }
  }
}
