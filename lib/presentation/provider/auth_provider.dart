import 'package:final_project_flutter_api/Domain/usecases/login_usecase.dart';
import 'package:final_project_flutter_api/data/model/User/auth_model.dart';
import 'package:final_project_flutter_api/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUsecase _loginUsecase;
  AuthProvider(this._loginUsecase);
  Future<void> login(BuildContext context, String username, String password) async {
    try {
      AuthModel authModel = await _loginUsecase.login(username, password);
      if (authModel.username != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect username or password')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Credentials')),
      );
    }
    notifyListeners();
  }
}
