import 'package:final_project_flutter_api/Domain/entities/GetTransaksiEntity.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:final_project_flutter_api/data/repository/getAll_Transaksi_repository.dart';

class GetTransaksiUseCase {
  // ignore: non_constant_identifier_names
  var repository = GetRepository();

//buat methodnya

  Future<List<GetTransaksiModel>> execute() async {
    var response = await repository.getAllTransaction();
    return response;
  }
}
