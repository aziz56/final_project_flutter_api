import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTotalBalance.dart';
import 'package:final_project_flutter_api/data/repository/get_totalbalance.dart';

class GetTotalBalanceUseCase {
  var getTotalBalanceRepository = GetTotalBalanceRepository();
  Future<double> execute() async {
    var response = await getTotalBalanceRepository.getTotalBalance();
    print('responsebalanceFromUseCase: ${response}');
    return response;
  }
}
