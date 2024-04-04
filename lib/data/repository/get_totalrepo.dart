import 'package:final_project_flutter_api/data/datasource/remote/GetTotalTransaction.dart';

class GetTotalTransaksiRepo
{
  var totalTransaksiData = GetTotalTransaction();
  Future<int> getTotalTransaksi() async
  {
    var totalTransaksiString = await totalTransaksiData.getTotalTransaction();
    print('TotalTransaksiStringRepo: ${totalTransaksiString}');
    //
    int totalTransaksi = int.parse(totalTransaksiString);
    print('TotalTransaksiRepo: ${totalTransaksi}');
    return totalTransaksi;
  
  }

}