// class AuthModel {
//     UserModel user;
//     String token;

//     AuthModel({
//         required this.user,
//         required this.token,
//     });

//     factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
//         user: UserModel.fromJson(json["user"]),
//         token: json["token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//         "token": token,
//     };
// }

// class UserModel {
//     String username;
//     dynamic password;
//     List<Role> roles;

//     UserModel({
//         required this.username,
//         required this.password,
//         required this.roles,
//     });

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         username: json["username"],
//         password: json["password"],
//         roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "username": username,
//         "password": password,
//         "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
//     };
// }

// class Role {
//     int roleId;
//     String roleName;

//     Role({
//         required this.roleId,
//         required this.roleName,
//     });

//     factory Role.fromJson(Map<String, dynamic> json) => Role(
//         roleId: json["roleID"],
//         roleName: json["roleName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "roleID": roleId,
//         "roleName": roleName,
//     };
// }

class AuthModel {
    String username;
    List<Role> role;
    String token;

    AuthModel({
        required this.username,
        required this.role,
        required this.token,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        role: List<Role>.from(json["role"].map((x) => Role.fromJson(x))),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "role": List<dynamic>.from(role.map((x) => x.toJson())),
        "token": token,
    };
}

class Role {
    int roleId;
    String roleName;

    Role({
        required this.roleId,
        required this.roleName,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleID"],
        roleName: json["roleName"],
    );

    Map<String, dynamic> toJson() => {
        "roleID": roleId,
        "roleName": roleName,
    };
}
