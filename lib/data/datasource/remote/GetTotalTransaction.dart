import 'package:http/http.dart' as http;

class GetTotalTransaction {
  Future<String> getTotalTransaction() async {
    var url = 'http://localhost:5262/api/TransaksiFromEF/GetCountTotalTransaction';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var data = response.body;
      // print(response.body);
      print(response.statusCode);
      return data;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
