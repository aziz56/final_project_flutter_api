import 'package:final_project_flutter_api/Domain/usecases/getTotalBalance.dart';
import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashBoardProvider extends ChangeNotifier {
  final GetTotalBalanceUseCase getTotalBalanceUseCase;
  DashBoardProvider(this.getTotalBalanceUseCase);

  TotalBalance? totalBalance; // Change this to TotalBalance type

  Future<void> fetchTotalBalance() async {
    try {
      totalBalance = await getTotalBalanceUseCase.execute();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}

