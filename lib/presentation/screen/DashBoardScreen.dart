import 'package:final_project_flutter_api/presentation/provider/DashboardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // You can set decoration, width, height, etc. for the Container here
      child: Scaffold(
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
                        return FutureBuilder<double>(
                          future: provider.fetchTotalBalance(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return Text(
                                'Total Balance: \$${(snapshot.data ?? 0).toString()}',
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
