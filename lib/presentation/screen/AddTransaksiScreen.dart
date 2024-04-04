// import 'package:final_project_flutter_api/data/model/AddTransaksi/AddTransaksiModel.dart';
// import 'package:final_project_flutter_api/data/model/GetTransaksi/GetModelMenu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// // class AddTransaksiScreen extends StatelessWidget {
// //   const AddTransaksiScreen({Key? key}) : super(key: key);
// //   var listAddTransaksiModel = List<AddTransaksiModel>.empty(growable: true);
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Add Transaksi'),
// //       ),
// //       body: Center(
// //         child: Card(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               Text('Add Transaksi'),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   // await provider.fetchTotalBalance();
// //                 },
// //                 child: Text('Add Transaksi'),
// //               ),
// //               // Consumer<DashBoardProvider>(
// //               //   builder: (context, provider, _) {
// //               //     return Text(
// //               //         'Total Balance: \$${provider.fetchTotalBalance()}'); // Assuming balance is an int property of TotalBalance
// //               //   },
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// // }

// class AddTransaksiScreen extends StatelessWidget {
//   final List<MenuModel> menuItems = []; // Populate this list with MenuModel items
//   final AddTransaksiModel addTransaksiModel = AddTransaksiModel(
//     namaPelanggan: '', // Initialize with empty values
//     hargaMenu: 0,
//     jumlahPesanan: 0,
//     amount: 0,
//     idMenu: 0,
//     idMeja: 0,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Transaction'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButtonFormField<int>(
//               value: addTransaksiModel.idMenu,
//               onChanged: (int? newValue) {
//                 // Update selected menu item
//                 addTransaksiModel.idMenu = newValue ?? 0;
//                 // Find corresponding menu item and update namaMenu and hargaMenu
//                 MenuModel selectedMenu = menuItems.firstWhere(
//                   (menu) => menu.idMenu == addTransaksiModel.idMenu,
//                   orElse: () => MenuModel(
//                     idMenu: 0,
//                     namaMenu: '',
//                     hargaMenu: 0,
//                     deskripsiMenu: '',
//                   ),
//                 );
//                 addTransaksiModel.namaMenu = selectedMenu.namaMenu;
//                 addTransaksiModel.hargaMenu = selectedMenu.hargaMenu;
//               },
//               items: menuItems.map<DropdownMenuItem<int>>((MenuModel menu) {
//                 return DropdownMenuItem<int>(
//                   value: menu.idMenu,
//                   child: Text(menu.namaMenu),
//                 );
//               }).toList(),
//               decoration: InputDecoration(
//                 labelText: 'Select Menu',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               initialValue: addTransaksiModel.namaMenu,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Nama Menu',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               initialValue: addTransaksiModel.hargaMenu.toString(),
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Harga Menu',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Jumlah Pesanan:'),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     // Increment jumlahPesanan
//                     addTransaksiModel.jumlahPesanan++;
//                   },
//                 ),
//                 Text(addTransaksiModel.jumlahPesanan.toString()),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 // Update amount when jumlahPesanan changes
//                 addTransaksiModel.amount =
//                     addTransaksiModel.hargaMenu * addTransaksiModel.jumlahPesanan;
//               },
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 addTransaksiModel.idMeja = int.parse(value);
//               },
//               decoration: InputDecoration(
//                 labelText: 'ID Meja',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               onChanged: (value) {
//                 addTransaksiModel.namaPelanggan = value;
//               },
//               decoration: InputDecoration(
//                 labelText: 'Nama Pelanggan',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle submitting the transaction
//                 // For example, you can pass addTransaksiModel to a method for processing
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_project_flutter_api/Domain/usecases/get_menu_usecase.dart';
import 'package:final_project_flutter_api/Domain/usecases/postTransaksiUseCase.dart';
import 'package:final_project_flutter_api/data/model/AddTransaksi/AddTransaksiModel.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetModelMenu.dart';
import 'package:final_project_flutter_api/presentation/screen/DashBoardScreen.dart';
import 'package:flutter/material.dart';

// Import models and use cases

class AddTransaksiScreen extends StatefulWidget {
  @override
  _AddTransaksiScreenState createState() => _AddTransaksiScreenState();
}

class _AddTransaksiScreenState extends State<AddTransaksiScreen> {
  final AddTransaksiUseCase addTransaksiUseCase = AddTransaksiUseCase();
  final GetAllMenuUseCase getAllMenuUseCase = GetAllMenuUseCase();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController idMejaController = TextEditingController();
  final TextEditingController namaPelangganController = TextEditingController();
  int jumlahPesanan = 0;
  MenuModel? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<MenuModel>>(
              future: getAllMenuUseCase.execute(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<MenuModel>? menus = snapshot.data;
                  return DropdownButton<MenuModel>(
                    value: selectedMenu,
                    onChanged: (value) {
                      setState(() {
                        selectedMenu = value;
                      });
                    },
                    items: menus?.map((menu) {
                      return DropdownMenuItem<MenuModel>(
                        value: menu,
                        child: Text(menu.namaMenu),
                      );
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            Text('Harga Menu: ${selectedMenu?.hargaMenu ?? ""}'),
            SizedBox(height: 16),
            Text('Jumlah Pesanan: $jumlahPesanan'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (jumlahPesanan > 0) jumlahPesanan--;
                    });
                  },
                ),
                Text('$jumlahPesanan'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      jumlahPesanan++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: idMejaController,
              decoration: InputDecoration(labelText: 'ID Meja'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: namaPelangganController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                AddTransaksiModel addTransaksiModel = AddTransaksiModel(
                  namaPelanggan: namaPelangganController.text,
                  hargaMenu: (selectedMenu?.hargaMenu ?? 0).toInt(),
                  jumlahPesanan: jumlahPesanan,
                  amount: int.parse(amountController.text),
                  idMenu: (selectedMenu?.idMenu ?? 0).toInt(),
                  idMeja: int.parse(idMejaController.text),
                );
                await addTransaksiUseCase.execute(addTransaksiModel);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
