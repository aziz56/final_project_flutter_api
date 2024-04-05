import 'package:http/http.dart' as http;

class GetDataSource {
  Future<String> getDataSource() async {
    var url = 'https://app.actualsolusi.com/bsi/pos_resto/api/Transaksi/GetTransaksi';
    var response = await http.get(Uri.parse(url), 
    headers: <String, String>
    {
      'accept': '*/*',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    
    );

    if (response.statusCode == 200) {
    print('responsebalanceFromData: ${response.body}');
      //  print(response.statusCode);
      return response.body;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
