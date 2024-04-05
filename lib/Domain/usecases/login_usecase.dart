//Make a Class Login UseCase

import 'package:final_project_flutter_api/data/model/User/auth_model.dart';
import 'package:final_project_flutter_api/data/repository/auth_repo.dart';

class LoginUsecase{
  var authRepository = AuthRepository();

  Future<AuthModel> login(String username, String password) async {
    return authRepository.login(username, password);
  }
}