import 'dart:convert';

import 'package:getx_clean_architechture/TDD/data/failure.dart';
import 'package:getx_clean_architechture/TDD/data/model/userModel.dart';
import 'package:http/http.dart' as http;

abstract class NetworkDataSource {
  Future<List<UserModel>> getUserData(String keyword);
}

class NetworkDataSourceImpl implements NetworkDataSource {
  List<UserModel>? list;
  @override
  Future<List<UserModel>> getUserData(String keyword) async {
    final response = await http.get(Uri.parse(keyword.isEmpty
        ? "https://api.github.com/users/freeCodeCamp/repos"
        : "https://api.github.com/search/repositories?q=$keyword"));

    if (response.statusCode == 200) {
      list = [];

      dynamic data = json.decode(response.body);

      keyword.isEmpty
          ? data.forEach((v) {
              list!.add(UserModel.fromJson(v));
            })
          : data['items'].forEach((v) {
              list!.add(UserModel.fromJson(v));
            });
      return list!;
    } else {
      throw ServerFailure(response.reasonPhrase.toString());
    }
  }
}
