import 'package:final_project_flutter_api/data/model/AddTransaksi/AddTransaksiModel.dart';
import 'package:final_project_flutter_api/data/repository/add_transaksi_repo.dart';

class AddTransaksiUseCase {
  var _transaksiRepository = AddTransaksiRepo();

  Future<void> execute(AddTransaksiModel addTransaksiModel) async {
    await _transaksiRepository.addTransaksi(addTransaksiModel);
  }
}