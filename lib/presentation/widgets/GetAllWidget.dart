import 'package:final_project_flutter_api/Domain/entities/GetTransaksiEntity.dart';
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetTransaksi extends StatelessWidget {
  final GetTransaksiModel getTransaksiModel;

  WidgetTransaksi({required this.getTransaksiModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FoodNutritionDetailScreen(),
        //   ),
        // );
      },
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                  title: Text(getTransaksiModel.namaMenu,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Harga Menu: ${getTransaksiModel.hargaMenu} Rupiah'))
            ],
          ),
        ),
      ),
    );
  }
}
