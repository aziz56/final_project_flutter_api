
import 'package:final_project_flutter_api/Domain/usecases/login_usecase.dart';
import 'package:final_project_flutter_api/data/datasource/local/hive_datasource.dart';
import 'package:final_project_flutter_api/data/model/User/user.dart';
import 'package:final_project_flutter_api/presentation/provider/DashboardProvider.dart';

import 'package:final_project_flutter_api/presentation/provider/auth_provider.dart';
import 'package:final_project_flutter_api/presentation/provider/register_provider.dart';

import 'package:final_project_flutter_api/presentation/screen/DashBoardScreen.dart';

import 'package:final_project_flutter_api/presentation/screen/login_screen.dart';


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

// void main() async{
//   HiveDataSource hiveDataSource = HiveDataSource();
//   await hiveDataSource.init();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider(LoginUsecase())),
//         ChangeNotifierProvider(create:(_) => UserRegisterProvider()),
//         ChangeNotifierProvider(create: (_) => DashBoardProvider()),
//         // ChangeNotifierProvider(create:(_) => GetAllTransaksiProvider(GetTransaksiUseCase())),
        
//         // ChangeNotifierProvider(create: (_) => GetAllTransaksiProvider())
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           // primarySwatch: Colors.blue,
//           // colorScheme: ColorScheme.fromSwatch(
//           //   primarySwatch: Colors.blue,
//           // ).copyWith(secondary: Colors.red),
//           // textTheme: const TextTheme(
//           //   headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           // ),
//       ),
     
//       home: LoginScreen(),
//     ));
//   }
// }
void main() async {
  HiveDataSource hiveDataSource = HiveDataSource();
  await hiveDataSource.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(LoginUsecase())),
        ChangeNotifierProvider(create: (_) => UserRegisterProvider()),
        ChangeNotifierProvider(create: (_) => DashBoardProvider()),
        // ChangeNotifierProvider(create: (_) => GetAllTransaksiProvider(GetTransaksiUseCase())),
        // ChangeNotifierProvider(create: (_) => GetAllTransaksiProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          // colorScheme: ColorScheme.fromSwatch(
          //   primarySwatch: Colors.blue,
          // ).copyWith(secondary: Colors.red),
          // textTheme: const TextTheme(
          //   headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          // ),
        ),
        home: const MainScreen(), // Menjadikan MainScreen sebagai halaman utama
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == true) {
              return DashBoardScreen(); // Ganti dengan halaman dashboard Anda
            } else {
              return LoginScreen(); // Ganti dengan halaman login Anda
            }
          }
        },
      ),
      // bottomNavigationBar: BottomNavigation(), // Menambahkan bottom navigation bar
    );
  }

  Future<bool> checkLogin() async {
    final box = Hive.box<User>('userBox');
    print('box.isNotEmpty: ${box.isNotEmpty}');
    return box.isNotEmpty;
  }
}
