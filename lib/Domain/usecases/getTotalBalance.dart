import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:final_project_flutter_api/data/repository/get_totalbalance.dart';

class GetTotalBalanceUseCase {
  var getTotalBalanceRepository = GetTotalBalanceRepository();
  Future<TotalBalance> execute() async {
    return getTotalBalanceRepository.getTotalBalance();
  }
}
