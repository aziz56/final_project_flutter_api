import 'package:final_project_flutter_api/presentation/provider/DashboardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Card(
          child: Consumer<DashBoardProvider>(
            builder: (context, provider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Dashboard'),
                  ElevatedButton(
                    onPressed: () async {
                      await provider.fetchTotalBalance();
                    },
                    child: Text('Get Total Balance'),
                  ),
                  Consumer<DashBoardProvider>(
                    builder: (context, provider, _) {
                      return Text(
                          'Total Balance: \$${provider.totalBalance?.balance ?? 0}'); // Assuming balance is an int property of TotalBalance
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
