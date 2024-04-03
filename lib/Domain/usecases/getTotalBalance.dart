import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:final_project_flutter_api/data/repository/get_totalbalance.dart';

class GetTotalBalanceUseCase {
  var getTotalBalanceRepository = GetTotalBalanceRepository();
  Future<int> execute() async {
      var response = await getTotalBalanceRepository.getTotalBalance();
    return response as int;
  }
}
