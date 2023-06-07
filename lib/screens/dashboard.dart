import 'package:ecommerce_app/dashboard_components/index.dart';
import 'package:ecommerce_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_store.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                globalStore.setPageIndex(index: 0);
                Navigator.pushReplacementNamed(context, '/welcome_screen');
              },
            ),
          ],
          title: const Text('Dashboard'),
        ),
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            dashboardCard(
              title: 'MY STORE',
              icon: Icons.store,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyStore()));
              },
            ),
            dashboardCard(
              icon: Icons.shop_2_outlined,
              title: 'Orders'.toUpperCase(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupplierOrders()));
              },
            ),
            dashboardCard(
              icon: Icons.edit,
              title: 'Edit Profile'.toUpperCase(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()));
              },
            ),
            dashboardCard(
              icon: Icons.settings,
              title: 'MANAGE PRODUCTS',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            dashboardCard(
              icon: Icons.attach_money,
              title: 'BALANCE',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupplierBalance()));
              },
            ),
            dashboardCard(
              icon: Icons.show_chart,
              title: 'STATISTICS',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupplierStatistics()));
              },
            ),
          ],
        ));
  }
}

Padding dashboardCard(
    {required IconData icon, String title = '', required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: onTap,
      child: Card(
          shadowColor: secondary,
          elevation: 10,
          color: primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  icon,
                  size: 65,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              )
            ],
          )),
    ),
  );
}
