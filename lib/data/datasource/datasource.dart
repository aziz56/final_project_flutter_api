import 'package:http/http.dart' as http;

class DataSource {
  Future<String> getDataSource() async {
    var url = 'http://localhost:5262/api/Transaksi/GetTransaksi';
    var response = await http.get(Uri.parse(url));

  

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw 'Error in loading data';
    }
  }
}
