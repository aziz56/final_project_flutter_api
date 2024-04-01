import 'package:final_project_flutter_api/data/model/User/auth_model.dart';

class AuthResponse {
  final int statusCode;
  final List<AuthModel> authList;

  AuthResponse({required this.statusCode, required this.authList});
}
