import 'dart:convert';

import 'package:final_project_flutter_api/data/datasource/remote/Get_All_Menu.dart';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetModelMenu.dart';

class GetAllMenuRep{
  Future<List<MenuModel>> getAllMenu() async {
    var _dataSource = GetAllMenuData();
    
    var response = await _dataSource.getAllMenuData();
    // print(response.toString());
    print(
        "======================================================================");

    List<dynamic> jsonArray = json.decode(response);
    print(jsonArray.toString());
    List<MenuModel> menuList = (jsonArray)
        .map((item) => MenuModel.fromJson(item as Map<String, dynamic>))
        .toList();
    print(
        "======================================================================");
    print(menuList.toString());

    // var listArticle = <GetTransaksiModel>[];
    // for (var item in jsonDecode(response)) {
    //   listArticle.add(GetTransaksiModel.fromJson(item));
    // }
    // print(listArticle.toString());
    return menuList;
  }
}