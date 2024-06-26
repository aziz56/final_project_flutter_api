import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:flutter/foundation.dart';

// class DashBoardProvider extends ChangeNotifier {
//   final GetTotalBalanceUseCase getTotalBalanceUseCase;
//   DashBoardProvider(this.getTotalBalanceUseCase);

//   TotalBalance? totalBalance; // Change this to TotalBalance type

//   Future<void> fetchTotalBalance() async {
//     try {
//       totalBalance = await getTotalBalanceUseCase.execute();
//     } catch (e) {
//       print(e);
//     }
//     notifyListeners();
//   }
// }

class TransaksiProvider extends ChangeNotifier {
  final GetTransaksiUseCase getTransaksiUseCase;
  TransaksiProvider(this.getTransaksiUseCase);

  Future<void> fetchTransaksi() async {
    try {
      final response = await getTransaksiUseCase.execute();
      print(response);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
