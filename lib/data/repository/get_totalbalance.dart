import 'dart:convert';

import 'package:final_project_flutter_api/data/datasource/remote/Get_Total_Balance.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';


class GetTotalBalanceRepository {
  var getTotalBalanceFromSource = GetTotalBalance();
  Future<TotalBalance> getTotalBalance() async {
    var jsonArray = jsonDecode((await getTotalBalanceFromSource.getTotalBalance()));
    print(jsonArray.toString());
    return TotalBalance.fromJson(jsonArray);

  }
}
