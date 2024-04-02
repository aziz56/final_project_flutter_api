// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'package:final_project_flutter_api/data/datasource/remote/GetDataSource.dart';

import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';

class GetRepository {
  var _dataSource = GetDataSource();

  Future<List<GetTransaksiModel>> getAllTransaction() async {
    var response = await _dataSource.getDataSource();
    var listAllTransaction = <GetTransaksiModel>[];
    for (var item in listAllTransaction) 
    {
      listAllTransaction.add(GetTransaksiModel.fromJson(item as Map<String, dynamic>));
    }
    return listAllTransaction;
  }


}
