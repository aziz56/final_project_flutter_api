import 'package:final_project_flutter_api/Domain/usecases/getTotalBalance.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {

  var getTotalBalanceUseCase = GetTotalBalanceUseCase();

  Future<int> fetchTotalBalance() async {
    try {
      var totalBalance = await getTotalBalanceUseCase.execute();
      notifyListeners(); // Move notifyListeners inside try block
      return totalBalance;
    } catch (e) {
      print(e);
      return 0; // return a default value
    }
  }

  void updateTotalBalance() {
    notifyListeners();
  }

}