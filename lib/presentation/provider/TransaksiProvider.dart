import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GetAllTransaksiProvider extends ChangeNotifier {
  var getAllTransaksi = GetTransaksiUseCase();

  GetAllTransaksiProvider(GetTransaksiUseCase getTransaksiUseCase);
  Future<void> getTransaksi() async {
    try 
    {
    
    
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
  

}
