import 'package:final_project_flutter_api/data/datasource/remote/register_remote_datasource.dart';
import 'package:final_project_flutter_api/data/model/User/user_register.dart';
import 'package:final_project_flutter_api/data/model/User/user_register_response.dart';

class RegisterRepository{
  final _registerRemoteDataSource = RegisterRemoteDataSource();

  Future<UserRegisterReponse> register(UserRegister userRegister) async {
    try {
      return _registerRemoteDataSource.register(userRegister);
    } catch (e) {
      rethrow;
    }
  }
}