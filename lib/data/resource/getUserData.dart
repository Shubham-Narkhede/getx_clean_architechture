import 'package:http/http.dart' as http;

class UserData {
  UserData._();

  static final instance = UserData._();

  Future<dynamic> getUserData() async {
    return await http
        .get(Uri.parse("https://api.github.com/users/freeCodeCamp/repos"));
  }

  Future<dynamic> postUserData() async {
    return await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: {
          "title": "test"
        });
  }
}
