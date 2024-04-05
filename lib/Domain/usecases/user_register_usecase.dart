import 'package:final_project_flutter_api/Domain/entities/user_registerentity.dart';
import 'package:final_project_flutter_api/data/model/User/user_register.dart';
import 'package:final_project_flutter_api/data/model/User/user_register_response.dart';
import 'package:final_project_flutter_api/data/repository/register_repository.dart';

class UserRegisterUsecase{
  final _userRegisterRepository = RegisterRepository();

  Future<UserRegisterReponse> register(UserRegisterEntity userRegisterEntity) async {
    try {
      var userRegisterModel = UserRegister(
        username: userRegisterEntity.username,
        password: userRegisterEntity.password,
      );
      return _userRegisterRepository.register(userRegisterModel);
    } catch (e) {
      rethrow;
    }
  }
}