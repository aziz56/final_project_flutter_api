import 'package:final_project_flutter_api/Domain/entities/GetTransaksiEntity.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:final_project_flutter_api/data/repository/repository.dart';

class GetTransaksiUseCase {
  // ignore: non_constant_identifier_names
  var repository = GetRepository();

//buat methodnya

  Future<GetTransaksiModel> execute () async {
    var response = await repository.getAllTransaction();
    return response;
  }

  GetTransaksiEntity mapToEntity(GetTransaksiModel model) {
    return GetTransaksiEntity(
      id: model.id,
      namaMenu: model.namaMenu,
      hargaMenu: model.hargaMenu,
      jumlahPesanan: model.jumlahPesanan,
      totalPenjualan: model.totalPenjualan,
      namaPelanggan: model.namaPelanggan,
      kembalian: model.kembalian,
      amount: model.amount,
      noMeja: model.noMeja,
    );
  }
}
