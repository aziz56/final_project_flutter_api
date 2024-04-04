//GetAllTransaksiDenganListview
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:final_project_flutter_api/presentation/screen/AddTransaksiScreen.dart';
import 'package:flutter/material.dart';
//import UseCase
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';

//import GetTransaksientity

//Make a stateless widget that fetch data from use case

import 'package:flutter/material.dart';

// class TransaksiView extends StatelessWidget {

//   var getTransaksiUseCase = GetTransaksiUseCase();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEFEFEF), // Retro background color
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 217, 2, 224), // Retro app bar color
//         title: Text(
//           'Transaksi',
//           style: TextStyle(
//             fontFamily: 'RetroFont', // Custom retro font family
//             fontSize: 24.0,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<GetTransaksiModel>>(
//         future: getTransaksiUseCase.execute(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent), // Retro color for progress indicator
//               ),
//             );
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final GetTransaksiModel transaksi = snapshot.data![index];
//                 return Card(
//                   color: Colors.grey[300], // Retro card color
//                   elevation: 3.0, // Retro card elevation
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Retro card margin
//                   child: ListTile(
//                     title: Text(
//                       transaksi.namaPelanggan,
//                       style: TextStyle(
//                         fontFamily: 'RetroFont', // Custom retro font family
//                         fontSize: 18.0,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Menu: ${transaksi.namaMenu}\n'
//                       'Harga: ${transaksi.hargaMenu}\n'
//                       'Total: ${transaksi.totalPenjualan}',

//                       style: TextStyle(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'Error',
//                 style: TextStyle(
//                   fontFamily: 'RetroFont', // Custom retro font family
//                   fontSize: 20.0,
//                   color: Colors.red, // Retro error text color
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//        //MaterialPageRoute(builder: (context) => AddTransaksiView()),
//         },
//         child: Icon(Icons.add), // Icon tambah
//         backgroundColor: Colors.green, // Warna latar belakang FAB
//       ),
//     );
//   }
// }

// class TransaksiListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Transaksi'),
//       ),
//       body: Consumer<TransaksiProvider>(
//         builder: (context, provider, child) {
//           return FutureBuilder<List<GetTransaksiModel>>(
//             future: provider.fetchTransaksi(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 final List<GetTransaksiModel> transaksiList = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: transaksiList.length,
//                   itemBuilder: (context, index) {
//                     final GetTransaksiModel transaksi = transaksiList[index];
//                     return ListTile(
//                       title: Text(transaksi.namaPelanggan),
//                       subtitle: Text('Menu: ${transaksi.namaMenu}, Total: ${transaksi.totalPenjualan}'),
//                       // You can display other details as per your requirement
//                     );
//                   },
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// class TransaksiListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Transaksi'),
//       ),
//       body: Consumer<TransaksiProvider>(
//         builder: (context, provider, child) {
//           return FutureBuilder<List<GetTransaksiModel>>(
//             future: provider.fetchTransaksi(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 final List<GetTransaksiModel> transaksiList = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: transaksiList.length,
//                   itemBuilder: (context, index) {
//                     final GetTransaksiModel transaksi = transaksiList[index];
//                     return ListTile(
//                       title: Text(transaksi.namaPelanggan),
//                       subtitle: Text('Menu: ${transaksi.namaMenu}, Total: ${transaksi.totalPenjualan}'),
//                       // You can display other details as per your requirement
//                     );
//                   },
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class TransaksiView extends StatelessWidget {
  var getTransaksiUseCase = GetTransaksiUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF), // Retro background color
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 217, 2, 224), // Retro app bar color
        title: Text(
          'Transaksi',
          style: TextStyle(
            fontFamily: 'RetroFont', // Custom retro font family
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GetTransaksiModel>>(
        future: getTransaksiUseCase.execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orangeAccent), // Retro color for progress indicator
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: snapshot.data!.map((transaksi) {
                  return Container(
                    width: 200, // Lebar kartu horizontal
                    child: Card(
                      color: Colors.grey[300], // Retro card color
                      elevation: 3.0, // Retro card elevation
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0), // Retro card margin
                      child: ListTile(
                        title: Text(
                          transaksi.namaPelanggan,
                          style: TextStyle(
                            fontFamily: 'RetroFont', // Custom retro font family
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Text(
                          'Menu: ${transaksi.namaMenu}\n'
                          'Harga: ${transaksi.hargaMenu}\n'
                          'Total: ${transaksi.totalPenjualan}',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Error',
                style: TextStyle(
                  fontFamily: 'RetroFont', // Custom retro font family
                  fontSize: 20.0,
                  color: Colors.red, // Retro error text color
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          await MaterialPageRoute(builder: (context) => AddTransaksiScreen());
        },
        child: Icon(Icons.add), // Icon tambah
        backgroundColor: Colors.green, // Warna latar belakang FAB
      ),
    );
  }
}
