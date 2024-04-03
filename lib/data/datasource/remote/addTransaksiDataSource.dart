import 'dart:convert';
import 'package:final_project_flutter_api/data/model/AddTransaksi/AddTransaksiModel.dart';
import 'package:http/http.dart' as http;

class AddTransaksiDataSource {
  Future<void> addTransaksiData(AddTransaksiModel addTransaksiModel) async {
    var url = 'http://localhost:5262/api/Transaksi/InsertTransaksi';
    var body = json.encode(addTransaksiModel.toJson()); // Convert model to JSON
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode
      ({
        'id_meja': addTransaksiModel.idMeja,
        'id_menu': addTransaksiModel.idMenu,
        'jumlah_pesanan': addTransaksiModel.jumlahPesanan,
        'amount': addTransaksiModel.amount,
        'harga_menu' : addTransaksiModel.hargaMenu,
        'nama_pelanggan': addTransaksiModel.namaPelanggan,


        
      })
      );
    if (response.statusCode == 200) {
      // Handle successful response
      // For example, you can log the response body
      print(response.body);
    } else {
      throw Exception('Failed to add data');
    }
  }
}
