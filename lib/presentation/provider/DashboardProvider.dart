import 'package:final_project_flutter_api/Domain/usecases/getTotalBalance.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  final GetTotalBalanceUseCase getTotalBalanceUseCase;
  DashBoardProvider(this.getTotalBalanceUseCase);
 // Change this to TotalBalance type

  Future<int> fetchTotalBalance() async {
    try {
      var totalBalance = await getTotalBalanceUseCase.execute();
      return totalBalance;

    } catch (e) {
      print(e);
      return 0; // return a default value
    }
    notifyListeners();
  }
}