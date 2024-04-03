import 'dart:convert';
import 'package:final_project_flutter_api/data/model/User/auth_model.dart';
import 'package:final_project_flutter_api/data/model/User/user.dart';
import 'package:http/http.dart' as http;
import 'package:final_project_flutter_api/data/datasource/local/hive_datasource.dart';
import 'package:hive/hive.dart';
class AuthRemoteDataSource {
  HiveDataSource hiveDataSource = HiveDataSource();
  final String baseUrl = 'http://localhost:5262/api/';
  Future<AuthModel> login(String username, String password) async 
  {
    var response = await http.post(Uri.parse(baseUrl + 'Users/login'),
        headers: 
        {
          'accept': '*/*',
          'Content-Type': 'application/json'
          
        },
        body: jsonEncode
        ({
          'username': username,
          'password': password,
        })
    );
    print('this is from authremote ${response.statusCode}');
    print('this is from authremote ${response.body}');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      AuthModel authModel = AuthModel.fromJson(data);
      // Store the user login information in the Hive box
      final box = Hive.box<User>('userBox');
      User user = User(
        username: authModel.username,
        token: authModel.token,
      );
      await box.put('user', user);
      return authModel;
    } else {
      throw Exception('Failed to login');
    }
  }
}

