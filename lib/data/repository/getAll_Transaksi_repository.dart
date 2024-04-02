// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'dart:convert';
import 'dart:js_util';

import 'package:final_project_flutter_api/data/datasource/remote/GetDataSource.dart';

import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';

class GetRepository {
  var _dataSource = GetDataSource();

  // Future<List<GetTransaksiModel>> getAllTransaction() async {
  //   try {
  //     var response = await _dataSource.getDataSource();

  //     var jsonArray = jsonDecode(await response).ToList(response);
  //     for (var item in jsonArray) {
  //      await GetTransaksiModel.fromJson(item);
      
  //     }
  //     print('jsonArray : $jsonArray');
  //     return jsonArray;
  //   } catch (e) {
  //     throw e;
  //   }

  Future<GetTransaksiModel> getAllTransaction() async {
    var response = await _dataSource.getDataSource();
    var jsonArray = jsonDecode(response);
    print('jsonArray : $jsonArray');
    return GetTransaksiModel.fromJson(jsonArray);
    

    // List<GetTransaksiModel> list = [];
    // for (var item in jsonArray) {
    //   list.add(GetTransaksiModel.fromJson(item));
    // }
    // print('listrepo : $list');
    // return list;
  }
}
