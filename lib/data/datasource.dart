import 'package:http/http.dart' as http;

class DataSource{
  Future<String> getDataSource() async {
    var url = 'https://api.covid19india.org/data.json';
    var response = await http.get(Uri.parse(url));
    
    if(response.statusCode == 200){
      return response.body;
    }else{
      throw 'Error in loading data';
    }
  }
}