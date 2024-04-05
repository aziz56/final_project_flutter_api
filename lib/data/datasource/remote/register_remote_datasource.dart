import 'dart:convert';
import 'package:final_project_flutter_api/data/datasource/remote/auth_remote_datasource.dart';
import 'package:final_project_flutter_api/data/model/User/user_register.dart';
import 'package:final_project_flutter_api/data/model/User/user_register_response.dart';
import 'package:http/http.dart' as http;

class RegisterRemoteDataSource {
  final _authRemoteDataSource = AuthRemoteDataSource();
  var baseUrl = 'https://app.actualsolusi.com/bsi/pos_resto/api/';

  Future<UserRegisterReponse> register(UserRegister userRegister) async {
    var response = await http.post(Uri.parse('${baseUrl}Users/register'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'username': userRegister.username,
          'password': userRegister.password,

        })
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('this is from registerremote ${response.statusCode}');
      print('this is from registerremote ${response.body}');
      UserRegisterReponse userRegisterReponse = UserRegisterReponse.fromJson(data);
      await _authRemoteDataSource.login(userRegister.username, userRegister.password);
      return userRegisterReponse;
    } else {
      throw Exception('Failed to register');
    }
  }
}