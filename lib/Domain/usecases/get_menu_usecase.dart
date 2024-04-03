import 'package:final_project_flutter_api/data/model/GetTransaksi/GetModelMenu.dart';
import 'package:final_project_flutter_api/data/repository/getAllMenuRepo.dart';

class GetAllMenuUseCase {
  var menuRepository = GetAllMenuRep();
  Future<List<MenuModel>> execute() async {
    var response = await menuRepository.getAllMenu();
    return response;
  }
}
