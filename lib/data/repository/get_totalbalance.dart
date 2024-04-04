import 'dart:convert';

import 'package:final_project_flutter_api/data/datasource/remote/Get_Total_Balance.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';

class GetTotalBalanceRepository {
  var getTotalBalanceFromSource = GetTotalBalance();
  Future<double> getTotalBalance() async {
    var balanceString = await getTotalBalanceFromSource.getTotalBalance();
    print('BalanceStringRepo: ${balanceString}');
    // Konversi string ke double
    double balance = double.parse(balanceString);
    print('BalanceRepo: ${balance}');
    return balance;
  }
}

