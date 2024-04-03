//GetAllTransaksiDenganListview
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:final_project_flutter_api/presentation/provider/TransaksiProvider.dart';
import 'package:flutter/material.dart';
//import UseCase
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:provider/provider.dart';
//import GetTransaksientity


//Make a stateless widget that fetch data from use case

class TransaksiView extends StatelessWidget {
var getTransaksiUseCase = GetTransaksiUseCase();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Transaksi'),
       ),
       body: FutureBuilder<List<GetTransaksiModel>>(
         future: getTransaksiUseCase.execute(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(
               child: CircularProgressIndicator(),
             );
           } else if (snapshot.hasData) {
             return ListView.builder(
           itemCount: snapshot.data!.length,
           itemBuilder: (context, index) {
           return ListTile(
             title: Text(snapshot.data![index].namaMenu),
             subtitle: Text(snapshot.data![index].hargaMenu.toString()),
           );
           },
         );
           } else {
             return Center(
               child: Text('Error'),
             );
           }
         },
       ),
     );
   }
}
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


