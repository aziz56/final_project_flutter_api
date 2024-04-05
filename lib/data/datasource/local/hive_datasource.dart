import 'package:final_project_flutter_api/data/model/User/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataSource {
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserAdapter());
    await Hive.openBox<User>('userBox');
  }
}
