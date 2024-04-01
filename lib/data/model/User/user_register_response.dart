class UserRegisterReponse {
  String username;


  UserRegisterReponse({
    required this.username,
 
  });

  factory UserRegisterReponse.fromJson(Map<String, dynamic> json) => UserRegisterReponse(
    username: json["username"],
 
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}