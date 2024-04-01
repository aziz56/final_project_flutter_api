class AuthenticationModel {
  String username;
  String token;

  AuthenticationModel({
    required this.username,
    required this.token,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => AuthenticationModel(
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "token": token,
  };
}