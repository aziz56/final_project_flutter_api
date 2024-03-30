// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'package:final_project_flutter_api/data/datasource.dart';

class Repository
{
  final DataSource dataSource;
  Repository({required this.dataSource});
  // This function will return the data from the DataSource
  Future<String> getRepository() async {
    return await dataSource.getDataSource();
  }
  
}