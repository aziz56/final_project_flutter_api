import 'package:http/http.dart' as http;
class GetAllMenuData{
  Future<String> getAllMenuData() async 
  {
    var url = 'https://app.actualsolusi.com/bsi/pos_resto/api/Transaksi/GetAllMenu';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      print(response.statusCode);
      return data;
    } else {
      throw Exception('Failed to get data');
    }

  }
}