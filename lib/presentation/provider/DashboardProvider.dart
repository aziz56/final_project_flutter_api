import 'package:final_project_flutter_api/Domain/usecases/getTotalBalance.dart';
import 'package:final_project_flutter_api/Domain/usecases/getTotalCountTransaksiUseCase.dart';
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  var getTotalBalanceUseCase = GetTotalBalanceUseCase();
  var getTotalTransaksiUseCase = GetTotalTransaksiUseCase();
  var getTransaksiUseCase = GetTransaksiUseCase();

  Future<double> fetchTotalBalance() async {
    try {
      var totalBalance = await getTotalBalanceUseCase.execute();
      print('totalBalance: $totalBalance');
      // Moved inside try block
      return totalBalance;
    } catch (e) {
      print(e);
      return 0; // return a default value
    }
  }

  Future<int> fetchTotalTransaksi() async {
    try {
      var totalTransaksi = await getTotalTransaksiUseCase.execute();
      print('totalTransaksi: $totalTransaksi');
      // Moved inside try block
      return totalTransaksi;
    } catch (e) {
      print(e);
      return 0; // return a default value
    }
  }

}
