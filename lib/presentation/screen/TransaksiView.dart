//GetAllTransaksiDenganListview
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:flutter/material.dart';
//import UseCase
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
//import GetTransaksientity

import 'package:final_project_flutter_api/Domain/entities/GetTransaksiEntity.dart';

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



