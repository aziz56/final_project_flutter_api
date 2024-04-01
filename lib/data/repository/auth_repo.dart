import 'package:final_project_flutter_api/data/datasource/remote/auth_remote_datasource.dart';
import 'package:final_project_flutter_api/data/model/User/auth_model.dart';

class AuthRepository {
  var authRemoteDataSource = AuthRemoteDataSource();

  Future<AuthModel> login(String username, String password) async {
    try {
      AuthModel authModel =
          await authRemoteDataSource.login(username, password);
      return authModel;
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
