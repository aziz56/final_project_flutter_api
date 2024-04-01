class AuthModel {
  String username;
  String token;

  AuthModel({
    required this.username,
    required this.token,
  });


  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "token": token,
  };
}