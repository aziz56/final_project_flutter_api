import 'package:final_project_flutter_api/data/repository/get_totalrepo.dart';

class GetTotalTransaksiUseCase {
  var totalTransakiRepo = GetTotalTransaksiRepo();
  Future<int> execute() async {
    var response = await totalTransakiRepo.getTotalTransaksi();
    print('responseTotalTransaksiFromUseCase: ${response}');
    return response;
  }
}
