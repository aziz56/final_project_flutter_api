// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'package:final_project_flutter_api/data/datasource/remote/GetDataSource.dart';

import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';

class GetRepository {
  var _dataSource = GetDataSource();

  Future<GetTransaksiModel> getAllTransaction() async {
    return await _dataSource.getDataSource();
  }
}
