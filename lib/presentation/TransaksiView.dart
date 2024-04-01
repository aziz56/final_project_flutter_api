//Make A Table from the data that we get from the API

import 'package:flutter/material.dart';
import 'package:final_project_flutter_api/data/repository/repository.dart';
import 'package:final_project_flutter_api/data/datasource/datasource.dart';
import 'package:final_project_flutter_api/Domain/GetTransactionModel.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
      ),
      body: FutureBuilder<ModelPenjualan>(
        future: Repository(dataSource: DataSource()).getRepository(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error in loading data'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.namaPelanggan),
                    subtitle: Text(snapshot.data!.namaMenu),
                    trailing: Text(snapshot.data!.totalPenjualan.toString()),
                  ),
                );
              },
            );
          }
        },
      )
      ,
    );
  }
}
