class UserRegisterReponse {
  String username;
  String password;
  

  UserRegisterReponse({
    required this.username,
    required this.password
  });

  factory UserRegisterReponse.fromJson(Map<String, dynamic> json) =>
      UserRegisterReponse(
        username: json["username"],
        password: json["password"]
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password
      };
}
