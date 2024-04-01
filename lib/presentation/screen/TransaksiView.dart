// //Make A Table from the data that we get from the API

// import 'package:final_project_flutter_api/Domain/entities/GetTransaksiEntity.dart';
// import 'package:final_project_flutter_api/Domain/usecases/get_transaksi_usecase.dart';
// import 'package:final_project_flutter_api/data/model/GetTransaksi/GetTransaksiModel.dart';
// import 'package:final_project_flutter_api/presentation/provider/TransaksiProvider.dart';
// import 'package:final_project_flutter_api/presentation/widgets/GetAllWidget.dart';
// import 'package:flutter/material.dart';
// import 'package:final_project_flutter_api/data/repository/repository.dart';
// import 'package:final_project_flutter_api/data/datasource/remote/GetDataSource.dart';
// import 'package:final_project_flutter_api/Domain/GetTransactionModel.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:provider/provider.dart';

// //Get Data From Model
// class TransaksiView extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transaksi'),
//       ),
//       body: ChangeNotifierProvider(
//         create: (context) => GetAllTransaksiProvider(),
//         child: Consumer<GetAllTransaksiProvider>(
//           builder: (context, provider, child) {
//             return PagedListView<int, GetTransaksiUseCase>(
//               pagingController: provider.pagingController,
//               builderDelegate: PagedChildBuilderDelegate<GetTransaksiUseCase>(
//                 itemBuilder: (context, item, index) => WidgetTransaksi(
//                   getTransaksiModel: item as GetTransaksiModel,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }