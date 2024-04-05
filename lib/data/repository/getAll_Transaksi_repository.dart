// Date: 08-08-2021 12:00:00
// Creator: Muhammad Abdul Aziz

import 'dart:convert';

import 'package:final_project_flutter_api/data/datasource/remote/GetDataSource.dart';

import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';

// class GetRepository {
//   var _dataSource = GetDataSource();
//   Future<List<GetTransaksiModel>> getAllTransaction() async {
//     var response = await _dataSource.getDataSource();
//     print('response : $response');
//     var jsonArray = jsonDecode(response).Tolist();
//     print('jsonArray : $jsonArray');
//     return jsonArray;

//     // List<GetTransaksiModel> list = [];
//     // for (var item in jsonArray) {
//     //   list.add(GetTransaksiModel.fromJson(item));
//     // }
//     // print('listrepo : $list');
//     // return list;
//   }
// }

// class GetRepository {
//   var _dataSource = GetDataSource();

//   Future<List<GetTransaksiModel>> getAllTransaction() async {
//     var response = await _dataSource.getDataSource();
//     print('response : $response');
//     // Parsing JSON response to List of GetTransaksiModel
//     List<dynamic> jsonArray = jsonDecode(response);
//     List<GetTransaksiModel> transactionList = jsonArray.map((item) => GetTransaksiModel.fromJson(item)).toList();
//     print('transactionList : $transactionList');
//     return transactionList;
//     //print('transactionList : $transactionList');
//   }
// }
class GetRepository {
  Future<List<GetTransaksiModel>> getAllTransaksi() async {
    var dataSource = GetDataSource();
    var response = await dataSource.getDataSource();
    // print(response.toString());
    print(
        "======================================================================");

    List<dynamic> jsonArray = json.decode(response);
    print(jsonArray.toString());
    List<GetTransaksiModel> transactionList = (jsonArray)
        .map((item) => GetTransaksiModel.fromJson(item as Map<String, dynamic>))
        .toList();
    print(
        "======================================================================");
    print(transactionList.toString());

    // var listArticle = <GetTransaksiModel>[];
    // for (var item in jsonDecode(response)) {
    //   listArticle.add(GetTransaksiModel.fromJson(item));
    // }
    // print(listArticle.toString());
    return transactionList;
  }
}
