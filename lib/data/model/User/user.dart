import 'package:hive/hive.dart';
part 'user.g.dart';


@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String token;
  User({
    required this.username,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        token: json["token"],
      );
}
