import 'dart:convert';

import 'package:final_project_flutter_api/data/datasource/remote/Get_Total_Balance.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';

class GetTotalBalanceRepository {
  var getTotalBalanceFromSource = GetTotalBalance();
  Future<int> getTotalBalance() async {
    var jsonArray =
        jsonDecode((await getTotalBalanceFromSource.getTotalBalance()));
    TotalBalance totalBalance = TotalBalance(balance: int.parse(jsonArray));
    return totalBalance.balance;
    // return TotalBalance.fromJson(jsonArray) as int;
  }
}
