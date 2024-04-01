// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'package:final_project_flutter_api/data/datasource/datasource.dart';
import 'package:final_project_flutter_api/Domain/GetTransactionModel.dart';

class Repository
{
  final DataSource dataSource;
  Repository({required this.dataSource});
  // This function  will return the data from the DataSource and have ModelPenjualan as the return type
  Future<ModelPenjualan> getRepository() async {
    String data = await dataSource.getDataSource();
    return modelPenjualanFromJson(data);
  }
}