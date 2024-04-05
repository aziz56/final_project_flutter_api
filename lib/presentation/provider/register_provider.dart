import 'package:final_project_flutter_api/Domain/entities/user_registerentity.dart';
import 'package:final_project_flutter_api/Domain/usecases/user_register_usecase.dart';
import 'package:final_project_flutter_api/data/model/User/user_register_response.dart';
import 'package:flutter/material.dart';

class UserRegisterProvider extends ChangeNotifier{
  final _userRegisterUsecase = UserRegisterUsecase();


  Future<UserRegisterReponse> register(UserRegisterEntity userRegisterEntity) async {
    try {
      var response = await _userRegisterUsecase.register(userRegisterEntity);
      notifyListeners();
      return response;
    } catch (e) {
      rethrow;
    }
  }

}