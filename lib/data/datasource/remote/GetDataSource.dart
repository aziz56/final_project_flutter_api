import 'dart:convert';
import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
import 'package:http/http.dart' as http;

class GetDataSource {
  Future<GetTransaksiModel> getDataSource() async {
    var url = 'http://localhost:5262/api/Transaksi/GetTransaksi';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      return data;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
