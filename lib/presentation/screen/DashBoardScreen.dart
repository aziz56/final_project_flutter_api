import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:final_project_flutter_api/presentation/provider/DashboardProvider.dart';
import 'package:final_project_flutter_api/presentation/screen/AddTransaksiScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class DashBoardScreen extends StatelessWidget {
//   const DashBoardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(16.0), // Tambahkan tinggi yang diinginkan
//           child: SizedBox(), // Gunakan widget kosong untuk memberikan ruang di atas judul
//         ),
//       ),
//       body: Center(
//         child: Scaffold(
//           body: Center(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Card(
//                 color: Colors.grey[300], // Warna latar belakang card
//                 elevation: 3.0, // Efek bayangan card
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Text(
//                         'Total Balance',
//                         style: TextStyle(
//                           fontFamily: 'RetroFont', // Font style retro
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black, // Warna teks retro
//                         ),
//                       ),
//                       Consumer<DashBoardProvider>(
//                         builder: (context, provider, _) {
//                           return FutureBuilder<double>(
//                             future: provider.fetchTotalBalance(),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                 return const CircularProgressIndicator();
//                               } else {
//                                 return Text(
//                                   '\$${(snapshot.data ?? 0).toString()}',
//                                   style: const TextStyle(
//                                     fontFamily: 'RetroFont', // Font style retro
//                                     fontSize: 18.0,
//                                     color: Colors.black, // Warna teks retro
//                                   ),
//                                 );
//                               }
//                             },
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 20.0),
//                       const Text(
//                         'Total Transaksi',
//                         style: TextStyle(
//                           fontFamily: 'RetroFont', // Font style retro
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black, // Warna teks retro
//                         ),
//                       ),
//                       Consumer<DashBoardProvider>(
//                         builder: (context, provider, _) {
//                           return FutureBuilder<int>(
//                             future: provider.fetchTotalTransaksi(),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                 return const CircularProgressIndicator();
//                               } else {
//                                 return Text(
//                                   '${snapshot.data ?? 0}',
//                                   style: const TextStyle(
//                                     fontFamily: 'RetroFont', // Font style retro
//                                     fontSize: 18.0,
//                                     color: Colors.black, // Warna teks retro
//                                   ),
//                                 );
//                               }
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getTransaksiUseCase = GetTransaksiUseCase();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<DashBoardProvider>(
                      builder: (context, provider, _) {
                        return FutureBuilder<double>(
                          future: provider.fetchTotalBalance(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Text(
                                '\$${snapshot.data ?? 0}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Total Transaksi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<DashBoardProvider>(
                      builder: (context, provider, _) {
                        return FutureBuilder<int>(
                          future: provider.fetchTotalTransaksi(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Text(
                                '${snapshot.data ?? 0}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Transaksi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<GetTransaksiModel>>(
                future: getTransaksiUseCase.execute(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final transaksi = snapshot.data?[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Pelanggan: ${transaksi?.namaPelanggan}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Nama Menu: ${transaksi?.namaMenu}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Harga Menu: ${transaksi?.hargaMenu}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Jumlah Pesanan: ${transaksi?.jumlahPesanan}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Total Penjualan: ${transaksi?.totalPenjualan}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTransaksiScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}