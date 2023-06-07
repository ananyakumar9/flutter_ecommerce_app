import 'package:ecommerce_app/utility/constants.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
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
            dashboardCard(title: 'MY STORE', icon: Icons.store),
            dashboardCard(
              icon: Icons.shop_2_outlined,
              title: 'Orders'.toUpperCase(),
            ),
            dashboardCard(
              icon: Icons.edit,
              title: 'Edit Profile'.toUpperCase(),
            ),
            dashboardCard(icon: Icons.settings, title: 'MANAGE PRODUCTS'),
            dashboardCard(icon: Icons.attach_money, title: 'BALANCE'),
            dashboardCard(icon: Icons.show_chart, title: 'STATISTICS'),
          ],
        ));
  }
}

Padding dashboardCard({required IconData icon, String title = ''}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {},
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
