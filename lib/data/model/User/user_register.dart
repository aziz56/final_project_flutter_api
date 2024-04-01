class UserRegister{
  String username;

  String password;
 

  UserRegister({
    required this.username,

    required this.password,

  });

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
    username: json["username"],

    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,

    "password": password,

  };
}